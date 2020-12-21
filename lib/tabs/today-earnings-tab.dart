import 'package:alpha_drivers/theme/style.dart';
import 'package:flutter/material.dart';
class TodayEarningsTab extends StatefulWidget {
  @override
  _TodayEarningsTabState createState() => _TodayEarningsTabState();
}

class _TodayEarningsTabState extends State<TodayEarningsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Mon. 27th July 2020",
              style: TextStyle(
                fontSize: 14.5,
                fontFamily: 'CircularStd',
                color: textColor,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
