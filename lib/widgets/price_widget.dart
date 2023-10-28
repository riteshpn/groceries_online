import 'package:flutter/material.dart';
import 'package:groceries_online/services/util.dart';
import 'package:groceries_online/widgets/text_widget.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    return FittedBox(
      child: Row(
        children: [
          TextWidget(
            text: '1.20\$',
            color: Colors.green,
            textSize: 22,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            '1.00\$',
            style: TextStyle(
              fontSize: 15,
              color: color,
              decoration: TextDecoration.lineThrough,
            ),
          )
        ],
      ),
    );
  }
}
