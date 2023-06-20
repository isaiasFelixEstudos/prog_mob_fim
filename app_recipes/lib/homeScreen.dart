import 'package:flutter/material.dart';
import 'package:app_recipes/custom/appBarCustom.dart';
import 'package:app_recipes/custom/drawerCustom.dart';
import 'paginasHomeScreen/homeApp.dart';
import 'paginasHomeScreen/culinarias.dart';
import 'paginasHomeScreen/favoritos.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _paginaSelecionada = 0;
  List<String> _titulos = ['Home', 'Culinarias', 'Favoritos'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '${_titulos[_paginaSelecionada]}'),
      drawer: CustomDrawer(),
      body: IndexedStack(
        index: _paginaSelecionada,
        children: [
          HomeApp(),
          PgCulinaria(),
          PgFavoritos(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _paginaSelecionada,
        onTap: (int? novoValor) {
          setState(() {
            _paginaSelecionada = novoValor!;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.red,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.food_bank_sharp,
              color: Colors.red,
            ),
            label: 'Culinarias',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
              color: Colors.red,
            ),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
