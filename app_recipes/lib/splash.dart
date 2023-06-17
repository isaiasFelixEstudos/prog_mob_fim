import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'homeScreen.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Aguarde 3 segundos e, em seguida, navegue para a tela inicial
    Timer(Duration(seconds: 3), () {
      Get.off(() => HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.food_bank_rounded,
              size: 200,
            ),
          ],
        ),
      ),
    );
  }
}
