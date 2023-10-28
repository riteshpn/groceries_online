import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:groceries_online/services/util.dart';

class HeartBtn extends StatelessWidget {
  const HeartBtn({super.key});

  @override
  Widget build(BuildContext context) {
     final Color color = Utils(context).getColor;
    return   GestureDetector(
                            onTap: () {
                              print('wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
                            },
                            child: Icon(
                              IconlyLight.heart,
                              size: 22,
                              color: color,
                            ),
                          );
  }
}