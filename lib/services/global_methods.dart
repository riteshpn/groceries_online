import 'package:flutter/material.dart';

class GlobalMethods{
   navigateTo({required BuildContext ctx,required String routeName,required }){
    Navigator.pushNamed(ctx, routeName);

  }
}