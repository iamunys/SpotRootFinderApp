import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:spotrootpartner/services/dependencyInjection.dart';
import 'package:spotrootpartner/services/locator.dart';
import 'package:spotrootpartner/views/SplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(MobileAds.instance.initialize());
  await Firebase.initializeApp();
  runApp(const MyApp());
  serviceLocator();
  DependancyInjection.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Spot Root Partner',
          theme: ThemeData(
            // colorScheme: ColorScheme.fromSeed(
            //     seedColor: Color.fromARGB(255, 255, 0, 0)),
            useMaterial3: true,
          ),
          home: const SplashScreen());
    });
  }
}
