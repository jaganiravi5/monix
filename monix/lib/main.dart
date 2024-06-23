import 'package:common/common.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:monix/firebase_options.dart';
import 'package:monix/router/router.dart';
import 'package:network/network.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
// static final String oneSignalAppId = "c0d46362-978e-42f4-acf0-71a18dea3663";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  MobileAds.instance.initialize();

  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize("c0d46362-978e-42f4-acf0-71a18dea3663");
  OneSignal.Notifications.requestPermission(true);
  //  OneSignal.shared
  //      .promptUserForPushNotificationPermission()
  //      .then((accepted) {});

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Future.delayed(const Duration(milliseconds: 150));
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
//     String? screen;
//     OneSignal.Notifications.addClickListener((event){
// final data = event.notification.additionalData;
// screen = data?['screen'];
// if(screen!=null){
//   rootNavigatorKey.currentState?.pushNamed(screen!);
// }
//     });
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return AppRouter(
          builder: (context, router) => MaterialApp.router(
            theme: lightTheme,
            debugShowCheckedModeBanner: false,
            routerConfig: router,
            builder: (context, child) => Material(child: child),
          ),
        );
      },
    );
  }
}
