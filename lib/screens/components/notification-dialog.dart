import 'package:flutter/material.dart';
class NotificationDialog extends StatelessWidget {
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
          children: <Widget>[
          SizedBox(height: 30.0,),
            Image.asset('images/taxi.png', width: 100,),
            SizedBox(height: 30.0,),
            Text('NEW TRIP REQUEST', style: TextStyle(fontFamily: 'Brand-Bold', fontSize: 18),),
            SizedBox(height: 30.0,),

          ],
        ),
      ),
    );
  }
}
