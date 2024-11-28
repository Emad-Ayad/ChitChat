import 'package:chitchat/util/constant.dart';
import 'package:chitchat/view/widgets/custom_button.dart';
import 'package:chitchat/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                Text("Login",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomTextField(hintText: "Email"),
            ),
            CustomTextField(hintText: "Password"),
            const SizedBox(height: 10,),
            CustomButton(contentText: "Login"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an Account ? ",
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'RegisterScreen');
                    },
                    child: const Text("Sign Up")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
