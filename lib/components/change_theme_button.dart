import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import '../theme/theme_service.dart';

class ChangeThemeButton extends StatelessWidget {
  const ChangeThemeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, [bool mounted = true]) {
    return ThemeSwitcher(
      builder: (context) {
        return IconButton(
          onPressed: () async {
            var themeName =
                ThemeModelInheritedNotifier.of(context).theme.brightness ==
                        Brightness.light
                    ? 'dark'
                    : 'light';
            var service = await ThemeService.instance
              ..save(themeName);
            var theme = service.getByName(themeName);
            if (!mounted) return;
            ThemeSwitcher.of(context).changeTheme(theme: theme);
          },
          icon: Icon(
            ThemeModelInheritedNotifier.of(context).theme.brightness ==
                    Brightness.light
                ? Icons.brightness_3
                : Icons.brightness_7_rounded,
            size: 25,
          ),
        );
      },
    );
  }
}
