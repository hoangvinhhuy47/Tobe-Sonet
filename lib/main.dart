import 'dart:io';
import 'package:app_tobe_sonet/src/screen/main/index.dart';
import 'package:app_tobe_sonet/src/screen/splash/screenSplash_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:device_preview/device_preview.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
// import 'package:get/get.dart';
// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }

void main() async {
  // runApp(DevicePreview(
  //   builder: (context) => const MyApp(),
  //   enabled: !kReleaseMode,
  // ));
  // HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SplashScreenView(
            navigateRoute: WellComeScreen(),
            duration: 3000,
            imageSize: 80,
            imageSrc: 'lib/src/assets/images/AppLogo.png',
            backgroundColor: Colors.white));
  }
}
