import 'package:alpha_drivers/model/earnings-chart.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
class BarChartEarnings extends StatelessWidget {
  final List<EarningsChart> data;
  const BarChartEarnings({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     List<charts.Series<EarningsChart, String>> series =[
      charts.Series
        (
        id: "Earnings",
        data: data,
        domainFn: (EarningsChart earnings, _)=>
            earnings.day,
        measureFn: (EarningsChart earnings, _) =>
            earnings.days,
        colorFn: (EarningsChart earnings, _) =>
            earnings.barColor
      )
    ];
     return charts.BarChart(series, animate: true,);
  }
}
