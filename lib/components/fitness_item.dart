import 'package:fitness_ui/models/fitness.dart';
import 'package:fitness_ui/pages/home_page.dart';
import 'package:fitness_ui/sample_data/fitness_data.dart';
import 'package:fitness_ui/utils/widget_functions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

class FitnessItem extends StatelessWidget {
  const FitnessItem({
    Key? key,
    required this.item,
    required this.onTap,
  }) : super(key: key);

  final Fitness item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    bool selected = item.selected;
    bool lastItem = item == fitnessData.last;
    ColorScheme colors = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.only(left: 22, bottom: 10, right: lastItem ? 22 : 0),
      child: GestureDetector(
        onTap: onTap,
        child: Material(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          clipBehavior: Clip.antiAlias,
          elevation: 5,
          shadowColor: Colors.black,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
            width: 130,
            decoration: BoxDecoration(
              color: selected
                  ? kSecondary
                  : context.isDarkMode
                      ? kTileColorUnselected
                      : colors.onBackground.withAlpha(30),
            ),
            child: DefaultTextStyle(
              style: TextStyle(
                color: selected ? kDark : colors.onBackground,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.fitness_center_rounded,
                    color: selected ? kDark : colors.onBackground,
                  ),
                  addVerticalSpace(10),
                  Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: item.kcal.toString(),
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: '  kcal',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  addVerticalSpace(7),
                  Text(
                    item.equipment,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.7,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
