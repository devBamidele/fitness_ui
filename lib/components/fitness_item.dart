import 'package:fitness_ui/models/fitness.dart';
import 'package:fitness_ui/utils/widget_functions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

class FitnessItem extends StatelessWidget {
  const FitnessItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Fitness item;

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(left: 22),
      child: Material(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        clipBehavior: Clip.antiAlias,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
          width: 130,
          decoration: const BoxDecoration(
            color: kSecondary,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.fitness_center_rounded,
                color: kDark,
              ),
              addVerticalSpace(10),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: item.kcal.toString(),
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 17,
                        color: colors.background,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: '  kcal',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 15,
                        color: colors.background,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              addVerticalSpace(9),
              Text(
                item.equipment,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.7,
                  color: colors.background,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
