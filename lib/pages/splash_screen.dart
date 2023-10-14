import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cloud_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset('assets/cloud.json'),
      duration: 1000,
      splashIconSize: 250,
      backgroundColor: Colors.black,
      nextScreen: const HomeScreen(),
    );
  }
}
