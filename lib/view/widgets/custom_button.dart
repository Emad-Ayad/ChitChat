import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({required this.contentText});

  String? contentText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
            child: Text(
          contentText!,
          style: TextStyle(color: Colors.deepPurpleAccent,fontSize: 18,fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
