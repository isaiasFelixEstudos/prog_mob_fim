import 'package:flutter/material.dart';
import 'package:app_recipes/auxiliar/aux_slide.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: 70, // Defina a altura que você quiser aqui
                child: WidgetSlider(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
