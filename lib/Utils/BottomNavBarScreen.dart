import 'package:astromaagic/Components/theme.dart';
import 'package:astromaagic/UI/HomeScreen/HomeScreen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../UI/GeneralPredictions/GeneralPredictionScreenOne.dart';
import '../UI/VastuConsulting/VastuConsulting.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  int _selectedIndex = 2;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          controller: pageController,
          children: <Widget>[
            HomeScreen(),
            HomeScreen(),
            HomeScreen(),
          ],
          onPageChanged: (int index) {
            setState(() {
              pageController.jumpToPage(index);
            });
          }),
      // bottomNavigationBar: Container(
      //   decoration: BoxDecoration(
      //     color: AppTheme.screenColor,
      //     boxShadow: [
      //       BoxShadow(
      //         blurRadius: 20,
      //         color: Colors.black.withOpacity(.1),
      //       )
      //     ],
      //   ),
      //   child: SafeArea(
      //     child: Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
      //       child: GNav(
      //         rippleColor: Colors.grey[300]!,
      //         hoverColor: Colors.grey[100]!,
      //         gap: 8,
      //         activeColor: AppTheme.appBlack,
      //         iconSize: 24,
      //         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      //         duration: Duration(milliseconds: 400),
      //         tabBackgroundColor: AppTheme.primaryColor,
      //         color: Colors.white,
      //         tabs: const [
      //           GButton(
      //             icon: Icons.menu,
      //             text: 'Menu',
      //           ),
      //           GButton(
      //             icon: Icons.home,
      //             text: 'Home',
      //           ),
      //           GButton(
      //             icon: Icons.account_circle_rounded,
      //             text: 'Profile',
      //           ),
      //           GButton(
      //             icon: Icons.account_circle_rounded,
      //             text: 'Profile',
      //           ),
      //         ],
      //         selectedIndex: _selectedIndex,
      //         onTabChange: (index) {
      //           setState(() {
      //             _selectedIndex = index;
      //           });
      //         },
      //       ),
      //     ),
      //   ),
      // ),
      bottomNavigationBar: CurvedNavigationBar(
          index: 0,
          animationCurve: Curves.elasticIn,
          animationDuration: Duration(milliseconds: 10),
          color: AppTheme.primaryColor,
          backgroundColor: AppTheme.screenBackground,
          height: 50,
          onTap: (int index) {
            setState(() {
              pageController.jumpToPage(index);
            });
          },
          items: [
            Icon(
              Icons.settings,
              color: Colors.black,
              size: 30,
            ),
            Icon(
              Icons.home,
              color: Colors.black,
              size: 30,
            ),
            Icon(
              Icons.person,
              color: Colors.black,
              size: 30,
            ),
          ]),
    );
  }
}
