import 'package:alpha_drivers/theme/brand_colors.dart';
import 'package:flutter/material.dart';

import 'components/custom-circular-button-main.dart';
class CollectPayment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10)
      ),
      backgroundColor: Colors.transparent,
      child: Container(
        margin: EdgeInsets.all(4.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4)
        ),
        child: Column(
          children: <Widget>[
             SizedBox(height: 20,),
            Text(
              'CASH PAYMENT',
              style: TextStyle(
                  fontFamily: 'CircularStd',
                  fontWeight: FontWeight.w300,
                  color:
                  Colors.black
              ),
            ),
            SizedBox(height: 20,),
            Divider(
              color: Colors.black.withOpacity(0.5),
            ),
            SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Amount above is the total fares to be charged to the rider',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'CircularStd',
                    fontWeight: FontWeight.w300,
                    color:
                    Colors.black
                ),
              ),
            ),
            SizedBox(height: 30,),
            Container(
              width: 230,
              child: CustomCircularButtonMain(
                onPressed: (){
                },
                fontWeight: FontWeight.w700,
                isLoading: false,
                text: "COLLECT CASH",
                backgroundColor: BrandColors.colorGreen,
                textColor: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}

