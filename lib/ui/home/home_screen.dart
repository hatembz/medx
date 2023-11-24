import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:medx/utils/constants.dart';
import 'package:medx/utils/svg_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
      width: 428,
      height: 91,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x196A769A),
            blurRadius: 20,
            offset: Offset(0, -4),
            spreadRadius: 0,
          )
        ],
      ),
      child: GNav(
          // rippleColor: Colors.grey[800], // tab button ripple color when pressed
          // hoverColor: Colors.grey[700], // tab button hover color
          haptic: true, // haptic feedback
          tabBorderRadius: 15,
          // tabActiveBorder: Border.all(color: kdarkblue, width: 1), // tab button border
          // tabBorder: Border.all(color: kdarkblue, width: 1), // tab button border
          // tabShadow: [
          //   BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)
          // ], // tab button shadow
          curve: Curves.easeOutExpo, // tab animation curves
          duration: Duration(milliseconds: 90), // tab animation duration
          gap: 8, // the tab button gap between icon and text
          color: kBlueColor, // unselected icon color
          activeColor: kBlueColor, // selected icon and text color
          iconSize: 24, // tab button icon size
          tabBackgroundColor: kdarkblue, // selected tab background color
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          tabs: [
            GButton(
              icon: MedxIcons.homefilled,
              text: 'Home',
            ),
            GButton(
              icon: MedxIcons.schedual,
              text: 'Likes',
            ),
            GButton(
              icon: MedxIcons.tasks,
              text: 'Search',
            ),
            GButton(
              icon: MedxIcons.profile,
              text: 'Profile',
            )
          ]),
    ));
  }
}
