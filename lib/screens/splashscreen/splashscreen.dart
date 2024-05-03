import 'dart:async';

import 'package:astro/constants/ImageString.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../HomeScreen.dart';
import '../loginsystem/loginscreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  var auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.repeat();
    // Navigate to the next screen after a delay
    Timer(const Duration(seconds: 5), () {
      Get.to(auth.currentUser != null ? const HomeScreen() :   const LoginScreen(),);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Transform.rotate(
          angle: _animation.value * 2 * 3.14, // 360 degrees in radians
          child: Image.asset(ImageString.image4),
        ),
      ),
    );
  }
}