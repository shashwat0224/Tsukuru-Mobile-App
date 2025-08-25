import 'dart:async';
// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tsukuru/screens/loginscreen.dart';
// import 'package:tsukuru/screens/templatescreen.dart';
import 'package:tsukuru/widgets/uihelper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blueGrey,
                Color(0XFFB53145),
                Colors.purple,
                Colors.deepPurple,
                Colors.blueAccent,
                Colors.white,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UiHelper.customText(title: 'つくる', size: 45, color: Colors.white),
              SizedBox(height: 10),
              UiHelper.customText(
                title: 'Tsukuru',
                size: 36,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
