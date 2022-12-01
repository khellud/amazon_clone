import 'package:amazon_clone/features/Admin/screens/posts_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';

int? page;
IconData? icon;

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    const PostsScreen(),
    const Center(
      child: Text('Analytics page'),
    ),
    const Center(
      child: Text('cart page'),
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/images/amazon_in.png',
                  width: 120,
                  height: 45,
                  color: Colors.black,
                ),
              ),
              const Text(
                'Admin',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          bottomNavBarItem(page = 0, icon = Icons.home_outlined),
          bottomNavBarItem(page = 1, icon = Icons.analytics_outlined),
          bottomNavBarItem(page = 2, icon = Icons.all_inbox_outlined),
        ],
      ),
    );
  }

  BottomNavigationBarItem bottomNavBarItem(int page, IconData icon) {
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
        child: Icon(icon),
      ),
      label: '',
    );
  }
}
