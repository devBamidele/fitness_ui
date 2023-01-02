import 'package:fitness_ui/utils/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../sample_data/bar_data.dart';
import 'bar_titles.dart';

class BarChartSecond extends StatelessWidget {
  const BarChartSecond({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: LineChart(
        LineChartData(
          minX: 1,
          maxX: 7,
          minY: 0,
          maxY: 100,
          baselineY: 10,
          lineBarsData: [
            LineChartBarData(
              spots: BarData.barData
                  .map(
                    (data) => FlSpot(
                      data.id.toDouble() + 1,
                      data.y,
                    ),
                  )
                  .toList(),
              isCurved: true,
              curveSmoothness: 0.5,
              barWidth: 5.5,
              isStrokeCapRound: true,
              gradient: kGraphGradient,
              dotData: FlDotData(
                show: false,
              ),
            )
          ],
          titlesData: FlTitlesData(
            bottomTitles: BarTitles.getBottomTitlesCurved(context),
            leftTitles: BarTitles.getSideTitles(),
            rightTitles: BarTitles.getSideTitles(),
            topTitles: BarTitles.getSideTitles(),
          ),
          gridData: FlGridData(
            show: false,
          ),
          borderData: FlBorderData(
            show: false,
          ),
        ),
      ),
    );
  }
}
