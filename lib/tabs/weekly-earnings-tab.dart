import 'package:alpha_drivers/model/earnings-chart.dart';
import 'package:alpha_drivers/screens/components/bar-chart-earnings.dart';
import 'package:alpha_drivers/screens/components/custom-balance.dart';
import 'package:alpha_drivers/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class WeeklyEarningsTab extends StatefulWidget {
  @override
  _WeeklyEarningsTabState createState() => _WeeklyEarningsTabState();
}

class _WeeklyEarningsTabState extends State<WeeklyEarningsTab> {
  final List<EarningsChart> data = [
    EarningsChart(
        day: "Sun",
        barColor: charts.ColorUtil.fromDartColor(Colors.black38),
        days: 1),
    EarningsChart(
        day: "Mon",
        barColor: charts.ColorUtil.fromDartColor(Colors.blue),
        days: 2),
    EarningsChart(
        day: "Tues",
        barColor: charts.ColorUtil.fromDartColor(Colors.orange),
        days: 3),
    EarningsChart(
        day: "Wed",
        barColor: charts.ColorUtil.fromDartColor(Colors.green),
        days: 4),
    EarningsChart(
        day: "Thurs",
        barColor: charts.ColorUtil.fromDartColor(Colors.pink),
        days: 5),
    EarningsChart(
        day: "Frid",
        barColor: charts.ColorUtil.fromDartColor(Colors.brown),
        days: 6),
    EarningsChart(
        day: "Sat",
        barColor: charts.ColorUtil.fromDartColor(Colors.purple),
        days: 7),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
            SizedBox(
              height: 300,
              child: BarChartEarnings(
                data: data,
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
      ),
    );
  }
}
