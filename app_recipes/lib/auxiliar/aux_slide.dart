import 'package:flutter/material.dart';

class WidgetSlider extends StatefulWidget {
  const WidgetSlider({Key? key});

  @override
  State<WidgetSlider> createState() => _WidgetSliderState();
}

class _WidgetSliderState extends State<WidgetSlider> {
  List<int> cuisines = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: cuisines.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CircleAvatar(
            child: Text(cuisines[index].toString()),
          );
        },
      ),
    );
  }
}
/*
ListTile(
                title: Text(cuisines[index].toString()),
              ),
*/