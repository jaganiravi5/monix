import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:monix/router/custom_page_transition.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  static AppPageTransition builder(BuildContext context, GoRouterState state) => AppPageTransition(
    page: const SearchScreen(),
    state: state,
  );

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
