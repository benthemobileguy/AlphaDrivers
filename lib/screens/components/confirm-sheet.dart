import 'package:alpha_drivers/screens/components/custom-circular-button-main.dart';
import 'package:alpha_drivers/theme/brand_colors.dart';
import 'package:flutter/material.dart';

class ConfirmSheet extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onPressed;
  const ConfirmSheet({Key key, this.title,
    this.subtitle,
    this.onPressed}) :
        super(key: key);


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
      ),
      height: 220,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10,),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18,
                  fontFamily: 'CircularStd',
                  fontWeight: FontWeight.w700,
                  color: Colors.brown),
            ),
            SizedBox(height: 20,),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'CircularStd',
                  color: BrandColors.colorTextLight),
            ),
            SizedBox(height: 30,),
            Row(
              children: <Widget>[
              Expanded(
                child: Container(
                  child: CustomCircularButtonMain(
                    isLoading: false,
                    text: 'BACK',
                    fontWeight: FontWeight.w700,
                    backgroundColor: BrandColors.colorLightGrayFair,
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: Container(
                    child: CustomCircularButtonMain(
                      isLoading: false,
                      fontWeight: FontWeight.w700,
                      text: 'CONFIRM',
                      textColor: Colors.white,
                      backgroundColor: BrandColors.colorGreen,
                      onPressed: onPressed
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
