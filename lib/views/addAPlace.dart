// ignore_for_file: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spotrootpartner/constant/constant.dart';
import 'package:spotrootpartner/controllers/AddPlace/addPlaceController.dart';
import 'package:spotrootpartner/controllers/AddPlace/widgetSettings.dart';
import 'package:spotrootpartner/controllers/PickMediaController.dart';
import 'package:spotrootpartner/controllers/adMobController.dart';
import 'package:spotrootpartner/controllers/locationController.dart';
import 'package:spotrootpartner/services/AdMobService.dart';
import 'package:spotrootpartner/widgets/addplace.dart/spotInformation.dart';
import 'package:spotrootpartner/widgets/addplace.dart/addimages.dart';
import 'package:spotrootpartner/widgets/addplace.dart/entryDetails.dart';
import 'package:spotrootpartner/widgets/addplace.dart/location.dart';
import 'package:spotrootpartner/widgets/addplace.dart/timeInformation.dart';
import 'package:spotrootpartner/widgets/addplace.dart/uploadSpot.dart';
import 'package:spotrootpartner/widgets/addplace.dart/placeAndDesc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddAPlaceScreen extends StatefulWidget {
  const AddAPlaceScreen({
    super.key,
  });

  @override
  State<AddAPlaceScreen> createState() => _AddAPlaceScreenState();
}

class _AddAPlaceScreenState extends State<AddAPlaceScreen> {
  final adMobControll = Get.put(AdMobController());

  @override
  void initState() {
    initializedAd();
    super.initState();
  }

  initializedAd() {
    adMobControll.createInterstitialAd();
    adMobControll.setBannerSmallAdInSpot =
        adMobControll.createBannerAd(size: AdSize.banner);
   
  }

  @override
  Widget build(BuildContext context) {
    Get.put(LocationController());
    Get.put(WidgetSettingsController());
    Get.put(ImagePickerController());

    PageController controller =
        PageController(viewportFraction: 1, keepPage: true);

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: GetBuilder<AddPlaceController>(
          init: AddPlaceController(),
          builder: (addPlaceController) {
            return Scaffold(
                backgroundColor: Constant.bgPrimary,
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  elevation: 0,
                  surfaceTintColor: Colors.transparent,
                  backgroundColor: Constant.bgPrimary,
                  leading: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.close)),
                  actions: [
                    if (!addPlaceController.isFirst)
                      TextButton(
                        onPressed: () {
                          controller.previousPage(
                              duration: const Duration(microseconds: 1),
                              curve: Curves.linear);
                          addPlaceController.isEnd = false;
                          if (controller.page!.toInt() == 1) {
                            addPlaceController.isFirst = true;
                          }
                        },
                        child: Constant.textWithStyle(
                          text: 'Back',
                          color: Constant.bgGreen,
                          size: 15.sp,
                          maxLine: 5,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    if (!addPlaceController.isEnd)
                      TextButton(
                        onPressed: () {
                          print(Timestamp.now());
                          controller.nextPage(
                              duration: const Duration(microseconds: 1),
                              curve: Curves.linear);
                          addPlaceController.isFirst = false;
                          if (controller.page!.toInt() == 5 ||
                              controller.page!.toInt() == 6) {
                            addPlaceController.isEnd = true;
                          }
                        },
                        child: Constant.textWithStyle(
                          text: 'Next',
                          color: Constant.bgGreen,
                          size: 15.sp,
                          maxLine: 5,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                  ],
                ),
                body: SafeArea(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: controller,
                        children: [
                          AddLocation(
                              landMarkController: addPlaceController
                                  .writtenMapController),
                          PlaceAndDesc(
                            placeNameController:
                                addPlaceController.spotNameController,
                            descController:
                                addPlaceController.aboutSpotController,
                          ),
                          EntryDetails(
                              entryTimeController:
                                  addPlaceController.entryTimeController,
                              costController:
                                  addPlaceController.costController,
                              openDayController:
                                  addPlaceController.openDayController),
                          SpotInformation(
                            whatHaveController:
                                addPlaceController.whatHaveController,
                            atrractedController:
                                addPlaceController.currentSituation,
                            bestTimeController:
                                addPlaceController.bestTimeController,
                          ),
                          const TimeInformation(),
                          const AddImages(),
                          const LocationSummary()
                        ],
                      )),
                ),
                bottomNavigationBar: adMobControll.bannerSmallAdInSpot == null
                    ? Container(
                        margin: const EdgeInsets.only(bottom: 0),
                        height: 10.h,
                        width: 100.w,
                      )
                    : Container(
                        margin: const EdgeInsets.only(bottom: 0),
                        height: 10.h,
                        width: 100.w,
                        child: Center(
                            child: AdWidget(
                                ad: adMobControll.bannerSmallAdInSpot!)),
                      ));
          }),
    );
  }
}
