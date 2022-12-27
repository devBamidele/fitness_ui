import 'package:fitness_ui/utils/extensions.dart';
import 'package:fitness_ui/utils/widget_functions.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  static const tag = '/secondPage';

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            scrollbars: false,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 12,
                  ),
                  child: Row(
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
                ),
                addVerticalSpace(30),
                Text(
                  '10,530 Steps',
                  style: context.headline1,
                ),
                addVerticalSpace(5),
                Text(
                  'Today\'s Count',
                  style: context.subtitle1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
