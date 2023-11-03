import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:groceries_online/inner_screen/product_details.dart';
import 'package:groceries_online/services/global_methods.dart';
import 'package:groceries_online/services/util.dart';
import 'package:groceries_online/widgets/heart_btn.dart';
import 'package:groceries_online/widgets/text_widget.dart';

class WishlistWidget extends StatelessWidget {
  const WishlistWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    Size size = Utils(context).getscreenSize;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          GlobalMethods.navigateTo(
              ctx: context, routeName: ProductDetails.routeName);
        },
        child: Container(
          height: size.height * 0.20,
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              border: Border.all(color: color, width: 1),
              borderRadius: BorderRadius.circular(8.0)),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 8),
                width: size.width * 0.2,
                height: size.width * 0.25,
                child: FancyShimmerImage(
                  imageUrl:
                      'https://familyneeds.co.in/cdn/shop/products/2_445fc9bd-1bab-4bfb-8d5d-70b692745567_600x600.jpg?v=1600812246',
                  boxFit: BoxFit.fill,
                ),
              ),
              Column(
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              IconlyLight.bag2,
                              color: color,
                            )),
                        const HeartBtn()
                      ],
                    ),
                  ),
                  Flexible(
                      child: TextWidget(
                    text: 'Title',
                    color: color,
                    textSize: 20,
                    maxLines: 2,
                    isTitle: true,
                  )),
                  const SizedBox(
                    height: 5,
                  ),
                  TextWidget(
                    text: '\$2.59',
                    color: color,
                    textSize: 18,
                    maxLines: 1,
                    isTitle: true,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
