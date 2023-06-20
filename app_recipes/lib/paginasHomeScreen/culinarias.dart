import 'package:flutter/material.dart';
import 'package:app_recipes/auxiliar/aux_receitas.dart';

class PgCulinaria extends StatefulWidget {
  const PgCulinaria({super.key});

  @override
  State<PgCulinaria> createState() => _PgCulinariaState();
}

class _PgCulinariaState extends State<PgCulinaria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReceitasAll(),
    );
  }
}
