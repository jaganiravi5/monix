import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:monix/monix.dart';
import 'package:monix/router/custom_page_transition.dart';

class ImageListScreen extends StatelessWidget {
  const ImageListScreen({super.key});

  static AppPageTransition builder(BuildContext context, GoRouterState state) =>
      AppPageTransition(
        page: const ImageListScreen(),
        state: state,
      );

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).monixColors;
    return Scaffold(
      appBar: CommonAppBar(
        color: color,
        title: StringManager.allImages,
        icon: Icon(
          Icons.arrow_back_rounded,
          color: color.white,
          size: 28.h,
        ),
      ),
      backgroundColor: color.bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            
              SizedBox(height: 20.w,),
            imageSizeWidget(
              isTitle: false,
            ),SizedBox(height: 20.w,),
            AllImagesWidget(isTitle: false,)
          ],
        ),
      ),
    );
  }
}
