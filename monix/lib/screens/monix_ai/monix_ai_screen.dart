import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:monix_assets/monix_assets.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../router/custom_page_transition.dart';
import '../../router/routes_name.dart';

class MonixAiScreen extends StatelessWidget {
  const MonixAiScreen({super.key});

  static AppPageTransition builder(BuildContext context, GoRouterState state) => AppPageTransition(
        page: const MonixAiScreen(),
        state: state,
      );

  Future<void> _launchUrl({required Uri url}) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).monixColors;
    return Scaffold(
      backgroundColor: color.bgColor,

      appBar: CommonAppBar(
        onSuffixBtnClick: () => context.push(AppRoutesPath.ideaScreen),
        color: color,
        title: StringManager.monixAi,
        text: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Text(
            StringManager.monixAiGods,
            style: TextStyle(
              color: color.white,
              fontSize: 21,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        leadingWidth: 12.w,
        icon: icons.menu.svg(
          width: 12.w,
          height: 12.w,
          fit: BoxFit.contain,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            images.generatingAi.image(
              width: 180.w,
              height: 161.w,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 30.w,
            ),
            Text(
              StringManager.generatingTool,
              style: TextStyle(
                color: color.white,
                fontSize: 21.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10.w,
            ),
            Text(
              StringManager.generatingToolDesc,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color.grey500,
                fontSize: 16.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 43.w,
            ),
            InkWell(
              onTap: () async {
                final Uri uri = Uri.parse('https://sites.google.com/view/monixaigods/home');
                // final Uri uri = Uri.parse('https://flutter.dev');
                _launchUrl(url: uri);
                // if (await canLaunchUrl(uri)){
                // await launchUrl(uri);
                // } else {
                // // can't launch url
                // }
                //
              },
              child: Text(
                StringManager.privacyPolicy,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: color.secondary1,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
