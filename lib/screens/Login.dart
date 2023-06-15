import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';
import 'package:note/screens/home_screen.dart';
import 'dart:math' as math;
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:note/style/app_style.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Map<String, dynamic> weatherData = {}; // 날씨 데이터를 저장할 맵 변수

  @override
  void initState() {
    super.initState();
  }

  Future<UserCredential?> _signInWithGoogle(BuildContext context) async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential? userCredential =
        await _auth.signInWithCredential(credential);

    if (userCredential != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }

    return userCredential;
  }

  Future<UserCredential?> _signInAnonymously(BuildContext context) async {
    final UserCredential? userCredential = await _auth.signInAnonymously();

    if (userCredential != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }

    return userCredential;
  }

  Future<Map<String, dynamic>> fetchWeatherData() async {
    final response = await http.get(Uri.parse('****'));

    if (response.statusCode == 200) {
      // API 요청이 성공하면 응답을 JSON 형식으로 변환하여 반환합니다.
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch weather data: ${response.statusCode}');
    }
  }

  Widget buildContent() {
    final weather = weatherData['weather'][0];
    final iconCode = weather['icon'];
    final temperature = weatherData['main']['temp'];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          'https://openweathermap.org/img/w/$iconCode.png',
          width: 80,
          height: 80,
        ),
        const SizedBox(height: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weather['main'],
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Cafe24OnePrettyNight',
                fontWeight: FontWeight.bold,
                color: AppStyle.mainColor,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              '$temperature°C',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Cafe24OnePrettyNight',
                fontWeight: FontWeight.bold,
                color: AppStyle.mainColor,
              ),
            ),
          ],
        ),
        Text(
          weather['description'],
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Cafe24OnePrettyNight',
            fontWeight: FontWeight.bold,
            color: AppStyle.mainColor,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.network(
                  'https://assets6.lottiefiles.com/packages/lf20_zavtox71.json',
                  height: 600,
                  width: 600,
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton(
                      onPressed: () {
                        _signInWithGoogle(context);
                      },
                      icon: MdiIcons.google,
                    ),
                    _buildButton(
                      onPressed: () {
                        _signInAnonymously(context);
                      },
                      icon: MdiIcons.incognito,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 245,
            left: 70,
            child: Transform.rotate(
              angle: -25 * math.pi / 180,
              child: AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText(
                    "'ToDo'리다",
                    textStyle: TextStyle(
                      fontFamily: "Cafe24OnePrettyNight",
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: AppStyle.mainColor,
                    ),
                  ),
                ],
                repeatForever: true,
              ),
            ),
          ),
          Positioned(
            top: 30,
            right: 50,
            child: FutureBuilder(
              future: fetchWeatherData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('API 실패!!!');
                } else {
                  weatherData = snapshot.data as Map<String, dynamic>;
                  return buildContent();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
      {required VoidCallback onPressed, required IconData icon}) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: AppStyle.mainColor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Icon(
          icon,
          size: 60,
          color: Colors.white,
        ),
      ),
    );
  }
}
