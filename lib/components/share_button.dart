import 'package:fitness_ui/utils/constants.dart';
import 'package:fitness_ui/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../utils/widget_functions.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        fixedSize: const Size(double.infinity, 63),
        shape: kButtonShape,
        side: BorderSide(
          width: 2,
          color: colors.onBackground.withAlpha(60),
        ),
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.ios_share_rounded,
            size: 25,
          ),
          addWidth(8),
          Text(
            'Share',
            style: context.bodyText1?.copyWith(
              fontSize: 16,
              letterSpacing: 1,
            ),
          )
        ],
      ),
    );
  }
}
