import 'package:flutter/material.dart';
import '../models/bar.dart';

class BarData {
  BarData();

  static List<Bar> barData = [
    Bar(
      id: 0,
      name: 'M',
      y: 5,
      day: 'Mon',
    ),
    Bar(
      id: 1,
      name: 'T',
      y: 30,
      day: 'Tue',
    ),
    Bar(
      id: 2,
      name: 'W',
      y: 20,
      day: 'Wed',
    ),
    Bar(
      id: 3,
      name: 'T',
      y: 80,
      day: 'Thu',
    ),
    Bar(
      id: 4,
      name: 'F',
      y: 50,
      day: 'Fri',
    ),
    Bar(
      id: 5,
      name: 'S',
      y: 60,
      day: 'Sat',
    ),
    Bar(
      id: 6,
      name: 'S',
      y: 5,
      day: 'Sun',
    ),
  ];

  static List barData2 = [];
}
