import 'package:chitchat/model/message_model.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  ChatBubble({super.key, required this.message});

 final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(14),
        decoration: const BoxDecoration(
          color: Color(0xfffdbf48),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Text(
          message.message,
          style: const TextStyle(
              color: Color(0xFF1E1E1E),
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
