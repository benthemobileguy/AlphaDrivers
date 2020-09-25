import 'package:alpha_drivers/theme/brand_colors.dart';
import 'package:flutter/material.dart';
class ConfirmSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 15, //soften the shadow
            spreadRadius: 0.5,
            offset: Offset(
              0.7, //Move to right 10 horizontally
              0.7, //Move to bottom 10 vertically
            ), //Offset
          ), //BoxShadow
        ]
      ),//BoxDecoration
      height: 220,
      child: Column(
        children: <Widget>[
          SizedBox(height: 10,),
          Text(
            'GO ONLINE',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, fontFamily: 'CircularStd',
                color: BrandColors.colorText),
          ), //Text
          SizedBox(height: 20,),
          Text(
            'You are about to go online',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, fontFamily: 'CircularStd',
                color: BrandColors.colorTextLight),
          ), //Text
          Row(
            children: <Widget>[

            ],
          ) //Row
        ],
      ),
    );//Container
  }
}
