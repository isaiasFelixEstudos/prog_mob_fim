import 'package:flutter/material.dart';
//import 'package:get/get.dart';
//import 'package:projeto_final/paginas/login.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Card(
            child: ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.red,
              ),
              title: Text('Home'),
              onTap: () {
                Navigator.of(context).pushNamed('/home');
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.red,
              ),
              title: Text('Perfil'),
              onTap: () {
                Navigator.of(context).pushNamed('/areuser');
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.account_circle_rounded,
                color: Colors.red,
              ),
              title: Text('Cadastrar Usuário'),
              onTap: () {
                Navigator.of(context).pushNamed('/cadusuario');
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.logout_rounded,
                color: Colors.red,
              ),
              title: Text('Sair'),
              onTap: () {
                //Get.off(Login());
              },
            ),
          ),
        ],
      ),
    );
  }
}
