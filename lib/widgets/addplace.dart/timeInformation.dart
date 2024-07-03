// ignore: file_names
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:spotrootpartner/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotrootpartner/controllers/AddPlace/widgetSettings.dart';
import 'package:spotrootpartner/controllers/adMobController.dart';

class TimeInformation extends StatelessWidget {
  const TimeInformation({super.key});

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
            text: 'What time ?',
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
          SizedBox(
            height: 3.h,
          ),
          ...bestMonth(),
          SizedBox(
            height: 3.h,
          ),
          ...bestTime(),
          SizedBox(
            height: 3.h,
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

  bestMonth() {
    return [
      Constant.textWithStyle(
        text: 'Best Month to visit',
        color: Constant.textPrimary.withOpacity(.8),
        size: 16.sp,
        maxLine: 1,
        fontWeight: FontWeight.w500,
      ),
      SizedBox(
        height: 1.h,
      ),
      GetBuilder<WidgetSettingsController>(builder: (controller) {
        return Wrap(
          spacing: 6,
          children: List.generate(
            controller.monthList.length,
            (i) {
              return ActionChip(
                side: BorderSide.none,
                labelPadding: const EdgeInsets.symmetric(horizontal: 3),
                onPressed: () {
                  if (controller.selectedMonth
                      .contains(controller.monthList[i])) {
                    controller.deleteSelectedMonths = controller.monthList[i];
                  } else {
                    controller.addSelectedMonth = controller.monthList[i];
                  }
                },
                backgroundColor:
                    controller.selectedMonth.contains(controller.monthList[i])
                        ? Constant.bgGreen
                        : Constant.textSecondary,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                label: Constant.textWithStyle(
                  text: controller.monthList[i],
                  color: Constant.bgWhite,
                  size: 15.sp,
                  maxLine: 1,
                  fontWeight: FontWeight.normal,
                ),
              );
            },
          ),
        );
      }),
    ];
  }

  bestTime() {
    return [
      Constant.textWithStyle(
        text: 'Best Time to visit',
        color: Constant.textPrimary.withOpacity(.8),
        size: 16.sp,
        maxLine: 1,
        fontWeight: FontWeight.w500,
      ),
      SizedBox(
        height: 1.h,
      ),
      GetBuilder<WidgetSettingsController>(builder: (controller) {
        return Wrap(
          spacing: 6,
          children: List.generate(
            controller.timeList.length,
            (i) {
              return ActionChip(
                side: BorderSide.none,
                labelPadding: const EdgeInsets.symmetric(horizontal: 3),
                onPressed: () {
                  if (controller.selectedTime
                      .contains(controller.timeList[i])) {
                    controller.deleteSelectedTime = controller.timeList[i];
                  } else {
                    controller.addSelectedTime = controller.timeList[i];
                  }
                },
                backgroundColor:
                    controller.selectedTime.contains(controller.timeList[i])
                        ? Constant.bgGreen
                        : Constant.textSecondary,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                label: Constant.textWithStyle(
                  text: controller.timeList[i],
                  color: Constant.bgWhite,
                  size: 15.sp,
                  maxLine: 1,
                  fontWeight: FontWeight.normal,
                ),
              );
            },
          ),
        );
      }),
    ];
  }
}
