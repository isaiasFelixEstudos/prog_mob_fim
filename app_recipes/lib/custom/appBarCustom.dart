import 'package:flutter/material.dart';
//import 'package:get/get.dart';
//import 'package:projeto_final/paginas/search.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.red,
      title: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.food_bank_rounded,
              color: Colors.black,
            ),
            SizedBox(width: 8),
            Text(title),
            SizedBox(width: 8),
            Icon(
              Icons.food_bank_rounded,
              color: Colors.black,
            ),
          ],
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            //Get.off(SearchRecipe());
          },
          child: Icon(Icons.search),
        ),
      ],
    );
  }
}
