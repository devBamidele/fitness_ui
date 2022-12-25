import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:fitness_ui/components/bar_chart_home.dart';
import 'package:fitness_ui/components/change_theme_button.dart';
import 'package:fitness_ui/sample_data/fitness_data.dart';
import 'package:fitness_ui/utils/colors.dart';
import 'package:fitness_ui/utils/widget_functions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/fitness_item.dart';
import '../components/notification_badge.dart';

extension DarkMode on BuildContext {
  /// is dark mode currently enabled?
  bool get isDarkMode {
    final brightness = ThemeModelInheritedNotifier.of(this).theme.brightness;
    return brightness == Brightness.dark;
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  fitnessTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < fitnessData.length; i++) {
        fitnessData[i].selected = false;
      }
      fitnessData[index].selected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    return ThemeSwitchingArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Theme'),
          actions: const [
            ChangeThemeButton(),
          ],
        ),
        body: SafeArea(
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              scrollbars: false,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8, right: 20),
                              child: Stack(
                                children: const [
                                  CircleAvatar(
                                    backgroundImage: AssetImage(
                                      'assets/images/profile-pic.png',
                                    ),
                                    radius: 27,
                                  ),
                                  NotificationBadge(),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Hello ',
                                        style: GoogleFonts.plusJakartaSans(
                                          fontSize: 16,
                                          color: colors.onBackground
                                              .withOpacity(0.8),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' Bamidele',
                                        style: GoogleFonts.plusJakartaSans(
                                          fontSize: 16,
                                          color: context.isDarkMode
                                              ? kTileColor.withOpacity(0.9)
                                              : colors.onBackground,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                addVerticalSpace(5),
                                Text(
                                  'Monday, 21 March',
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          child: const Icon(
                            Icons.calendar_month_outlined,
                            size: 24,
                          ),
                        )
                      ],
                    ),
                  ),
                  addVerticalSpace(30),
                  Text(
                    '1,235 Kcal',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  addVerticalSpace(3),
                  Text(
                    'Total Calories Burnt Today',
                    style: GoogleFonts.openSans(
                      fontSize: 16,
                      color: colors.onBackground.withOpacity(0.8),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  addVerticalSpace(30),
                  SizedBox(
                    height: 140,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: fitnessData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return FitnessItem(
                          item: fitnessData[index],
                          onTap: () => fitnessTypeSelected(index),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              '8,352 m',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            addVerticalSpace(5),
                            Text(
                              'Distance',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 15,
                                color: colors.onBackground.withOpacity(0.8),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '10,530',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            addVerticalSpace(5),
                            Text(
                              'Steps',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 15,
                                color: colors.onBackground.withOpacity(0.8),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '5,362',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            addVerticalSpace(5),
                            Text(
                              'Points',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 15,
                                color: colors.onBackground.withOpacity(0.8),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 210,
                    child: BarChartHome(),
                  ),
                  addVerticalSpace(25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'My Plan',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'March 2021',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 15.5,
                                color: colors.onBackground.withOpacity(0.9),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          'assets/icons/two_dots.png',
                          height: 18,
                          color: colors.onBackground,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
