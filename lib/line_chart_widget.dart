import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'Widgets/points.dart';

class LineChartWidget extends StatelessWidget {
  final List<APoints> apoints;

  const LineChartWidget(this.apoints, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(

        lineBarsData: [
          LineChartBarData(
            isCurved: false,
            dotData: FlDotData(show: true),
            spots: apoints.map((e) => FlSpot(e.x, e.y)).toList()),

        ],
      ),
    );
  }
}
