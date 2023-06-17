import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'homeScreen.dart';
import 'splash.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    getPages: [
      GetPage(name: '/splash', page: () => SplashScreen()),
      GetPage(name: '/', page: () => HomeScreen()),
      //GetPage(name: '/areuser', page: () => UpdateCadUser()),
      //GetPage(name: '/culinarias', page: () => PaginaCulianria()),
    ],
  ));
}
