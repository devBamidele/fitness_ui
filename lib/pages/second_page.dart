import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:fitness_ui/components/bar_chart_second.dart';
import 'package:fitness_ui/utils/extensions.dart';
import 'package:fitness_ui/utils/widget_functions.dart';
import 'package:flutter/material.dart';

import '../components/change_theme_button.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  static const tag = '/secondPage';

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
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 12,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton(
                          onPressed: () {},
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 20,
                          ),
                        ),
                        Text(
                          'Details',
                          style: context.headline4,
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          child: Image.asset(
                            'assets/icons/two_dots.png',
                            height: 16,
                            color: colors.onBackground,
                          ),
                        )
                      ],
                    ),
                    addVerticalSpace(40),
                    Text(
                      '10,530 Steps',
                      style: context.headline1,
                    ),
                    addVerticalSpace(5),
                    Text(
                      'Today\'s Count',
                      style: context.subtitle1,
                    ),
                    addVerticalSpace(10),
                    const SizedBox(
                      height: 180,
                      child: BarChartSecond(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
