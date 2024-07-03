// ignore: file_names
import 'dart:ui';

import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:spotrootpartner/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotrootpartner/controllers/AddPlace/widgetSettings.dart';
import 'package:spotrootpartner/controllers/adMobController.dart';

class EntryDetails extends StatelessWidget {
  final TextEditingController entryTimeController;
  final TextEditingController costController;
  final TextEditingController openDayController;

  const EntryDetails(
      {super.key,
      required this.entryTimeController,
      required this.costController,
      required this.openDayController});

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
            text: 'Entrance Details',
            color: Constant.textPrimary,
            size: 20.sp,
            maxLine: 5,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: 1.h,
          ),
          Constant.textWithStyle(
            text: 'Entrance Details helps people to manage things.',
            color: Constant.textSecondary,
            size: 14.sp,
            maxLine: 5,
            fontWeight: FontWeight.normal,
          ),
          SizedBox(
            height: 3.h,
          ),
          ...anySpecificTime(),
          SizedBox(
            height: 3.h,
          ),
          ...anySpecificDay(),
          SizedBox(
            height: 3.h,
          ),
          ...anyEntryFee(),
          SizedBox(
            height: 3.h,
          ),
          ...isFamilyFriendly(),
          SizedBox(
            height: 3.h,
          ),
          ...holdFood(),
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
          SizedBox(height: 10.h),
        ],
      ),
    );
  }

  // getSheet({required String heading, required List data}) {
  //   return Get.bottomSheet(
  //       enableDrag: false,
  //       isDismissible: true,
  //       isScrollControlled: true,
  //       backgroundColor: Colors.transparent,
  //       DraggableScrollableSheet(
  //           initialChildSize: 0.5,
  //           maxChildSize: .9,
  //           minChildSize: 0.5,
  //           builder: (BuildContext context, ScrollController scrollController) {
  //             return ClipRRect(
  //               borderRadius: const BorderRadius.only(
  //                   topLeft: Radius.circular(20),
  //                   topRight: Radius.circular(20)),
  //               child: BackdropFilter(
  //                 filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
  //                 child: Container(
  //                   padding:
  //                       const EdgeInsets.only(top: 20, right: 20, left: 20),
  //                   decoration: const BoxDecoration(
  //                       borderRadius: BorderRadius.only(
  //                           topLeft: Radius.circular(20),
  //                           topRight: Radius.circular(20)),
  //                       color: Constant.bgWhite),
  //                   child: Column(
  //                     children: [
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Constant.textWithStyle(
  //                             text: heading,
  //                             size: 16.sp,
  //                             fontWeight: FontWeight.w500,
  //                             color: Constant.textPrimary,
  //                           ),
  //                           GestureDetector(
  //                             onTap: () {
  //                               Get.back();
  //                             },
  //                             child: const Icon(
  //                               Icons.close,
  //                               color: Constant.textPrimary,
  //                             ),
  //                           )
  //                         ],
  //                       ),
  //                       Divider(
  //                         height: 30,
  //                         color: Constant.textSecondary.withOpacity(.5),
  //                         thickness: .3,
  //                       ),
  //                       Expanded(
  //                         child: ListView(
  //                             controller: scrollController,
  //                             children: List.generate(
  //                               data.length,
  //                               (index) => Padding(
  //                                 padding:
  //                                     const EdgeInsets.symmetric(vertical: 10),
  //                                 child: Row(
  //                                   mainAxisAlignment:
  //                                       MainAxisAlignment.spaceBetween,
  //                                   children: [
  //                                     Constant.textWithStyle(
  //                                         text: data[index],
  //                                         color: Constant.textPrimary,
  //                                         size: 15.sp,
  //                                         fontWeight: FontWeight.normal),
  //                                   ],
  //                                 ),
  //                               ),
  //                             )),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             );
  //           }));
  // }

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

  isFamilyFriendly() {
    return [
      Constant.textWithStyle(
        text: 'Is this family friendly place?',
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
                    controller.isFamilyYes = 'Yes';
                  },
                  child: Container(
                    height: 2.5.h,
                    width: 2.5.h,
                    decoration: BoxDecoration(
                        color: controller.isFamilyYes == 'Yes'
                            ? Constant.bgGreen
                            : Colors.transparent,
                        border: Border.all(
                            color: controller.isFamilyYes == 'Yes'
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
                    controller.isFamilyYes = 'No';
                  },
                  child: Container(
                    height: 2.5.h,
                    width: 2.5.h,
                    decoration: BoxDecoration(
                        color: controller.isFamilyYes == 'No'
                            ? Constant.bgGreen
                            : Colors.transparent,
                        border: Border.all(
                            color: controller.isFamilyYes == 'No'
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

      // GetBuilder<WidgetSettingsController>(
      //
      //     builder: (controller) {
      //       if (!controller.isFamilyYes) {
      //         return Column(
      //           mainAxisAlignment: MainAxisAlignment.start,
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             SizedBox(
      //               height: 3.h,
      //             ),
      //             getThefields(
      //                 hintText:
      //                     'Please explain cost to visit this place',
      //                 maxLine: 50,
      //                 height: 15,
      //                 controller: costController),
      //             SizedBox(
      //               height: .5.h,
      //             ),
      //             Constant.textWithStyle(
      //               text:
      //                   'eg: Entry fee, Food, Additional accessories etc.',
      //               color: Constant.bgRed.withOpacity(.7),
      //               size: 14.sp,
      //               maxLine: 5,
      //               fontWeight: FontWeight.normal,
      //             ),
      //           ],
      //         );
      //       } else {
      //         return Container();
      //       }
      //     })
    ];
  }

  anyEntryFee() {
    return [
      Constant.textWithStyle(
        text: 'Is this place have any entry fee or other cost to visit?',
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
                    controller.costisYes = 'Yes';
                  },
                  child: Container(
                    height: 2.5.h,
                    width: 2.5.h,
                    decoration: BoxDecoration(
                        color: controller.costisYes == 'Yes'
                            ? Constant.bgGreen
                            : Colors.transparent,
                        border: Border.all(
                            color: controller.costisYes == 'Yes'
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
                    controller.costisYes = 'No';
                  },
                  child: Container(
                    height: 2.5.h,
                    width: 2.5.h,
                    decoration: BoxDecoration(
                        color: controller.costisYes == 'No'
                            ? Constant.bgGreen
                            : Colors.transparent,
                        border: Border.all(
                            color: controller.costisYes == 'No'
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
      GetBuilder<WidgetSettingsController>(builder: (controller) {
        if (controller.costisYes == 'Yes') {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 3.h,
              ),
              getThefields(
                  hintText: 'Please explain cost to visit this place',
                  maxLine: 50,
                  height: 15,
                  controller: costController),
              SizedBox(
                height: .5.h,
              ),
              Constant.textWithStyle(
                text: 'eg: Entry fee, Food, Additional accessories etc.',
                color: Constant.bgRed.withOpacity(.7),
                size: 14.sp,
                maxLine: 5,
                fontWeight: FontWeight.normal,
              ),
            ],
          );
        } else {
          return Container();
        }
      }),
    ];
  }

  anySpecificTime() {
    return [
      Constant.textWithStyle(
        text: 'Is this place have any specific time to entrance?',
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
                    controller.entryTimeisYes = 'Yes';
                  },
                  child: Container(
                    height: 2.5.h,
                    width: 2.5.h,
                    decoration: BoxDecoration(
                        color: controller.entryTimeisYes == 'Yes'
                            ? Constant.bgGreen
                            : Colors.transparent,
                        border: Border.all(
                            color: controller.entryTimeisYes == 'Yes'
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
                    controller.entryTimeisYes = 'No';
                  },
                  child: Container(
                    height: 2.5.h,
                    width: 2.5.h,
                    decoration: BoxDecoration(
                        color: controller.entryTimeisYes == 'No'
                            ? Constant.bgGreen
                            : Colors.transparent,
                        border: Border.all(
                            color: controller.entryTimeisYes == 'No'
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
      GetBuilder<WidgetSettingsController>(builder: (controller) {
        if (controller.entryTimeisYes == 'Yes') {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 1.h,
              ),
              getThefields(
                  hintText: 'Entrance time',
                  maxLine: 2,
                  height: 6,
                  controller: entryTimeController),
              SizedBox(
                height: .5.h,
              ),
              Constant.textWithStyle(
                text: 'Please mention the time limit to enter to this place',
                color: Constant.bgRed.withOpacity(.7),
                size: 14.sp,
                maxLine: 5,
                fontWeight: FontWeight.normal,
              ),
            ],
          );
        } else {
          return Container();
        }
      }),
    ];
  }

  anySpecificDay() {
    return [
      Constant.textWithStyle(
        text: 'Is this place open all day?',
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
                    controller.isOpenAllDay = 'Yes';
                  },
                  child: Container(
                    height: 2.5.h,
                    width: 2.5.h,
                    decoration: BoxDecoration(
                        color: controller.isOpenAllDay == 'Yes'
                            ? Constant.bgGreen
                            : Colors.transparent,
                        border: Border.all(
                            color: controller.isOpenAllDay == 'Yes'
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
                    controller.isOpenAllDay = 'No';
                  },
                  child: Container(
                    height: 2.5.h,
                    width: 2.5.h,
                    decoration: BoxDecoration(
                        color: controller.isOpenAllDay == 'No'
                            ? Constant.bgGreen
                            : Colors.transparent,
                        border: Border.all(
                            color: controller.isOpenAllDay == 'No'
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
      GetBuilder<WidgetSettingsController>(builder: (controller) {
        if (controller.isOpenAllDay == 'No') {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 1.h,
              ),
              getThefields(
                  hintText: 'Which day is close',
                  maxLine: 3,
                  height: 12,
                  controller: openDayController),
              SizedBox(
                height: .5.h,
              ),
              Constant.textWithStyle(
                text: 'Please mention the time limit to enter to this place',
                color: Constant.bgRed.withOpacity(.7),
                size: 14.sp,
                maxLine: 5,
                fontWeight: FontWeight.normal,
              ),
            ],
          );
        } else {
          return Container();
        }
      }),
    ];
  }

  holdFood() {
    return [
      Constant.textWithStyle(
        text: 'Do we need to hold any food or drinks in hand?.',
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
                    controller.holdFood = 'Yes';
                  },
                  child: Container(
                    height: 2.5.h,
                    width: 2.5.h,
                    decoration: BoxDecoration(
                        color: controller.holdFood == 'Yes'
                            ? Constant.bgGreen
                            : Colors.transparent,
                        border: Border.all(
                            color: controller.holdFood == 'Yes'
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
                    controller.holdFood = 'No';
                  },
                  child: Container(
                    height: 2.5.h,
                    width: 2.5.h,
                    decoration: BoxDecoration(
                        color: controller.holdFood == 'No'
                            ? Constant.bgGreen
                            : Colors.transparent,
                        border: Border.all(
                            color: controller.holdFood == 'No'
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
