import 'package:alpha_drivers/bloc/default.dart';
import 'package:alpha_drivers/theme/brand_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EarningsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Container(
          color: BrandColors.colorPrimary,
          width: double.infinity,
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 70),
            child: Column(
              children: [

                Text('Total Earnings', style: TextStyle(color: Colors.white),),
                Text('\u{20A6}${Provider.of<MainBloc>(context).earnings}',
                  style: TextStyle(color: Colors.white, fontSize: 40,
                      fontFamily: 'Montserrat'),)
              ],
            ),
          ),
        ),

        FlatButton(
          padding: EdgeInsets.all(0),
          onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context)
                => HistoryPage()));
          },

          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 30, vertical: 18),
            child: Row(
              children: [
                Image.asset('images/taxi.png', width: 70,),
                SizedBox(width: 16,),
                Text('Trips', style: TextStyle(fontSize: 16), ),
                Expanded(child: Container(child: Text(Provider.of<MainBloc>(context).tripCount.toString(), textAlign: TextAlign.end, style: TextStyle(fontSize: 18),))),
              ],
            ),
          ),

        ),

        Divider(
          color: Colors.black.withOpacity(0.5),
        ),

      ],
    );
  }
}