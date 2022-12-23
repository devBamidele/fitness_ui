import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:fitness_ui/components/bar_chart_home.dart';
import 'package:fitness_ui/components/change_theme_button.dart';
import 'package:fitness_ui/sample_data/fitness_data.dart';
import 'package:fitness_ui/utils/widget_functions.dart';
import 'package:flutter/material.dart';

import '../components/fitness_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                            const Padding(
                              padding: EdgeInsets.only(left: 8, right: 20),
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                  'assets/images/profile-pic.png',
                                ),
                                radius: 27,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: const TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Hello ',
                                      ),
                                      TextSpan(
                                        text: 'Bamidele',
                                      )
                                    ],
                                  ),
                                ),
                                addVerticalSpace(8),
                                const Text('Monday, 21st March'),
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
                  const Text('1,235 kCal'),
                  addVerticalSpace(10),
                  const Text('Total calories burnt today'),
                  addVerticalSpace(30),
                  SizedBox(
                    height: 130,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: fitnessData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return FitnessItem(
                          item: fitnessData[index],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            const Text('8,352 m'),
                            addVerticalSpace(5),
                            const Text('Distance'),
                          ],
                        ),
                        Column(
                          children: [
                            const Text('10,530'),
                            addVerticalSpace(5),
                            const Text('Steps'),
                          ],
                        ),
                        Column(
                          children: [
                            const Text('5,362'),
                            addVerticalSpace(5),
                            const Text('Points'),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: SizedBox(
                      height: 210,
                      child: BarChartHome(),
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
