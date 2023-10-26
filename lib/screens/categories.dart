import 'package:flutter/material.dart';
import 'package:groceries_online/services/util.dart';
import 'package:groceries_online/widgets/categories_widget.dart';
import 'package:groceries_online/widgets/text_widget.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  List<Color> gridColor = [
    Color(0xff53B175),
    Color(0xffF8a44C),
    Color(0xffF7A593),
    Color(0xffD3B0E0),
    Color(0xffFDE598),
    Color(0xffB7DFF5)
  ];

  List<Map<String, dynamic>> catInfo = [
    {
      'imgPath': 'assets/images/cat/fruits.png',
      'catText': 'Fruits',
    },
    {
      'imgPath': 'assets/images/cat/veg.png',
      'catText': 'Vegetables',
    },
    {
      'imgPath': 'assets/images/cat/Spinach.png',
      'catText': 'Herbs',
    },
    {
      'imgPath': 'assets/images/cat/nuts.png',
      'catText': 'Nuts',
    },
    {
      'imgPath': 'assets/images/cat/spices.png',
      'catText': 'Spices',
    },
    {
      'imgPath': 'assets/images/cat/grains.png',
      'catText': 'Grains',
    }
  ];

  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    Color color = utils.getColor;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          title: TextWidget(
            text: 'Categories',
            color: color,
            textSize: 24,
            isTitle: true,
          ),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 240 / 250,
          crossAxisSpacing: 10, //vertical spacing
          mainAxisSpacing: 10, //horizental spacing
          children: List.generate(6, (index) {
            return CategoriesWidget(
              catText: catInfo[index]['catText'],
              imgPath: catInfo[index]['imgPath'],
              Passescolor: gridColor[index],
            );
          }),
        ));
  }
}
