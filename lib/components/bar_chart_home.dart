import 'package:fitness_ui/components/bar_titles.dart';
import 'package:fitness_ui/utils/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../sample_data/bar_data.dart';

class BarChartHome extends StatelessWidget {
  const BarChartHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    return BarChart(
      BarChartData(
        maxY: 100,
        minY: 0,
        groupsSpace: 28,
        barGroups: BarData.barData
            .map(
              (data) => BarChartGroupData(
                x: data.id,
                barRods: [
                  BarChartRodData(
                    backDrawRodData: BackgroundBarChartRodData(
                      fromY: 0,
                      toY: 100,
                      color: colors.onBackground.withAlpha(50),
                      show: true,
                    ),
                    toY: data.y,
                    color: data.id % 2 == 0 ? colors.onBackground : kTileColor,
                    width: 18,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ],
              ),
            )
            .toList(),
        alignment: BarChartAlignment.center,
        barTouchData: BarTouchData(enabled: false),
        titlesData: FlTitlesData(
          bottomTitles: BarTitles.getBottomTitles(context),
          leftTitles: BarTitles.getSideTitles(),
          rightTitles: BarTitles.getSideTitles(),
          topTitles: BarTitles.getSideTitles(),
        ),
        borderData: FlBorderData(
          show: false,
        ),
        gridData: FlGridData(
          show: false,
        ),
      ),
    );
  }
}
