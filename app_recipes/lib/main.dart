import 'package:flutter/material.dart';
import 'package:get/get.dart';
// paginas
import 'homeScreen.dart';
import 'splash.dart';
import 'paginas/login.dart';
import 'paginas/perfil.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    getPages: [
      GetPage(name: '/splash', page: () => SplashScreen()),
      GetPage(name: '/', page: () => HomeScreen()),
      GetPage(name: '/login', page: () => Login()),
      GetPage(name: '/areuser', page: () => UpdateCadUser()),
    ],
  ));
}
