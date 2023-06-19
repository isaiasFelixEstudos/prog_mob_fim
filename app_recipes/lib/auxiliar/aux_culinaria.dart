import 'package:flutter/material.dart';
import 'package:app_recipes/funcoes/apis.dart';

class EstruturaCulinarias extends StatefulWidget {
  @override
  _EstruturaCulinariasState createState() => _EstruturaCulinariasState();
}

class _EstruturaCulinariasState extends State<EstruturaCulinarias> {
  List<String> cuisines = [];

  @override
  void initState() {
    super.initState();
    CuisineService.fetchCuisines().then((cuisines) {
      setState(() {
        this.cuisines = cuisines;
      });
    }).catchError((error) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Erro ao carregar paises.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Use the cuisines data in your widget
    return Scaffold(
      body: ListView.builder(
        itemCount: cuisines.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(cuisines[index]),
            ),
          );
        },
      ),
    );
  }
}
