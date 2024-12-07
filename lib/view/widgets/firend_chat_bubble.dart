import 'package:chitchat/model/message_model.dart';
import 'package:chitchat/util/constant.dart';
import 'package:flutter/material.dart';

class FriendChatBubble extends StatelessWidget {
   FriendChatBubble({super.key, required this.message});
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(14),
        decoration: const BoxDecoration(
          color: lightBlack,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: Text(
          message.message,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
