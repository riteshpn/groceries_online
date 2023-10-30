import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:groceries_online/services/util.dart';
import 'package:groceries_online/widgets/heart_btn.dart';
import 'package:groceries_online/widgets/price_widget.dart';
import 'package:groceries_online/widgets/text_widget.dart';

class onSaleWidget extends StatefulWidget {
  const onSaleWidget({Key? key}) : super(key: key);

  @override
  State<onSaleWidget> createState() => _onSaleWidgetState();
}

class _onSaleWidgetState extends State<onSaleWidget> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    final theme = Utils(context).getTheme;
    Size size = Utils(context).getscreenSize;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FancyShimmerImage(
                    imageUrl:
                        'https://familyneeds.co.in/cdn/shop/products/2_445fc9bd-1bab-4bfb-8d5d-70b692745567_600x600.jpg?v=1600812246',
                    height: size.width * 0.22,
                    width: size.width * 0.22,
                    boxFit: BoxFit.fill,
                  ),
                  Column(
                    children: [
                      TextWidget(
                        text: '1KG',
                        color: color,
                        textSize: 22,
                        isTitle: true,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Icon(
                              IconlyLight.bag2,
                              size: 22,
                              color: color,
                            ),
                          ),
                       const HeartBtn()
                        ],
                      ),
                    ],
                  ),
                ],
              ),
             PriceWidget(
                 salePrice: 2.99,
                      price: 5.9,
                      textPrice: '1',
                      isOnSale: true,
              ),
              const SizedBox(
                height: 5,
              ),
              TextWidget(
                text: 'Product Title',
                color: color,
                textSize: 16,
                isTitle: true,
              ),
              const SizedBox(
                height: 5,
              )
            ]),
          ),
        ),
      ),
    );
  }
}
