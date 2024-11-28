import 'package:chitchat/util/constant.dart';
import 'package:chitchat/view/widgets/custom_button.dart';
import 'package:chitchat/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Image.asset(
              "assets/images/feather.png",
              height: 200,
              width: 200,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "ChitChat",
                  style: GoogleFonts.satisfy(
                    textStyle: const TextStyle(color: Colors.white, fontSize: 32),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 75),
            const Row(
              children: [
                Text("Sign Up",style:TextStyle(color: Colors.white, fontSize: 20)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomTextField(hintText: "Email"),
            ),
            CustomTextField(hintText: "Password"),
            SizedBox(height: 10,),
            CustomButton(contentText: "Sign Up"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an Account ? ",style: TextStyle(color: Colors.white),),
                TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child: const Text("Login")),
              ],
            ),
          ],
        ),
      ),
    );;
  }
}
