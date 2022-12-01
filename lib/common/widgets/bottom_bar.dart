import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/Admin/screens/admin_screen.dart';
import 'package:amazon_clone/features/account/screens/account_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';

  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  int? page;
  IconData? icons;
  String? badge;

  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const Center(
      child: Text('Cart Page'),
    ),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          bottomNavBarItem(page = 0, icon = Icons.home_outlined, badge = ''),
          bottomNavBarItem(
              page = 1, icon = Icons.person_outline_outlined, badge = ''),
          bottomNavBarItem(page = 2,
              icon = Icons.shopping_cart_checkout_outlined, badge = '2'),
        ],
      ),
    );
  }

  BottomNavigationBarItem bottomNavBarItem(
      int page, IconData icon, String badge) {
    return BottomNavigationBarItem(
      icon: Container(
        width: bottomBarWidth,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: _page == page
                  ? GlobalVariables.selectedNavBarColor
                  : GlobalVariables.backgroundColor,
              width: bottomBarBorderWidth,
            ),
          ),
        ),
        child: Badge(
          elevation: 0,
          badgeContent: Text(badge),
          badgeColor: Colors.white,
          child: Icon(icon),
        ),
      ),
      label: '',
    );
  }
}
