import 'dart:async';

import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:spotrootpartner/constant/constant.dart';
import 'package:spotrootpartner/controllers/adMobController.dart';
import 'package:spotrootpartner/widgets/paymentWidgets/graph.dart';
import 'package:spotrootpartner/widgets/paymentWidgets/passbook.dart';
import 'package:spotrootpartner/widgets/paymentWidgets/pendingAndPaid.dart';
import 'package:spotrootpartner/widgets/utilis.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class IncomeScreen extends StatelessWidget {
  const IncomeScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    AdMobController adMobControll = Get.put(AdMobController());

    // adMobControll.setbannerLargeAdInSpot =
    //     adMobControll.createBannerAd(size: AdSize.largeBanner);
    // adMobControll.setbannerLargeAdInSpot =
    //     adMobControll.createBannerAd(size: AdSize.largeBanner);
    return Scaffold(
      backgroundColor: Constant.bgPrimary,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        backgroundColor: Constant.bgPrimary,
        title: Constant.textWithStyle(
            text: title, size: 17.sp, color: Constant.bgGreen),
      ),
      body: Container(
        height: 100.h,
        width: 100.w,
        color: Constant.bgPrimary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              // GetBuilder<AdMobController>(
              //   builder: (controller) => controller.smallNativeLoaderPayment
              //       ? Container(
              //           alignment: Alignment.center,
              //           height: 15.h,
              //           child: Center(
              //             child: AdWidget(
              //                 ad: controller.getNativeSmallAdInPayment!),
              //           ),
              //         )
              //       : Container(),
              // ),
              const SizedBox(
                height: 1,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Constant.bgRed,
                    borderRadius: BorderRadius.circular(10)),
                child: Constant.textWithStyle(
                    text:
                        'Montly statitics is not funcationable will update soon in next version. Please keep excited.',
                    size: 14.sp,
                    color: Constant.bgWhite,
                    maxLine: 5,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 1.h,
              ),
              const PaymentGraph(),
              SizedBox(
                height: 1.h,
              ),
              // GetBuilder<AdMobController>(
              //   builder: (controller) => controller.largeNativeLoaderPayment
              //       ? Container(
              //           alignment: Alignment.center,
              //           height: 50.h,
              //           child: Center(
              //             child: AdWidget(
              //                 ad: controller.getNativeLargeAdInPayment!),
              //           ),
              //         )
              //       : Container(),
              // ),
              SizedBox(
                height: 1.h,
              ),
              const PaymentPendingAndPaid(),
              SizedBox(
                height: 1.h,
              ),
              // adMobControll.bannerLargeAdInSpot == null
              //     ? Container(
              //         margin: const EdgeInsets.only(bottom: 0),
              //         height: 1.h,
              //         width: 100.w,
              //       )
              //     : Container(
              //         margin: const EdgeInsets.only(bottom: 0),
              //         height: 15.h,
              //         width: 100.w,
              //         child: Center(
              //             child:
              //                 AdWidget(ad: adMobControll.bannerLargeAdInSpot!)),
              //       ),
              SizedBox(
                height: 1.h,
              ),
              const PaymentPassbook(),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
