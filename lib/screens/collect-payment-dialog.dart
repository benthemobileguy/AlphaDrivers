import 'package:alpha_drivers/helper/helper-methods.dart';
import 'package:alpha_drivers/helper/math-converter.dart';
import 'package:alpha_drivers/theme/brand_colors.dart';
import 'package:flutter/material.dart';

import 'components/custom-circular-button-main.dart';
class CollectPayment extends StatelessWidget {
  final String paymentMethod;
  final int fares;

  const CollectPayment({Key key, this.paymentMethod, this.fares}) : super(key: key);
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
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
             SizedBox(height: 20,),
            Text(
              '${paymentMethod.toUpperCase()} PAYMENT',
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
            Text(
              '\N${MathConverter.intToHundred(fares)}',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'CircularStd',
                  fontSize: 50,
                  fontWeight: FontWeight.w500,
                  color:
                  Colors.black
              ),
            ),
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
            SizedBox(height: 60,),
            Container(
              width: 230,
              child: CustomCircularButtonMain(
                onPressed: (){
                  Navigator.pop(context);
                  Navigator.pop(context);

                  HelperMethods.enableHomeTabLocationUpdates();
                },
                fontWeight: FontWeight.w700,
                isLoading: false,
                text: (paymentMethod == 'cash') ?"COLLECT CASH": 'CONFIRM',
                backgroundColor: BrandColors.colorGreen,
                textColor: Colors.white,
              ),
            ),
            SizedBox(height: 40,)
          ],
        ),
      ),
    );
  }
}

