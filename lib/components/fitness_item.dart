import 'package:fitness_ui/models/fitness.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class FitnessItem extends StatelessWidget {
  const FitnessItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Fitness item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
        width: 130,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
          color: kSecondary,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.fitness_center_rounded,
              color: kDark,
            ),
            Text('${item.kcal} kcal'),
            Text(item.equipment),
          ],
        ),
      ),
    );
  }
}
