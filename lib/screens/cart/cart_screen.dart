import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:groceries_online/screens/cart/cart_widget.dart';
import 'package:groceries_online/services/util.dart';
import 'package:groceries_online/widgets/text_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    Size size = Utils(context).getscreenSize;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: TextWidget(
            text: 'Cart(2)',
            color: Colors.black,
            textSize: 22,
            isTitle: true,
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  IconlyBold.delete,
                  color: Colors.black,
                ))
          ],
        ),
        body: Column(
          children: [
            _checkOut(ctx: context),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (ctx, indes) {
                    return CardWidget();
                  }),
            ),
          ],
        ));
  }

  Widget _checkOut({required BuildContext ctx}) {
    final Color color = Utils(ctx).getColor;
    Size size = Utils(ctx).getscreenSize;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            Material(
              color: Colors.green,
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextWidget(
                      text: 'Order Now', color: Colors.white, textSize: 18),
                ),
              ),
            ),
            Spacer(),
            FittedBox(
              child: TextWidget(
                text: 'Total: \$0.99',
                color: color,
                textSize: 18,
                isTitle: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
