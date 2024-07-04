import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:spotrootpartner/constant/constant.dart';
import 'package:spotrootpartner/controllers/adMobController.dart';
import 'package:spotrootpartner/controllers/locationController.dart';
import 'package:spotrootpartner/controllers/widgetsController.dart';
import 'package:spotrootpartner/services/AdMobService.dart';
import 'package:spotrootpartner/views/landingScreens/Profile.dart';
import 'package:spotrootpartner/views/landingScreens/home.dart';
import 'package:spotrootpartner/views/landingScreens/income.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final loc = Get.put(LocationController());
  AdMobController adMobController = Get.put(AdMobController());

  @override
  void initState() {
    // adMobController.nativeSmallAdInHome = adMobController.createNativeAd(
    //     templateType: TemplateType.small, adType: 'homeSmall');
    // adMobController.nativeLargeAdInHome = adMobController.createNativeAd(
    //     templateType: TemplateType.medium, adType: 'homeLarge');
    // adMobController.nativeSmallAdInPayment = adMobController.createNativeAd(
    //     templateType: TemplateType.small, adType: 'paymentSmall');
    // adMobController.nativeLargeAdInPayment = adMobController.createNativeAd(
    //     templateType: TemplateType.medium, adType: 'paymentLarge');
    loc.getCurrentPosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.bgPrimary,
      bottomNavigationBar: GetBuilder<WidgetsController>(
          init: WidgetsController(),
          builder: (wid) {
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Constant.bgPrimary,
              currentIndex: wid.bottomNavIndex,
              onTap: (value) => setState(() {
                wid.bottomNavIndex = value;
              }),
              showSelectedLabels: false,
              showUnselectedLabels: false,
              elevation: 25,
              selectedItemColor: Constant.bgGreen,
              unselectedItemColor: Constant.textSecondary,
              items: [
                BottomNavigationBarItem(
                    icon: SizedBox(
                      height: 23,
                      child: Image.asset(
                        'lib/constant/icons/home.png',
                        color: wid.bottomNavIndex == 0
                            ? Constant.bgGreen
                            : Constant.textSecondary,
                      ),
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: SizedBox(
                      height: 23,
                      child: Image.asset(
                        'lib/constant/icons/income.png',
                        color: wid.bottomNavIndex == 1
                            ? Constant.bgGreen
                            : Constant.textSecondary,
                      ),
                    ),
                    label: 'Earnings'),
                // BottomNavigationBarItem(
                //     icon: SizedBox(
                //       height: 23,
                //       child: Image.asset(
                //         'lib/constant/icons/reviews.png',
                //         color: wid.bottomNavIndex == 2 ? Constant.bgRose : Constant.textSecondary,
                //       ),
                //     ),
                //     label: 'Reviews'),
                BottomNavigationBarItem(
                    icon: SizedBox(
                      height: 23,
                      child: Image.asset(
                        'lib/constant/icons/user.png',
                        color: wid.bottomNavIndex == 2
                            ? Constant.bgGreen
                            : Constant.textSecondary,
                      ),
                    ),
                    label: 'Profile'),
              ],
            );
          }),
      body: GetBuilder<WidgetsController>(
          init: WidgetsController(),
          builder: (wid) {
            return _buildBody[wid.bottomNavIndex];
          }),
    );
  }

  final _buildBody = const [
    HomeScreen(title: 'Spot Root'),
    IncomeScreen(title: 'Statements'),
    ProfileScreen(title: 'Personal Information')
  ];
}
