import 'package:flutter/material.dart';
import 'package:app_recipes/custom/appBarCustom.dart';
import 'package:app_recipes/custom/drawerCustom.dart';
import 'package:app_recipes/auxiliar/aux_cadastrarUsuario.dart';

class CadUser extends StatefulWidget {
  const CadUser({super.key});

  @override
  State<CadUser> createState() => _CadUserState();
}

class _CadUserState extends State<CadUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Cadastrar Usuário'),
      drawer: CustomDrawer(),
      body: CadastroUser(),
    );
  }
}
