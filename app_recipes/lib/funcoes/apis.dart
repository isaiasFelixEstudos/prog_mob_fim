import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>> buscarReceitaPorId(String mealId) async {
  try {
    // variavel response que ira executar a utl com o parametro passado
    final response = await http.get(
      Uri.parse('https://www.themealdb.com/api/json/v1/1/lookup.php?i=$mealId'),
    );
    // condição, se o retorno for 200 ele pega a primeira informação dentro de meals
    if (response.statusCode == 200) {
      // recebe o response e trata como json e guarda na variavel data
      final data = jsonDecode(response.body);
      // pega a informação da posição 0 de dentro do dicionario meals
      final recipeData = data['meals'][0];
      // retorna a receita
      return recipeData;
    } else {
      // retorna isso em caso de erro
      throw Exception('Falha na pesquisa por ID');
    }
  } catch (error) {
    // mostra o erro no cmd
    print('Error: $error');
    throw error;
  }
}

Future<List<dynamic>> buscaCategorias() async {
  // variavel que passa a url da api
  final response = await http
      .get(Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'));
  // condição, se o retorno for 200 ele pega somente as categorias
  if (response.statusCode == 200) {
    // variavel que recebe o response e trata ele como json
    final data = jsonDecode(response.body);
    // retorna os dados em categorias
    return data['categories'];
  } else {
    // retorna isso em caso de erro
    throw Exception('deu erro ao carregar as categorias de receitas');
  }
}

Future<List<dynamic>> buscarReceitasPorCategoria(String category) async {
  // variavel que passa url da api com parametro
  final response = await http.get(Uri.parse(
      'https://www.themealdb.com/api/json/v1/1/filter.php?c=$category'));
  // condição, se o retorno for 200 ele pega a receita
  if (response.statusCode == 200) {
    // trata os dados e guarda como json
    final data = jsonDecode(response.body);
    //  retorna somente a receita do json
    return data['meals'];
  } else {
    // em caso de erro ele volta isso
    throw Exception('Falha ao carregar as receitas da categoria $category');
  }
}

class RecipeApi {
  static Future<List<dynamic>> searchRecipes(String term) async {
    final response = await http.get(Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/search.php?s=$term'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final meals = data['meals'];
      if (meals != null) {
        return List.from(meals);
      } else {
        return [];
      }
    } else {
      print('Status de falha: ${response.statusCode}.');
      return [];
    }
  }
}

class CuisineService {
  static Future<List<String>> fetchCuisines() async {
    final response = await http.get(
      Uri.parse('https://www.themealdb.com/api/json/v1/1/list.php?a=list'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final meals = data['meals'] as List<dynamic>;
      final cuisines = meals.map((meal) => meal['strArea'] as String).toList();
      return cuisines;
    } else {
      throw Exception('Error fetching cuisines');
    }
  }
}
