import 'package:flutter/material.dart';
import 'package:app_recipes/custom/appBarCustom.dart';
import 'package:app_recipes/custom/drawerCustom.dart';
//import 'package:app_recipes/pgHomeScreen/homeapp.dart';
//import 'package:app_recipes/pgHomeScreen/favoritosapp.dart';
//import 'package:app_recipes/pgHomeScreen/naofavoritosapp.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _paginaSelecionada = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Home Screen'),
      drawer: CustomDrawer(),
      body: IndexedStack(
        index: _paginaSelecionada,
        children: [
          //HomeApp(),
          //FavoritosApp(),
          //NaoFavoritosApp(),
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
