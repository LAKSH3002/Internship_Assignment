// This is the splash screen which appears when the app starts
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:myinternshipapp/Screens/Signup.dart';

class Welcomescreen extends StatefulWidget {
  const Welcomescreen({super.key});

  @override
  State<Welcomescreen> createState() => _WelcomescreenState();
}

class _WelcomescreenState extends State<Welcomescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.deepPurple,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.deepPurple,
        // Animated Splash Screen
        child: AnimatedSplashScreen(
            duration: 3000,
            backgroundColor: Colors.deepPurple,
            // splash - is the animation.
            splash: const Text(
              "WELCOME",
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.greenAccent,
                  letterSpacing: 4,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
            // The Navigation to the next Screen and then Transition to reach there.
            nextScreen: const Signup(),
            splashTransition: SplashTransition.fadeTransition),
      ),
    );
  }
}
