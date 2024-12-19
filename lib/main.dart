import 'package:chitchat/firebase_options.dart';
import 'package:chitchat/view/cubits/chat_cubit/chat_cubit.dart';
import 'package:chitchat/view/screens/chat_screen.dart';
import 'package:chitchat/view/screens/login_screen.dart';
import 'package:chitchat/view/screens/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          'LoginScreen': (context) => LoginScreen(),
          'RegisterScreen': (context) => RegisterScreen(),
          'ChatScreen': (context) => ChatScreen(),

        },
        initialRoute: 'LoginScreen',
      ),
    );
  }
}
