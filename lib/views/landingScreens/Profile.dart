// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:spotrootpartner/constant/constant.dart';
import 'package:spotrootpartner/controllers/adMobController.dart';
import 'package:spotrootpartner/widgets/profileWidgets/editProfile.dart';
import 'package:spotrootpartner/widgets/profileWidgets/faqs.dart';
import 'package:spotrootpartner/widgets/profileWidgets/helpCenter.dart';
import 'package:spotrootpartner/widgets/profileWidgets/logout.dart';
import 'package:spotrootpartner/widgets/profileWidgets/profilePicture.dart';
import 'package:spotrootpartner/widgets/profileWidgets/suggestion.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    AdMobController adMobControll = Get.put(AdMobController());

    adMobControll.setbannerLargeAdInSpot =
        adMobControll.createBannerAd(size: AdSize.largeBanner);
    adMobControll.setbannerLargeAdInSpot =
        adMobControll.createBannerAd(size: AdSize.largeBanner);
    return Scaffold(
      backgroundColor: Constant.bgPrimary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Constant.bgPrimary,
        title: Constant.textWithStyle(
            text: title, size: 17.sp, color: Constant.bgGreen),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 100.h,
          width: 100.w,
          color: Constant.bgPrimary,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 1.h,
                ),
                const PersonalInfo(),
                SizedBox(
                  height: 1.h,
                ),
                const EditProfile(),
                SizedBox(
                  height: 1.h,
                ),
                // const FAQS(),
                // SizedBox(
                //   height: 1.h,
                // ),
                const HelpCenter(),
                SizedBox(
                  height: 1.h,
                ),
                // const SuggestionScreen(),
                // SizedBox(
                //   height: 1.h,
                // ),
                const Logout(),
                SizedBox(
                  height: 3.h,
                ),
                adMobControll.bannerLargeAdInSpot == null
                    ? Container(
                        margin: const EdgeInsets.only(bottom: 0),
                        height: 1.h,
                        width: 100.w,
                      )
                    : Container(
                        margin: const EdgeInsets.only(bottom: 0),
                        height: 15.h,
                        width: 100.w,
                        child: Center(
                            child: AdWidget(
                                ad: adMobControll.bannerLargeAdInSpot!)),
                      ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
