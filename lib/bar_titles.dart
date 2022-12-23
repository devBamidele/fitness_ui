import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import '../sample_data/bar_data.dart';

class BarTitles {
  static AxisTitles getBottomTitles() {
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
              style: const TextStyle(
                fontSize: 20,
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
