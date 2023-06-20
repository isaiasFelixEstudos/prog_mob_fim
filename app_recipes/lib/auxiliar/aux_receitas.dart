import 'package:flutter/material.dart';
import 'package:app_recipes/funcoes/apis.dart';
import 'package:app_recipes/subpaginas/receitas.dart';
import 'package:app_recipes/subpaginas/receita.dart';

class ReceitasAll extends StatefulWidget {
  const ReceitasAll({super.key});

  @override
  State<ReceitasAll> createState() => _ReceitasAllState();
}

class _ReceitasAllState extends State<ReceitasAll> {
  List<dynamic> categories = [];
  void initState() {
    super.initState();
    BuscarReceitas().then((result) {
      setState(() {
        categories = result;
      });
    }).catchError((error) {
      print('Erro ao carregar as categorias de receitas: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(categories[index]['strMeal']),
              leading: Image.network(categories[index]['strMealThumb']),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipePage(meal: categories[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
