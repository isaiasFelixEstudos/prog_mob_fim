import 'package:flutter/material.dart';
import 'package:app_recipes/auxiliar/aux_categorias.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WidgetSlider(),
    );
  }
}
