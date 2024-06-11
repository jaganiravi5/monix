import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:monix/router/custom_page_transition.dart';

import '../../router/routes_name.dart';

class IdeaScreen extends StatelessWidget {
  const IdeaScreen({super.key});

  static AppPageTransition builder(BuildContext context, GoRouterState state) => AppPageTransition(
        page: const IdeaScreen(),
        state: state,
      );

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).monixColors;
    return Scaffold(
      appBar: CommonAppBar(
        color: color,
        title: StringManager.idea,
        leadingWidth: 44.w,
        icon: InkWell(
          onTap: () => context.pop(),
          child: Icon(
            Icons.arrow_back_rounded,
            color: color.white,
            size: 28.h,
          ),
        ),
        onSuffixBtnClick: () => context.push(AppRoutesPath.ideaScreen),
      ),
    );
  }
}
