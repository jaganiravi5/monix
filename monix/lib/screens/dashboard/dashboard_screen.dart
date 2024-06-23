import 'dart:io';

import 'package:common/common.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:monix/router/custom_page_transition.dart';
import 'package:monix/screens/home/home_screen.dart';
import 'package:monix/screens/monix_ai/monix_ai_screen.dart';
import 'package:monix/screens/saved/saved_screen.dart';
import 'package:monix/screens/search/search_screen.dart';
import 'package:network/images/provider/all_images_provider.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  static AppPageTransition builder(BuildContext context, GoRouterState state) => AppPageTransition(
        page: const DashboardScreen(),
        state: state,
      );

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  late final List<Widget> _screens = [
    HomeScreen(),
    SearchScreen(),
    MonixAiScreen(),
    SavedScreen(),
  ];
  int selectedIndex = 0;
  int _canPopCount = 0;
    @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp){
      getAllImages();
    });
    
    super.initState();
  }






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
  Future<void> getAllImages() async {
    ref.read(allImagesDataProvider.notifier).page = 1;
    ref.read(allImagesDataProvider.notifier).isPagination = true;

   await ref
        .read(allImagesDataProvider.notifier)
        .allImages( isSearch: false, searchText: ''
            // isSearch: false,
            );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldKey,
      // drawer: PrimaryDrawer(scaffoldKey: _scaffoldKey),
      resizeToAvoidBottomInset: false,
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to leave'),
        ),
        child: Stack(
          children: [
            _screens[selectedIndex],
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: PrimaryBottomNavigation(
                currentIndex: selectedIndex,
                onTap: _onBottomNavItemTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
