import 'package:spotrootpartner/constant/constant.dart';
import 'package:spotrootpartner/controllers/widgetsController.dart';
import 'package:spotrootpartner/widgets/utilis.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ClicksAndEarnings extends StatelessWidget {
  const ClicksAndEarnings({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsController wid = Get.put(WidgetsController());
    return SizedBox(
      height: 23.h,
      width: 100.w,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Constant.bgSecondary,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      height: 15.w,
                      width: 15.w,
                      decoration: const BoxDecoration(
                        color: Constant.bgPrimary,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                          child: Image.asset(
                        'lib/constant/icons/dollar.png',
                        color: Constant.bgBlue,
                      )),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Constant.textWithStyle(
                        text: 'Total Earnings',
                        size: 14.sp,
                        maxLine: 3,
                        fontWeight: FontWeight.normal,
                        color: Constant.textSecondary),
                    Constant.textWithStyle(
                        text: '\$0',
                        size: 16.sp,
                        maxLine: 3,
                        fontWeight: FontWeight.w600,
                        color: Constant.textPrimary),
                    SizedBox(
                      height: 1.h,
                    ),
                    SizedBox(
                      height: 4.h,
                      width: 100.w,
                      child: ElevatedButton(
                        onPressed: () async {
                          wid.bottomNavIndex = 1;
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:Constant.bgBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Constant.textWithStyle(
                          text: 'View Earnigs',
                          color: Constant.bgWhite,
                          fontWeight: FontWeight.w500,
                          size: 14.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 1.h,
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              color: Constant.bgSecondary,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    height: 15.w,
                    width: 15.w,
                    decoration: const BoxDecoration(
                      color: Constant.bgPrimary,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                        child: Image.asset(
                      'lib/constant/icons/click.png',
                      color: Constant.bgOrange,
                    )),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Constant.textWithStyle(
                      text: 'Total Clicks',
                      size: 14.sp,
                      maxLine: 3,
                      fontWeight: FontWeight.normal,
                      color: Constant.textSecondary),
                  Constant.textWithStyle(
                      text: '0',
                      size: 16.sp,
                      maxLine: 3,
                      fontWeight: FontWeight.w600,
                      color: Constant.textPrimary),
                  SizedBox(
                    height: 1.h,
                  ),
                  SizedBox(
                    height: 4.h,
                    width: 100.w,
                    child: ElevatedButton(
                      onPressed: () async {
                        Utilis.showAlertDialog(
                            context: context,
                            title: 'Coming Soon...',
                            description:
                                'This Feature will update soon in next version. Please keep excited.');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Constant.bgOrange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Constant.textWithStyle(
                        text: 'View All',
                        color: Constant.bgWhite,
                        fontWeight: FontWeight.w500,
                        size: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
          // Expanded(
          //   child: Card(
          //     color: Constant.bgLightRose,
          //     elevation: 3,
          //     child: Padding(
          //       padding: const EdgeInsets.all(10.0),
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Container(
          //             padding: const EdgeInsets.all(15),
          //             height: 15.w,
          //             width: 15.w,
          //             decoration: const BoxDecoration(
          //               color: Constant.bgWhite,
          //               shape: BoxShape.circle,
          //             ),
          //             child: Center(
          //                 child: Image.asset(
          //               'lib/constant/icons/click.png',
          //               color: Constant.bgRose,
          //             )),
          //           ),
          //           SizedBox(
          //             height: 1.h,
          //           ),
          //           Constant.textWithStyle(
          //               text: 'Total Clicks',
          //               size: 14.sp,
          //               maxLine: 3,
          //               color: Constant.textSecondary),
          //           Constant.textWithStyle(
          //               text: '55k',
          //               size: 16.sp,
          //               maxLine: 3,
          //               color: Constant.textPrimary),
          //           SizedBox(
          //             height: 1.h,
          //           ),
          //           SizedBox(
          //             height: 4.h,
          //             width: 100.w,
          //             child: ElevatedButton(
          //               onPressed: () async {},
          //               style: ElevatedButton.styleFrom(
          //                 backgroundColor: Constant.bgRose,
          //                 shape: RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(30),
          //                 ),
          //               ),
          //               child: Constant.textWithStyle(
          //                 text: 'View All',
          //                 color: Constant.bgWhite,
          //                 fontWeight: FontWeight.w600,
          //                 size: 14.sp,
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
