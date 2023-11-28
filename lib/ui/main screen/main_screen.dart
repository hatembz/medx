import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medx/ui/main%20screen/history_screen.dart';
import 'package:medx/ui/main%20screen/home/home_screen.dart';
import 'package:medx/ui/main%20screen/profile/profile_screen.dart';
import 'package:medx/ui/main%20screen/schedual_screen.dart';
import 'package:medx/utils/constants.dart';
import 'package:medx/utils/svg_icons.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [HomeScreen(), SchedualScreen(), HistoryScreen(), ProfileScreen()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          icon: Icon(MedxIcons.homefilled),
          inactiveIcon: Icon(MedxIcons.home_empty),
          title: 'Home',
          activeColorPrimary: kBlueColor,
          inactiveColorPrimary: kBlueColor,
          textStyle: context.textTheme.bodyMedium?.copyWith(color: kBlueColor)),
      PersistentBottomNavBarItem(
          icon: Icon(MedxIcons.schedual),
          title: 'Likes',
          activeColorPrimary: kBlueColor,
          inactiveColorPrimary: kBlueColor,
          textStyle: context.textTheme.bodyMedium?.copyWith(color: kBlueColor)),
      PersistentBottomNavBarItem(
          icon: Icon(MedxIcons.history_filled),
          inactiveIcon: Icon(MedxIcons.tasks),
          iconSize: 24,
          title: 'History',
          activeColorPrimary: kBlueColor,
          inactiveColorPrimary: kBlueColor,
          textStyle: context.textTheme.bodyMedium?.copyWith(color: kBlueColor)),
      PersistentBottomNavBarItem(
          icon: Icon(MedxIcons.profile_filled),
          inactiveIcon: Icon(MedxIcons.profile),
          title: 'Profile',
          activeColorPrimary: kBlueColor,
          inactiveColorPrimary: kBlueColor,
          textStyle: context.textTheme.bodyMedium?.copyWith(color: kBlueColor)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      navBarHeight: context.height * 0.09,
      decoration: NavBarDecoration(
        boxShadow: [
          BoxShadow(color: Color(0x145A6CEA), blurRadius: 50, offset: Offset(0, 0), spreadRadius: 0)
        ],
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,

      itemAnimationProperties:
          ItemAnimationProperties(duration: Duration(milliseconds: 90), curve: Curves.ease),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 90),
      ),

      navBarStyle: NavBarStyle.style9, // Choose the nav bar style with this property.
    );
  }
}
