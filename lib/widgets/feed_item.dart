import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:groceries_online/services/util.dart';
import 'package:groceries_online/widgets/heart_btn.dart';
import 'package:groceries_online/widgets/text_widget.dart';

class FeedWidget extends StatefulWidget {
  const FeedWidget({super.key});

  @override
  State<FeedWidget> createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    Size size = Utils(context).getscreenSize;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).cardColor,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(12),
          child: Column(
            children: [
              FancyShimmerImage(
                imageUrl:
                    'https://familyneeds.co.in/cdn/shop/products/2_445fc9bd-1bab-4bfb-8d5d-70b692745567_600x600.jpg?v=1600812246',
                height: size.width * 0.21,
                width: size.width * 0.2,
                boxFit: BoxFit.fill,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: 'Title', 
                    color: color, 
                    textSize: 20,
                    isTitle: true,
                    ),
                    HeartBtn()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
