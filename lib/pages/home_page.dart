import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fitness_ui/components/bar_chart_home.dart';
import 'package:fitness_ui/components/change_theme_button.dart';
import 'package:fitness_ui/sample_data/fitness_data.dart';
import 'package:fitness_ui/utils/extensions.dart';
import 'package:fitness_ui/utils/widget_functions.dart';
import 'package:flutter/material.dart';
import 'package:fitness_ui/pages/second_page.dart';

import '../components/fitness_item.dart';
import '../components/notification_badge.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  fitnessTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < fitnessData.length; i++) {
        fitnessData[i].selected = (i == index);
      }
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
                                      'assets/images/pic.jpg',
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
                                        style: context.headline5,
                                      ),
                                      TextSpan(
                                        text: ' Bamidele',
                                        style: context.username,
                                      )
                                    ],
                                  ),
                                ),
                                addHeight(6),
                                Text(
                                  'Monday, 21 March',
                                  style: context.headline4,
                                ),
                                addHeight(5),
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
                  addHeight(35),
                  Text(
                    '1,235 Kcal',
                    style: context.headline1,
                  ),
                  addHeight(5),
                  Text(
                    'Total Calories Burnt Today',
                    style: context.subtitle1,
                  ),
                  addHeight(35),
                  SizedBox(
                    height: 140,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: fitnessData.length,
                      itemBuilder: (BuildContext context, int index) {
                        var item = fitnessData[index];
                        return FitnessItem(
                          item: item,
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
                              style: context.bodyText1,
                            ),
                            addHeight(5),
                            Text(
                              'Distance',
                              style: context.subtitle2,
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () => context.router.pushNamed(SecondPage.tag),
                          child: Column(
                            children: [
                              Text(
                                '10,530',
                                style: context.bodyText1,
                              ),
                              addHeight(5),
                              Text(
                                'Steps',
                                style: context.subtitle2,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              '5,362',
                              style: context.bodyText1,
                            ),
                            addHeight(5),
                            Text(
                              'Points',
                              style: context.subtitle2,
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
                  addHeight(25),
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
                              style: context.bodyText1?.copyWith(
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'March 2021',
                              style: context.subtitle2,
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
