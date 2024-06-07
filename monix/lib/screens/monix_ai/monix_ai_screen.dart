import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../router/custom_page_transition.dart';

class MonixAiScreen extends StatelessWidget {
  const MonixAiScreen({super.key});
  static AppPageTransition builder(BuildContext context, GoRouterState state) => AppPageTransition(
    page: const MonixAiScreen(),
    state: state,
  );

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
