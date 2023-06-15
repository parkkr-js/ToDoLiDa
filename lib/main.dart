import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:note/screens/Login.dart';
import 'package:note/screens/home_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(), // LoginPage를 첫 번째 페이지로 설정
    );
  }
}
