import 'package:flutter/material.dart';
import '../models/bar.dart';

class BarData {
  BarData();

  static List<Bar> barData = [
    Bar(
      id: 0,
      name: 'M',
      y: 35,
      color: Colors.white,
    ),
    Bar(
      id: 1,
      name: 'T',
      y: 60,
      color: Colors.white,
    ),
    Bar(
      id: 2,
      name: 'W',
      y: 22,
      color: Colors.white,
    ),
  ];
}
