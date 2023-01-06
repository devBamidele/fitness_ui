import 'package:flutter/material.dart';

class BottomBarItem {
  BottomBarItem({
    required this.label,
    required this.icon,
    this.middle = false,
  });

  /// The title for the bar item, appears when the item is selected
  final String label;
  final Widget icon;
  final bool middle;
}
