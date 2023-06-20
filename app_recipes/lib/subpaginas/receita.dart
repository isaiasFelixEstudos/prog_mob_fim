import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:app_recipes/custom/appBarCustom.dart';
import 'package:app_recipes/custom/drawerCustom.dart';

class RecipePage extends StatefulWidget {
  final Map<String, dynamic> meal;

  const RecipePage({required this.meal});

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  Map<String, dynamic>? recipeData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchRecipe();
  }

  Future<void> fetchRecipe() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://www.themealdb.com/api/json/v1/1/lookup.php?i=${widget.meal['idMeal']}'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final recipeData = data['meals'][0];
        setState(() {
          this.recipeData = recipeData;
          isLoading = false;
        });
      } else {
        throw Exception('Failed to fetch recipe by ID');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '${recipeData!['strMeal']}'),
      drawer: CustomDrawer(),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : recipeData != null
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.network(
                          recipeData!['strMealThumb'],
                          width: 400,
                          height: 400,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Categoria: ${recipeData!['strCategory']}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Instruções:'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(recipeData!['strInstructions']),
                      ),
                    ],
                  ),
                )
              : Center(child: Text('Não ha receita')),
    );
  }
}
