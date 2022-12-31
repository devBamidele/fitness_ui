import 'dart:math' as math;

import 'package:fitness_ui/utils/extensions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/widget_functions.dart';
import 'bar_titles.dart';

class SecondPageCard extends StatelessWidget {
  const SecondPageCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var rng = math.Random();
    ColorScheme colors = Theme.of(context).colorScheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: context.isDarkMode
                      ? colors.background
                      : kIconBackGroundLight,
                  radius: 30,
                  child: Transform.rotate(
                    angle: math.pi / 9,
                    child: Image.asset(
                      'assets/icons/joggers.png',
                      height: 39,
                      color: const Color(0xff80CC6B),
                    ),
                  ),
                ),
                addWidth(22),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Steps',
                      style: context.caption?.copyWith(
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                    addHeight(3),
                    Text(
                      '10,000+',
                      style: context.bodyText1?.copyWith(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
            addHeight(10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: BarChart(
                  BarChartData(
                    maxY: 100,
                    minY: 0,
                    groupsSpace: 8,
                    barGroups: List<BarChartGroupData>.generate(
                      22,
                      (i) => BarChartGroupData(
                        x: i,
                        barRods: [
                          BarChartRodData(
                            toY: rng.nextInt(90).toDouble() + 10,
                            color: colors.onBackground,
                            width: 7,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(4),
                            ),
                          ),
                        ],
                      ),
                    ),
                    alignment: BarChartAlignment.center,
                    barTouchData: BarTouchData(enabled: false),
                    titlesData: FlTitlesData(
                      bottomTitles: BarTitles.getBottomTitlesBars(context),
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
