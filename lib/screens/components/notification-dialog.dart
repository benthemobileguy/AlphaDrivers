import 'package:alpha_drivers/datamodels/trip-details.dart';
import 'package:alpha_drivers/screens/components/custom-circular-button-main.dart';
import 'package:alpha_drivers/theme/brand_colors.dart';
import 'package:alpha_drivers/utils/global-variables.dart';
import 'package:flutter/material.dart';
class NotificationDialog extends StatelessWidget {
  final TripDetails tripDetails;

  const NotificationDialog({Key key, this.tripDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
   shape: RoundedRectangleBorder(
     borderRadius:  BorderRadius.circular(10.0),
   ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child:  Container(
        margin: EdgeInsets.all(4),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
          SizedBox(height: 30.0,),
            Image.asset('images/taxi.png', width: 100,),
            SizedBox(height: 30.0,),
            Text('NEW TRIP REQUEST',
              style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontFamily: 'CircularStd',
              fontWeight: FontWeight.w500,
            ),),
            SizedBox(height: 30.0,),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                   Row(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                    Image.asset('images/pickicon.png', height: 16, width: 16,),
                       SizedBox(width: 18,),
                       Expanded(
                         child: Container(child:
                         Text(tripDetails.pickupAddress,
                           style: TextStyle(fontSize: 16.5, fontFamily: 'CircularStd'),)),
                       ),
                     ],
                   ),
                  SizedBox(height: 15,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset('images/desticon.png', height: 16, width: 16,),
                      SizedBox(width: 18,),
                      Expanded(child:
                      Container(child:
                      Text(tripDetails.destinationAddress,
                        style: TextStyle(fontSize: 16, fontFamily: 'CircularStd')),)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: CustomCircularButtonMain(
                      text: 'DECLINE',
                      fontWeight: FontWeight.w500,
                      textColor: Colors.white,
                      isLoading: false,
                      backgroundColor: BrandColors.colorTextDark,
                      onPressed: () async{
                        assetsAudioPlayer.stop();
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: CustomCircularButtonMain(
                      text: 'ACCEPT',
                      fontWeight: FontWeight.w500,
                      textColor: Colors.white,
                      isLoading: false,
                      backgroundColor: BrandColors.colorGreen,
                      onPressed: () async{
                     assetsAudioPlayer.stop();
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
