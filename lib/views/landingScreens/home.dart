import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:spotrootpartner/constant/constant.dart';
import 'package:spotrootpartner/controllers/adMobController.dart';
import 'package:spotrootpartner/views/addAPlace.dart';
import 'package:spotrootpartner/widgets/homeWidgets/addedPlaces.dart';
import 'package:spotrootpartner/widgets/homeWidgets/clicksAndEarnings.dart';
import 'package:spotrootpartner/widgets/homeWidgets/addAPlace.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.bgPrimary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        backgroundColor: Constant.bgPrimary,
        title: Constant.textWithStyle(
            fontWeight: FontWeight.bold,
            text: title,
            size: 18.sp,
            color: Constant.bgGreen),
      ),
      body: Container(
        height: 100.h,
        width: 100.w,
        color: Constant.bgPrimary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GetBuilder<AdMobController>(
                  init: AdMobController(),
                  builder: (controller) => controller.largeNativeLoaderHome
                      ? Container(
                          alignment: Alignment.center,
                          height: 50.h,
                          child: Center(
                            child: AdWidget(
                                ad: controller.getNativeLargeAdInHome!),
                          ),
                        )
                      : Container(
                        ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                const ClicksAndEarnings(),
                SizedBox(
                  height: 1.h,
                ),
                const AddANewPlace(),
                SizedBox(
                  height: 1.h,
                ),
                GetBuilder<AdMobController>(
                  init: AdMobController(),
                  builder: (controller) => controller.smallNativeLoaderHome
                      ? Container(
                          alignment: Alignment.center,
                          height: 15.h,
                          child: Center(
                            child: AdWidget(
                                ad: controller.getNativeSmallAdInHome!),
                          ),
                        )
                      : Container(),
                ),
                SizedBox(
                  height: 1.h,
                ),
                const AddedPlaces(),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 2,
        backgroundColor: Constant.bgSecondary,
        onPressed: () {
          Get.to(() => const AddAPlaceScreen());
        },
        tooltip: 'Add a Spot',
        child: SizedBox(
          height: 25,
          child: Image.asset('lib/constant/icons/addLocation.png',
              color: Constant.bgGreen),
        ),
      ),
    );
  }
}
