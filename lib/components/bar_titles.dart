import 'package:fitness_ui/utils/extensions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../sample_data/bar_data.dart';

class BarTitles {
  static AxisTitles getBottomTitles(
    BuildContext context,
  ) {
    return AxisTitles(
      sideTitles: SideTitles(
        reservedSize: 35,
        showTitles: true,
        getTitlesWidget: (double id, TitleMeta meta) {
          String text = BarData.barData
              .firstWhere(
                (element) => element.id == id.toInt(),
              )
              .name;
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              text,
              style: context.caption,
            ),
          );
        },
      ),
    );
  }

  static AxisTitles getBottomTitlesCurved(
    BuildContext context,
  ) {
    return AxisTitles(
      sideTitles: SideTitles(
        interval: 1,
        reservedSize: 35,
        showTitles: true,
        getTitlesWidget: (double id, TitleMeta meta) {
          String text = BarData.barData[id.toInt() - 1].day;
          return SideTitleWidget(
            axisSide: meta.axisSide,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                text,
                style: context.caption,
              ),
            ),
          );
        },
      ),
    );
  }

  static AxisTitles getBottomTitlesBars(
    BuildContext context,
  ) {
    return AxisTitles(
      sideTitles: SideTitles(
        interval: 6,
        reservedSize: 35,
        showTitles: true,
        getTitlesWidget: (double id, TitleMeta meta) {
          int value = id.toInt() + 1;
          String text = '';
          if (value == 1 || value % 6 == 0) {
            text = value.toString();
          }
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              text,
              style: context.caption?.copyWith(
                color: Colors.white.withOpacity(0.6),
                fontSize: 14,
              ),
            ),
          );
        },
      ),
    );
  }

  static AxisTitles getSideTitles() {
    return AxisTitles(
      sideTitles: SideTitles(
        showTitles: false,
      ),
    );
  }
}
