import 'package:flutter/material.dart';
import 'package:app_recipes/custom/appBarCustom.dart';
import 'package:app_recipes/custom/drawerCustom.dart';
import 'package:app_recipes/funcoes/apis.dart';
import 'package:app_recipes/subpaginas/receita.dart';

class RecipesPage extends StatefulWidget {
  final String category;

  const RecipesPage({required this.category});

  @override
  _RecipesPageState createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  List<dynamic> _meals = [];

  @override
  void initState() {
    super.initState();
    _fetchMealsByCategory(widget.category);
  }

  Future<void> _fetchMealsByCategory(String category) async {
    try {
      final meals = await buscarReceitasPorCategoria(category);
      setState(() {
        _meals = meals;
      });
    } catch (e) {
      print('Erro ao buscar as receitas: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Receitas de ${widget.category}'),
      drawer: CustomDrawer(),
      body: _meals.isNotEmpty
          ? ListView.builder(
              itemCount: _meals.length,
              itemBuilder: (context, index) {
                final meal = _meals[index];
                final truncatedMealName = meal['strMeal'].length > 25
                    ? '${meal['strMeal'].substring(0, 25)}...'
                    : meal['strMeal'];
                return Card(
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(truncatedMealName),
                        ),
                        InkWell(
                          onTap: () {
                            print('CircleAvatar pressionado!');
                          },
                          child: CircleAvatar(
                            child: Icon(
                              Icons.star,
                              color: Colors.red,
                            ),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                    leading: Image.network(meal['strMealThumb']),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipePage(meal: meal),
                        ),
                      );
                    },
                  ),
                );
              },
            )
          : Center(
              child: Text('Nenhuma receita encontrada'),
            ),
    );
  }
}
