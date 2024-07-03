// ignore: file_names
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:spotrootpartner/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotrootpartner/controllers/AddPlace/addPlaceController.dart';
import 'package:spotrootpartner/controllers/AddPlace/widgetSettings.dart';
import 'package:spotrootpartner/controllers/adMobController.dart';

class SpotInformation extends StatelessWidget {
  final TextEditingController whatHaveController;
  final TextEditingController atrractedController;
  final TextEditingController bestTimeController;

  const SpotInformation(
      {super.key,
      required this.bestTimeController,
      required this.whatHaveController,
      required this.atrractedController});

  @override
  Widget build(BuildContext context) {
    final adMobControll = Get.put(AdMobController());

    adMobControll.setbannerLargeAdInSpot =
        adMobControll.createBannerAd(size: AdSize.largeBanner);
    adMobControll.setbannerLargeAdInSpot =
        adMobControll.createBannerAd(size: AdSize.largeBanner);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Constant.textWithStyle(
            text: 'Why this spot',
            color: Constant.textPrimary,
            size: 20.sp,
            maxLine: 5,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: 1.h,
          ),
          Constant.textWithStyle(
            text: 'Add effectevely will helps to reach more clicks.',
            color: Constant.textSecondary,
            size: 14.sp,
            maxLine: 5,
            fontWeight: FontWeight.normal,
          ),
          // SizedBox(
          //   height: 3.h,
          // ),
          // getThefields(
          //     hintText: 'Means of traveling to this destination',
          //     maxLine: 100,
          //     height: 20,
          //     controller: whatHaveController),
          // SizedBox(
          //   height: .5.h,
          // ),
          // Constant.textWithStyle(
          //   text:
          //       'Please explain why the place is attractive?. What to see there?.',
          //   color: Constant.bgRed.withOpacity(.7),
          //   size: 14.sp,
          //   maxLine: 5,
          //   fontWeight: FontWeight.normal,
          // ),
          SizedBox(
            height: 3.h,
          ),
          ...willYouVisitAgain(),
          SizedBox(
            height: 1.h,
          ),
          GetBuilder<WidgetSettingsController>(
            builder: (controller) {
              if (controller.willYouVisitAgain == 'Yes' ||
                  controller.willYouVisitAgain == 'No') {
                return getThefields(
                    hintText: controller.willYouVisitAgain == 'Yes'
                        ? 'What attracted you in this spot?.'
                        : 'Why you won\'t visit this again?.',
                    maxLine: 100,
                    height: 20,
                    controller: atrractedController);
              } else {
                return Container();
              }
            },
          ),
          SizedBox(
            height: 3.h,
          ),
          getThefields(
              hintText: 'Current info',
              maxLine: 100,
              height: 20,
              controller: bestTimeController),
          SizedBox(
            height: .5.h,
          ),
          Constant.textWithStyle(
            text:
                'eg : What is the climate and situation of this spot now?. Is this right time to visit? etc.',
            color: Constant.bgRed.withOpacity(.7),
            size: 14.sp,
            maxLine: 5,
            fontWeight: FontWeight.normal,
          ),
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
                      child: AdWidget(ad: adMobControll.bannerLargeAdInSpot!)),
                ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }

  getThefields(
      {required String hintText,
      required int maxLine,
      required int height,
      required TextEditingController controller}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: height.h,
      width: 100.w,
      decoration: BoxDecoration(
          color: Constant.bgSecondary,
          // border: Border.all(color: Constant.bgGreen, width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        controller: controller,
        cursorColor: Constant.textPrimary,
        maxLines: maxLine,
        textAlign: TextAlign.left,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: GoogleFonts.unbounded(
                color: Constant.textSecondary.withOpacity(.5),
                fontSize: 15.sp,
                letterSpacing: 2,
                fontWeight: FontWeight.normal)),
        style: GoogleFonts.unbounded(
            color: Constant.textPrimary,
            fontSize: 15.sp,
            letterSpacing: 2,
            fontWeight: FontWeight.w500),
      ),
    );
  }

  willYouVisitAgain() {
    return [
      Constant.textWithStyle(
        text: 'Will you visit this place again?.',
        color: Constant.textPrimary.withOpacity(.8),
        size: 15.sp,
        maxLine: 5,
        fontWeight: FontWeight.normal,
      ),
      SizedBox(
        height: 2.h,
      ),
      GetBuilder<WidgetSettingsController>(builder: (controller) {
        return Row(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.find<AddPlaceController>().currentSituation.clear();
                    controller.willYouVisitAgain = 'Yes';
                  },
                  child: Container(
                    height: 2.5.h,
                    width: 2.5.h,
                    decoration: BoxDecoration(
                        color: controller.willYouVisitAgain == 'Yes'
                            ? Constant.bgGreen
                            : Colors.transparent,
                        border: Border.all(
                            color: controller.willYouVisitAgain == 'Yes'
                                ? Constant.bgGreen
                                : Constant.textSecondary,
                            width: 2),
                        shape: BoxShape.circle),
                  ),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Constant.textWithStyle(
                  text: 'Yes',
                  color: Constant.textPrimary.withOpacity(.8),
                  size: 15.sp,
                  maxLine: 5,
                  fontWeight: FontWeight.normal,
                ),
              ],
            ),
            SizedBox(
              width: 5.h,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.find<AddPlaceController>().currentSituation.clear();

                    controller.willYouVisitAgain = 'No';
                  },
                  child: Container(
                    height: 2.5.h,
                    width: 2.5.h,
                    decoration: BoxDecoration(
                        color: controller.willYouVisitAgain == 'No'
                            ? Constant.bgGreen
                            : Colors.transparent,
                        border: Border.all(
                            color: controller.willYouVisitAgain == 'No'
                                ? Constant.bgGreen
                                : Constant.textSecondary,
                            width: 2),
                        shape: BoxShape.circle),
                  ),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Constant.textWithStyle(
                  text: 'No',
                  color: Constant.textPrimary.withOpacity(.8),
                  size: 15.sp,
                  maxLine: 5,
                  fontWeight: FontWeight.normal,
                ),
              ],
            ),
          ],
        );
      }),
      SizedBox(
        width: 10.h,
      ),
    ];
  }
}
