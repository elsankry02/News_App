import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:news_app/features/presentation/tabs/global_tabs.dart';
import 'package:news_app/features/presentation/tabs/home_tabs.dart';
import 'package:news_app/features/presentation/tabs/profile_tabs.dart';
import 'package:news_app/features/presentation/tabs/search_tabs.dart';

class GNavBar extends StatefulWidget {
  const GNavBar({super.key});

  @override
  State<GNavBar> createState() => _GNavBarState();
}

class _GNavBarState extends State<GNavBar> {
  int _currentIndex = 0;
  List<Widget> listOptions = <Widget>[
    const HomeTabs(),
    const GlobalTabs(),
    const SearchTabs(),
    const ProfileTabs()
  ];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    final theme = Theme.of(context);
    return Scaffold(
      body: listOptions.elementAt(_currentIndex),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: GNav(
          selectedIndex: _currentIndex,
          onTabChange: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          activeColor: theme.hintColor,
          color: Colors.grey,
          tabBackgroundColor: theme.primaryColor,
          padding: const EdgeInsets.all(8),
          gap: 8,
          tabs: [
            GButton(
              iconColor: theme.primaryColor,
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.language,
              iconColor: theme.primaryColor,
              text: 'Global',
            ),
            GButton(
              icon: Icons.search,
              iconColor: theme.primaryColor,
              text: 'Search',
            ),
            GButton(
              iconColor: theme.primaryColor,
              icon: Icons.person_outline_rounded,
              text: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
