import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test/screens/home/home.dart';
import 'package:test/screens/login.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  final isSignedIn = false;
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => isSignedIn ? const HomeScreen() : const LoginPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 65),
            child: Image.asset(
              'assets/images/logo.png',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'iPOP Team Tracker',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
          ),
        ],
      ),
    );
  }
}
