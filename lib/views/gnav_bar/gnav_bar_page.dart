import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../global_page/global_page.dart';
import '../home/home_page.dart';
import '../profile/profile_page.dart';
import '../search/search_page.dart';

@RoutePage()
class GNavBarPage extends StatefulWidget {
  const GNavBarPage({super.key});

  @override
  State<GNavBarPage> createState() => _GNavBarPageState();
}

class _GNavBarPageState extends State<GNavBarPage> {
  int _currentIndex = 0;
  List<Widget> listOptions = <Widget>[
    const HomePage(),
    const GlobalPage(),
    const SearchPage(),
    const ProfilePage()
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
