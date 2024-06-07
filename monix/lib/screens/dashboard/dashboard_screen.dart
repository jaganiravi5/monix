import 'package:common/common.dart';
import 'package:common/widget/mobile_widget/intro_slider%202/intro_page.dart';
import 'package:common/widget/mobile_widget/intro_slider%202/intro_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:monix/router/custom_page_transition.dart';
import 'package:monix/screens/home/home_screen.dart';
import 'package:monix/screens/monix_ai/monix_ai_screen.dart';
import 'package:monix/screens/saved/saved_screen.dart';
import 'package:monix/screens/search/search_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  static AppPageTransition builder(BuildContext context, GoRouterState state) => AppPageTransition(
        page: const DashboardScreen(),
        state: state,
      );

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late final List<Widget> _screens = [
    HomeScreen(),
    MonixAiScreen(),
    SearchScreen(),
    SavedScreen(),
  ];
  int selectedIndex = 0;

  Future<bool> Function()? onBackPressed({required BuildContext context}) {
    final theme = Theme.of(context).monixColors;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: theme.white,
        content: Text(
          "Press back again to exit",
          style: TextStyle(
            color: theme.bgColor,
          ),
        ),
      ),
    );
  }

  void _onBottomNavItemTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldKey,
      // drawer: PrimaryDrawer(scaffoldKey: _scaffoldKey),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // _screens[selectedIndex],
          Positioned(
            bottom: 20.h,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.r),
              child: PrimaryBottomNavigation(
                currentIndex: selectedIndex,
                onTap: _onBottomNavItemTap,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
