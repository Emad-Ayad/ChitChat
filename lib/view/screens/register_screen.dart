import 'package:chitchat/util/constant.dart';
import 'package:chitchat/view/widgets/custom_button.dart';
import 'package:chitchat/view/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? email;

  String? password;

  GlobalKey<FormState> formKey =GlobalKey();

  bool isLoading=false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formKey ,
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
                    Text("Sign Up",
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
                  contentText: "Sign Up",
                  onTap: () async {
                    if(formKey.currentState!.validate()) {
                      isLoading=true;
                      setState(() {});
                      try {
                        await registerUser();
                        showSnackBar(context, "You Signed Up Successfully");
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak--password') {
                          showSnackBar(context, "weak password !!");
                        } else if (e.code == 'email-already-in-use') {
                          showSnackBar(context, "This email is Already used !!");
                        }
                      }
                      isLoading=false;
                      setState(() {});
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an Account ? ",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Login")),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context,String message) {
    ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: email!, password: password!);
  }
}
