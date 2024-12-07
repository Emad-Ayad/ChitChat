import 'dart:developer';

import 'package:chitchat/util/constant.dart';
import 'package:chitchat/view/widgets/custom_button.dart';
import 'package:chitchat/view/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? email;
  String? password;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
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
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 32),
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
                  child: CustomTextField(
                    hintText: "Email",
                    onChanged: (data) {
                      email = data;
                    },
                  ),
                ),
                CustomTextField(
                  hintText: "Password",
                  onChanged: (data) {
                    password = data;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  contentText: "Login",
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await login();
                        Navigator.pushNamed(context, 'ChatScreen',
                            arguments: email);
                      } on FirebaseAuthException catch (e) {
                        log(e.code);
                        if (e.code == 'invalid-credential') {
                          showSnackBar(
                              context, "your Email or password in wrong !!");
                        } else if (e.code == 'wrong-password') {
                          showSnackBar(context, "You Used a Wrong password !!");
                        }
                      }
                      isLoading = false;
                      setState(() {});
                    }
                  },
                ),
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
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<void> login() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
