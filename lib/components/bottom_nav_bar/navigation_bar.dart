import 'package:fitness_ui/models/bottom_bar_item.dart';
import 'package:fitness_ui/utils/extensions.dart';
import 'package:fitness_ui/utils/widget_functions.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class CustomNavBarWidget extends StatelessWidget {
  const CustomNavBarWidget(
    this.items, {
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected,
  }) : super(key: key);

  final int selectedIndex;
  final List<BottomBarItem> items;
  final ValueChanged<int> onItemSelected;

  @override
  Widget build(BuildContext context) {
    Widget buildItem(
      final BottomBarItem item,
      final bool isSelected, // Exclude here
    ) =>
        Container(
          alignment: Alignment.center,
          height: kBottomNavigationBarHeight,
          child: isSelected
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item.label,
                      style: context.bodyText1?.copyWith(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                    addHeight(4),
                    Container(
                      width: 7,
                      height: 7,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: kTileColor,
                      ),
                    )
                  ],
                )
              : item.icon,
        );

    return Container(
      height: kBottomNavigationBarHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.isDarkMode ? kDarkCardColor : kLightCardColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.map((final item) {
          final int index = items.indexOf(item);
          return Flexible(
            child: GestureDetector(
              onTap: () {
                onItemSelected(index);
              },
              child: buildItem(item, selectedIndex == index),
            ),
          );
        }).toList(),
      ),
    );
  }
}
