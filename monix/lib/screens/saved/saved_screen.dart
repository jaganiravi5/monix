import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../router/custom_page_transition.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});
  static AppPageTransition builder(BuildContext context, GoRouterState state) => AppPageTransition(
    page: const SavedScreen(),
    state: state,
  );

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).monixColors;
    return  Scaffold(
      backgroundColor: color.bgColor,
    );
  }
}
