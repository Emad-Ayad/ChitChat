import 'package:chitchat/model/message_model.dart';
import 'package:chitchat/util/constant.dart';
import 'package:chitchat/view/cubits/chat_cubit/chat_cubit.dart';
import 'package:chitchat/view/widgets/chat_bubble.dart';
import 'package:chitchat/view/widgets/firend_chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  final ScrollController _controller = ScrollController();
  List<MessageModel> messagesList=[];
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments.toString();


    void _submitMessage(String data, String email) {
      BlocProvider.of<ChatCubit>(context).sendMessage(message: data, email: email);
      controller.clear();
      _controller.animateTo(0,
          duration: const Duration(milliseconds: 50), curve: Curves.easeIn);
    }

    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurple,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("ChitChat", style: TextStyle(color: Colors.white)),
            Image.asset('assets/images/feather.png', height: 65),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                var messagesList=BlocProvider.of<ChatCubit>(context).messagesList;
                return ListView.builder(
                  reverse: true,
                  controller: _controller,
                  itemCount: messagesList.length,
                  itemBuilder: (context, index) {
                    return messagesList[index].id == email
                        ? ChatBubble(
                            message: messagesList[index],
                          )
                        : FriendChatBubble(message: messagesList[index]);
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: controller,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.send),
                    color: Colors.white,
                    onPressed: () {
                      _submitMessage(controller.text, email);
                    },
                  ),
                  filled: true,
                  fillColor: lightBlack,
                  hintText: " Message ",
                  hintStyle: const TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              onSubmitted: (data) {
                _submitMessage(data, email);
              },
            ),
          )
        ],
      ),
    );
  }


}
