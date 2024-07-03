// ignore_for_file: file_names
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotrootpartner/constant/constant.dart';
import 'package:spotrootpartner/controllers/adMobController.dart';
import 'package:spotrootpartner/controllers/userStateController.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final adMobController = Get.put(AdMobController());

  @override
  void initState() {
    adMobController.createOpenAppAd();
    Timer(const Duration(seconds: 2), () {
      Get.find<UserStateController>().subscribeToAuthChanges();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.bgPrimary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        color: Constant.bgGreen,
        width: 100.w,
        height: 100.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Spot',
                  style: GoogleFonts.anton(
                      color: Constant.bgWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 32.sp,
                      letterSpacing: 2),
                ),
                Text(
                  'Root',
                  style: GoogleFonts.anton(
                      color: const Color(0xFFFFDE59),
                      fontWeight: FontWeight.bold,
                      fontSize: 32.sp,
                      letterSpacing: 2),
                ),
              ],
            ),
            SizedBox(
              height: .5..h,
            ),
            Text(
              //   'Won\'t Let You Miss a Single Spot',
              'A Spot Finders Application',
              style: GoogleFonts.anton(
                  color: Constant.bgWhite,
                  fontWeight: FontWeight.normal,
                  fontSize: 15.sp,
                  letterSpacing: 1),
            ),
            // Constant.textWithStyle(
            //     text: 'Won\'t Let You Miss a Single Spot',
            //     size: 15.sp,
            //     color: Color(0xFFFFE600),
            //     fontSpacing: 0,
            //     fontWeight: FontWeight.normal),
            SizedBox(
              height: 1.h,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     CupertinoActivityIndicator(
            //       color: Constant.textSecondary,
            //       radius: 2.5.w,
            //     ),
            //     SizedBox(
            //       width: 2.w,
            //     ),
            //     Constant.textWithStyle(
            //       text: 'waiting for network',
            //       color: Constant.textSecondary,
            //       size: 14.sp,
            //       fontWeight: FontWeight.normal,
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
