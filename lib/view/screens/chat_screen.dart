import 'package:chitchat/util/constant.dart';
import 'package:chitchat/view/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurple,
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("ChitChat",style: TextStyle(color: Colors.white)),
            Image.asset('assets/images/feather.png',height: 65),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(itemBuilder: (context,index){
              return ChatBubble(text: "I am Chat User");
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.send,color: Colors.white,),
                  filled: true,
                  fillColor: Color(0xFF1E1E1E),
                  hintText:" Message "  ,
                  hintStyle: const TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),
            ),
          )
        ],
      )
    );
  }
}


