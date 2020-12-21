import 'package:alpha_drivers/screens/components/custom-balance.dart';
import 'package:alpha_drivers/theme/style.dart';
import 'package:flutter/material.dart';
class WeeklyEarningsTab extends StatefulWidget {
  @override
  _WeeklyEarningsTabState createState() => _WeeklyEarningsTabState();
}

class _WeeklyEarningsTabState extends State<WeeklyEarningsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          SizedBox(
            height: 10,
          ),
          Center(
            child: CustomBalance(
              balance: "20,000",
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            color: dividerColor,
            thickness: 1,

          ),
          IntrinsicHeight(
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text(
                        "50",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'CircularStd',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Trips",
                        style: TextStyle(
                          color: textColor,
                          fontSize: 16,
                          fontFamily: 'CircularStd',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                VerticalDivider(
                  color: dividerColor,
                  thickness: 1,
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text(
                        "40:00",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'CircularStd',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Online hrs",
                        style: TextStyle(
                          color: textColor,
                          fontSize: 16,
                          fontFamily: 'CircularStd',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                VerticalDivider(
                  color: dividerColor,
                  thickness: 1,
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text(
                        "N30,000",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'CircularStd',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Cash Trip",
                        style: TextStyle(
                          color: textColor,
                          fontSize: 16,
                          fontFamily: 'CircularStd',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Trip fares",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16,
                        fontFamily: 'CircularStd',
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "N20,000",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16,
                        fontFamily: 'CircularStd',
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Alpha Taxi Fee",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16,
                        fontFamily: 'CircularStd',
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "N2,000",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16,
                        fontFamily: 'CircularStd',
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "+Vat",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16,
                        fontFamily: 'CircularStd',
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "N200",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16,
                        fontFamily: 'CircularStd',
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          Divider(
            color: dividerColor,
            thickness: 1,

          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Total Earnings",
                      style: TextStyle(
                        color: customGreenDark,
                        fontSize: 16,
                        fontFamily: 'CircularStd',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "N22,200",
                      style: TextStyle(
                        color: customGreenDark,
                        fontSize: 16,
                        fontFamily: 'CircularStd',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
