import 'package:flutter/material.dart';
import 'package:app_recipes/custom/appBarCustom.dart';
import 'package:app_recipes/custom/drawerCustom.dart';
import 'package:app_recipes/auxiliar/aux_pesquisa.dart';

class PgPesquisa extends StatefulWidget {
  const PgPesquisa({super.key});

  @override
  State<PgPesquisa> createState() => _PgPesquisaState();
}

class _PgPesquisaState extends State<PgPesquisa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Pesquisar Receita'),
      drawer: CustomDrawer(),
      body: RecipeSearch(),
    );
  }
}
