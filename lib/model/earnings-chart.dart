import 'package:flutter/foundation.dart';
import 'package:charts_flutter/flutter.dart' as charts;
class EarningsChart{
  final String day;
  final int days;
  final charts.Color barColor;

  EarningsChart({
    this.day, this.barColor, this.days
});
}