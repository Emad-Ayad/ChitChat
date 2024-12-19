import 'package:chitchat/model/message_model.dart';
import 'package:chitchat/util/constant.dart';
import 'package:chitchat/view/widgets/chat_bubble.dart';
import 'package:chitchat/view/widgets/firend_chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController controller = TextEditingController();
  final ScrollController _controller = ScrollController();

  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('created at:', descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MessageModel> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(MessageModel.fromJson(snapshot.data!.docs[i]));
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
                  child: ListView.builder(
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
                            _submitMessage(controller.text,email);
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
        } else {
          return const Scaffold(
            backgroundColor: kPrimaryColor,
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  void _submitMessage(String data, Object? email) {
    messages
        .add({'messages': data, 'created at:': DateTime.now(), 'id': email});
    controller.clear();
    _controller.animateTo(0,
        duration: const Duration(milliseconds: 50), curve: Curves.easeIn);
  }
}
