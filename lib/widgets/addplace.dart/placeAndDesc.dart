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

class PlaceAndDesc extends StatelessWidget {
  final TextEditingController placeNameController;
  final TextEditingController descController;

  const PlaceAndDesc(
      {super.key,
      required this.placeNameController,
      required this.descController});

  @override
  Widget build(BuildContext context) {
    final adMobControll = Get.put(AdMobController());

    adMobControll.setbannerLargeAdInSpot =
        adMobControll.createBannerAd(size: AdSize.largeBanner);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Constant.textWithStyle(
            text: 'Brief the spot',
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
          getThefields(
              hintText: 'Place name',
              maxLine: 1,
              height: 6,
              controller: placeNameController),
          SizedBox(
            height: 1.h,
          ),
          getThefields(
              hintText: 'About spot',
              maxLine: 50,
              height: 20,
              controller: descController),
          SizedBox(
            height: .5.h,
          ),
          Constant.textWithStyle(
            text:
                'Please brief the spot, what to attract?, What to see there?.',
            color: Constant.bgRed.withOpacity(.7),
            size: 14.sp,
            maxLine: 5,
            fontWeight: FontWeight.normal,
          ),
          SizedBox(
            height: 3.h,
          ),
          Constant.textWithStyle(
            text: 'Select the type',
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
                controller.placeType.length,
                (i) {
                  return ActionChip(
                    side: BorderSide.none,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 3),
                    onPressed: () {
                      if (controller.selectedPlaceType
                          .contains(controller.placeType[i])) {
                        controller.deletefromSelectedtypes =
                            controller.placeType[i];
                      } else {
                        controller.addtoSelectedtypes = controller.placeType[i];
                      }
                    },
                    backgroundColor: controller.selectedPlaceType
                            .contains(controller.placeType[i])
                        ? Constant.bgGreen
                        : Constant.textSecondary,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    label: Constant.textWithStyle(
                      text: controller.placeType[i],
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
          // getThefields(
          //     hintText: 'Land Mark',
          //     maxLine: 50,
          //     height: 20,
          //     controller: landMarkController),
          // SizedBox(
          //   height: .5.h,
          // ),
          // Constant.textWithStyle(
          //   text:
          //       'Please write a root map to the spot helps people get there if anyone get stuck. Written root map helps to find spot in out of network coverage area.',
          //   color: Constant.bgRed.withOpacity(.7),
          //   size: 14.sp,
          //   maxLine: 5,
          //   fontWeight: FontWeight.normal,
          // ),
          // SizedBox(
          //   height: .5.h,
          // ),
          // Constant.textWithStyle(
          //   text:
          //       'eg : The nearest metro station to Wonderla is the Kengeri Metro Station,'
          //       ' which is on the Purple Line. You can take a bus or taxi from the metro station to the park.'
          //       ' And the park is opposite side of the sundaran tea stall.',
          //   color: Constant.bgRed.withOpacity(.7),
          //   size: 14.sp,
          //   maxLine: 5,
          //   fontWeight: FontWeight.normal,
          // ),
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
}
