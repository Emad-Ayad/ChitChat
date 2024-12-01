import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({this.onChanged ,this.hintText});

  String? hintText;
  Function(String)? onChanged;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if(data!.isEmpty){
          return 'This Field is Required ';
        }
      },
      onChanged: onChanged,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText:hintText ,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}
