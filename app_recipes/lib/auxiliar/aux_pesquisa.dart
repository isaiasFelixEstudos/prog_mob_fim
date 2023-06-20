import 'package:flutter/material.dart';
import 'package:app_recipes/funcoes/apis.dart';
import 'package:app_recipes/subpaginas/receita.dart';

class RecipeSearch extends StatefulWidget {
  const RecipeSearch({Key? key}) : super(key: key);

  @override
  State<RecipeSearch> createState() => _RecipeSearchState();
}

class _RecipeSearchState extends State<RecipeSearch> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _searchController = TextEditingController();
  bool _formValido = false;
  List<dynamic> searchResults = [];

  void _validarFormulario() {
    _formKey.currentState?.validate();
  }

  String _validarEntrada(String? mensagem) {
    if (mensagem == null || mensagem.isEmpty) {
      return 'Preencha o campo';
    } else {
      return '';
    }
  }

  void searchRecipes(BuildContext context) async {
    final term = _searchController.text;
    List<dynamic> results = await RecipeApi.searchRecipes(term);
    setState(() {
      searchResults = results;
    });
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_validarFormulario);
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.removeListener(_validarFormulario);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _searchController,
                    decoration: InputDecoration(
                      errorText: _validarEntrada(_searchController.text),
                      labelText: "Pesquisar ingrediente",
                    ),
                    onChanged: (value) {
                      setState(() {
                        _formValido = value.isNotEmpty;
                      });
                    },
                    validator: (value) => _validarEntrada(value),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      searchRecipes(context);
                    },
                    child: Text('Pesquisar'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                        title: Text(searchResults[index]['strMeal']),
                        subtitle: Text(searchResults[index]['strCategory']),
                        leading: Image.network(
                          searchResults[index]['strMealThumb'],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  RecipePage(meal: searchResults[index]),
                            ),
                          );
                        }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
