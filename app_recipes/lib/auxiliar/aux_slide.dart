import 'package:flutter/material.dart';
import 'package:app_recipes/funcoes/apis.dart';
import 'package:app_recipes/subpaginas/receitas.dart';

class WidgetSlider extends StatefulWidget {
  const WidgetSlider({Key? key});

  @override
  State<WidgetSlider> createState() => _WidgetSliderState();
}

class _WidgetSliderState extends State<WidgetSlider> {
  List<dynamic> categories = [];
  void initState() {
    super.initState();
    buscaCategorias().then((result) {
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
                title: Text(categories[index]['strCategory']),
                leading: Image.network(categories[index]['strCategoryThumb']),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecipesPage(
                          category: categories[index]['strCategory']),
                    ),
                  );
                }),
          );
        },
      ),
    );
  }
}
