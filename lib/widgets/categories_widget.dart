import 'package:flutter/material.dart';
import 'package:groceries_online/provider/dark_theme_provider.dart';
import 'package:groceries_online/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget(
      {Key? key,
      required this.catText,
      required this.imgPath,
      required this.Passescolor,})
      : super(key: key);
  final String catText, imgPath;
  final Color   Passescolor;

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    final themeState = Provider.of<DarkThemeProvider>(context);
    double _screenWidth = MediaQuery.of(context).size.width;
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;

    return InkWell(
      onTap: () {
        print('Ssdddddddddnnnnnnnnnnnnn');
      },
      child: Container(
        //  height: _screenWidth * 0.6,
        decoration: BoxDecoration(
          color: Passescolor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color:Passescolor.withOpacity(0.7), width: 2),
        ),
        child: Column(
          children: [
            Container(
              height: _screenWidth * 0.3,
              width: _screenWidth * 0.3,
              decoration:  BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(imgPath),
                fit: BoxFit.fill,
              )),
            ),
            TextWidget(
              text: catText,
              color: color,
              textSize: 20,
              isTitle: true,
            )
          ],
        ),
      ),
    );
  }
}
