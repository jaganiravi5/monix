import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../router/custom_page_transition.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});
  static AppPageTransition builder(BuildContext context, GoRouterState state) => AppPageTransition(
    page: const HomeScreen(),
    state: state,
  );

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
