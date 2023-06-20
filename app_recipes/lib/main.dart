import 'package:flutter/material.dart';
import 'package:get/get.dart';
// paginas
import 'homeScreen.dart';
import 'splash.dart';
import 'paginas/login.dart';
import 'paginas/perfil.dart';
import 'paginas/cadastrarusuario.dart';
// firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    getPages: [
      GetPage(name: '/splash', page: () => SplashScreen()),
      GetPage(name: '/', page: () => HomeScreen()),
      GetPage(name: '/login', page: () => Login()),
      GetPage(name: '/areuser', page: () => UpdateCadUser()),
      GetPage(name: '/cadusuario', page: () => CadUser()),
    ],
  ));
}
