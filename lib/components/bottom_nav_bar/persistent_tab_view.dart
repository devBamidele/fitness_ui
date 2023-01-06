import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:fitness_ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../models/bottom_bar_item.dart';
import '../../utils/colors.dart';
import '../change_theme_button.dart';
import 'navigation_bar.dart';

class CustomPersistentTabView extends StatefulWidget {
  const CustomPersistentTabView({Key? key}) : super(key: key);

  @override
  State<CustomPersistentTabView> createState() =>
      _CustomPersistentTabViewState();
}

class _CustomPersistentTabViewState extends State<CustomPersistentTabView> {
  late PersistentTabController _controller;
  late bool _hideNavBar;

  List<BottomBarItem> _navBarItems() => [
        BottomBarItem(
          label: 'Home',
          icon: const Icon(
            Icons.home_rounded,
            color: kNavBarIconColor,
            size: 25,
          ),
        ),
        BottomBarItem(
          label: 'Location',
          icon: const Icon(
            Icons.location_on_outlined,
            color: kNavBarIconColor,
            size: 25,
          ),
        ),
        BottomBarItem(
          label: 'Menu',
          icon: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: kLight,
            ),
            child: const Icon(
              Icons.play_arrow_rounded,
              color: kLightCardColor,
            ),
          ),
        ),
        BottomBarItem(
          label: 'B.P',
          icon: const Icon(
            Icons.monitor_heart_outlined,
            color: kNavBarIconColor,
            size: 25,
          ),
        ),
        BottomBarItem(
          label: 'Profile',
          icon: const Icon(
            Icons.account_circle_outlined,
            color: kNavBarIconColor,
            size: 25,
          ),
        ),
      ];

  List<Widget> _buildScreens() => [
        const HomePage(),
        const Scaffold(),
        const Scaffold(),
        const Scaffold(),
        const Scaffold(),
      ];

  // Future  Function(BuildContext?)? onWillPop

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController();
    _hideNavBar = false;
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    return ThemeSwitchingArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Theme'),
          actions: const [
            ChangeThemeButton(),
          ],
        ),
        body: PersistentTabView.custom(
          context,
          controller: _controller,
          itemCount: _navBarItems().length,
          screens: _buildScreens(),
          hideNavigationBar: _hideNavBar,
          backgroundColor: backgroundColor,
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
          ),
          bottomScreenMargin: kBottomNavigationBarHeight,
          onWillPop: (final context) async {
            await showDialog(
              context: this.context,
              useSafeArea: true,
              builder: (final context) => Container(
                height: 50,
                width: 50,
                color: Colors.white,
                child: ElevatedButton(
                  child: const Text("Close"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            );
            return false;
          },
          customWidget: CustomNavBarWidget(
            _navBarItems(),
            selectedIndex: _controller.index,
            onItemSelected: (int value) {
              setState(() {
                _controller.index = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
