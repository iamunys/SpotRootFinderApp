// ignore: file_names

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:spotrootpartner/constant/constant.dart';
import 'package:spotrootpartner/controllers/adMobController.dart';
import 'package:spotrootpartner/controllers/locationController.dart';
import 'package:spotrootpartner/controllers/mutationController.dart';
import 'package:spotrootpartner/views/GoogleMapScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddLocation extends StatelessWidget {
  final TextEditingController landMarkController;

  const AddLocation({super.key, required this.landMarkController});

  @override
  Widget build(BuildContext context) {
    final adMobControll = Get.put(AdMobController());

    adMobControll.setbannerLargeAdInSpot =
        adMobControll.createBannerAd(size: AdSize.largeBanner);

    return GetBuilder<LocationController>(
        init: LocationController(),
        builder: (loc) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Constant.textWithStyle(
                  text: 'Add a spot',
                  color: Constant.textPrimary,
                  size: 20.sp,
                  maxLine: 5,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 1.h,
                ),
                Constant.textWithStyle(
                  //  text: 'Add effectevely will helps to reach more clicks.',
                  text:
                      'Try to get people there!. we should know the location of the spot you found.',
                  color: Constant.textSecondary,
                  size: 14.sp,
                  maxLine: 5,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(
                  height: 3.h,
                ),
                if (loc.currentAddress != '')
                  Row(
                    children: [
                      Image.asset(
                        'lib/constant/icons/pin.png',
                        color: Constant.bgRed,
                        scale: 18,
                      ),
                      Expanded(
                        child: Constant.textWithStyle(
                            text: loc.currentAddress,
                            maxLine: 10,
                            fontWeight: FontWeight.normal,
                            size: 14.sp,
                            color: Constant.bgRed),
                      ),
                    ],
                  ),
                SizedBox(
                  height: 3.h,
                ),
                SizedBox(
                  height: 5.h,
                  width: 100.w,
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      Get.to(() => const GoogleMapScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Constant.bgGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    icon: loc.fetchingLocation
                        ? const SizedBox()
                        : Transform.rotate(
                            angle: -5.5,
                            child: const Icon(
                              Icons.navigation_rounded,
                              color: Constant.bgWhite,
                            )),
                    label: loc.fetchingLocation
                        ? SizedBox(
                            height: 8.h,
                            width: 100.w,
                            child: const MutationLoader())
                        : Constant.textWithStyle(
                            text: 'Manually select spot location',
                            color: Constant.bgWhite,
                            fontWeight: FontWeight.normal,
                            size: 14.sp,
                          ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
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
                            child: AdWidget(
                                ad: adMobControll.bannerLargeAdInSpot!)),
                      ),
                       SizedBox(
            height: 10.h,
          ),
              ],
            ),
          );
        });
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
