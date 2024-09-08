
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
import 'package:network/category/provider/all_category_provider.dart';
import 'package:network/images/provider/all_images_provider.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  static AppPageTransition builder(BuildContext context, GoRouterState state) =>
      AppPageTransition(
        page: const DashboardScreen(),
        state: state,
      );

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  late final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const MonixAiScreen(),
    SavedScreen(),
  ];
  int selectedIndex = 0;
  DateTime? currentBackPressTime;
bool canPopNow = false;
int requiredSeconds = 2;

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
    return null;
  }

  void _onBottomNavItemTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
 void onPopInvoked(bool didPop, DateTime? currentBackPressTime) {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null || 
        now.difference(currentBackPressTime) > Duration(seconds: requiredSeconds)) {
      currentBackPressTime = now;
      showToast(msg: 'Exit Warning');
      // Fluttertoast.showToast(msg: 'exit_warning');
      Future.delayed(
        Duration(seconds: requiredSeconds),
        () {
          // Disable pop invoke and close the toast after 2s timeout
          setState(() {
            canPopNow = false;
          });
          // Fluttertoast.cancel();
        },
      );
      // Ok, let user exit app on the next back press
      setState(() {
        canPopNow = true;
      });
        }}

  Future<void> getAllImages() async {
    // ref.read(allImagesDataProvider.notifier).page = 1;
    ref.read(allImagesDataProvider.notifier).isPagination = true;

    await ref.read(allImagesDataProvider.notifier).allImages(
        isSearch: false,
        searchText: '',
        type: StringManager.post,
        page: 1,
        limit: 18
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
        snackBar: SnackBar(content: Text('ff')),
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
