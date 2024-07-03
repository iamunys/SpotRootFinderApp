// ignore: file_names
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:spotrootpartner/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotrootpartner/controllers/AddPlace/widgetSettings.dart';
import 'package:spotrootpartner/controllers/FirebaseStore/spotRepository.dart';
import 'package:spotrootpartner/controllers/PickMediaController.dart';
import 'package:spotrootpartner/controllers/AddPlace/addPlaceController.dart';
import 'package:spotrootpartner/controllers/adMobController.dart';
import 'package:spotrootpartner/controllers/locationController.dart';
import 'package:spotrootpartner/controllers/mutationController.dart';
import 'package:spotrootpartner/controllers/userStateController.dart';
import 'package:spotrootpartner/services/ApiProvider/SpotApi.dart';
import 'package:spotrootpartner/widgets/StatusScreen.dart';
import 'package:spotrootpartner/widgets/utilis.dart';
import 'package:uuid/uuid.dart';

class LocationSummary extends StatelessWidget {
  const LocationSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final adMobControll = Get.put(AdMobController());

    adMobControll.setbannerLargeAdInSpot =
        adMobControll.createBannerAd(size: AdSize.largeBanner);
    adMobControll.setbannerLargeAdInSpot =
        adMobControll.createBannerAd(size: AdSize.largeBanner);

    var uuid = Uuid();
    LocationController locationController = Get.put(LocationController());
    ImagePickerController imagePickerController =
        Get.put(ImagePickerController());
    AddSpotRepository userRepository = Get.put(AddSpotRepository());
    UserStateController userState = Get.put(UserStateController());

    return SingleChildScrollView(
      child:
          GetBuilder<WidgetSettingsController>(builder: (settingsController) {
        return GetBuilder<AddPlaceController>(builder: (addPlaceController) {
          //  if (addPlaceController.landMarkController.text.isEmpty) {
          //   addPlaceController.landMarkController.text = 'Is empty';
          // }
          // if (addPlaceController.placeNameController.text.isEmpty) {
          //   addPlaceController.placeNameController.text = 'Is empty';
          // }
          // if (addPlaceController.descController.text.isEmpty) {
          //   addPlaceController.descController.text = 'Is empty';
          // } if (addPlaceController.openDayController.text.isEmpty) {
          //   addPlaceController.openDayController.text = 'Is empty';
          // }
          // if (addPlaceController.entranceTimeController.text.isEmpty) {
          //   addPlaceController.entranceTimeController.text = 'Is empty';
          // }
          // if (addPlaceController.costController.text.isEmpty) {
          //   addPlaceController.costController.text = 'Is empty';
          // }
          // if (addPlaceController.whatHaveController.text.isEmpty) {
          //   addPlaceController.whatHaveController.text = 'Is empty';
          // }
          // if (addPlaceController.atrractedController.text.isEmpty) {
          //   addPlaceController.atrractedController.text = 'Is empty';
          // }
          // if (addPlaceController.bestTimeController.text.isEmpty) {
          //   addPlaceController.bestTimeController.text = 'Is empty';
          // }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Constant.textWithStyle(
                text: 'Summary of the spot',
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
              if (imagePickerController.selectedMediaList.isNotEmpty)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: List.generate(
                    imagePickerController.selectedMediaList.length,
                    (index) => ClipRRect(
                      child: Container(
                        margin: const EdgeInsets.only(right: 5),
                        width: 90.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Constant.bgGreen,
                          image: DecorationImage(
                              image: FileImage(imagePickerController
                                  .selectedMediaList[index]),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  )),
                )
              else
                SizedBox(
                  width: 100.w,
                  height: 15.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'lib/constant/icons/noImage.png',
                        scale: 10,
                      ),
                      Constant.textWithStyle(
                        text: 'No image selected',
                        color: Constant.textSecondary,
                        size: 14.sp,
                        maxLine: 5,
                        fontWeight: FontWeight.normal,
                      ),
                    ],
                  ),
                ),
              SizedBox(
                height: 3.h,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                decoration: BoxDecoration(
                    color: Constant.bgSecondary,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Image.asset(
                      'lib/constant/icons/pin.png',
                      color: Constant.bgRed,
                      scale: 18,
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Expanded(
                      child: locationController.currentAddress != ''
                          ? Constant.textWithStyle(
                              text: locationController.currentAddress,
                              maxLine: 5,
                              fontWeight: FontWeight.normal,
                              size: 14.sp,
                              color: Constant.textPrimary)
                          : Constant.textWithStyle(
                              text: 'Is Empty',
                              maxLine: 5,
                              fontWeight: FontWeight.normal,
                              size: 15.sp,
                              color: Constant.bgRed),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              // ...listTheDetails(
              //     heading: 'Written map to spot :-',
              //     text: addPlaceController.writtenMapController.text),
              SizedBox(
                height: 3.h,
              ),
              ...listTheDetails(
                  heading: 'Name of the spot :-',
                  text: addPlaceController.spotNameController.text),
              SizedBox(
                height: 3.h,
              ),
              ...listTheDetails(
                  heading: 'About the spot :-',
                  text: addPlaceController.aboutSpotController.text),
              SizedBox(
                height: 3.h,
              ),
              ...lisTheSelectedWraps(
                  lisItem: settingsController.selectedPlaceType,
                  heading: 'Type of the spot :-'),
              SizedBox(
                height: 3.h,
              ),
              if (settingsController.entryTimeisYes == 'Yes')
                ...listTheDetails(
                    heading: 'Entrance time :-',
                    text: addPlaceController.entryTimeController.text)
              else ...[
                Constant.textWithStyle(
                  text: 'Entrance time :-',
                  color: Constant.textSecondary,
                  size: 14.sp,
                  maxLine: 5,
                  fontWeight: FontWeight.normal,
                ),
                if (settingsController.entryTimeisYes == 'No')
                  Constant.textWithStyle(
                    text: 'Not have entry time',
                    color: Constant.textPrimary,
                    size: 15.sp,
                    maxLine: 5,
                    fontWeight: FontWeight.normal,
                  )
                else
                  Constant.textWithStyle(
                    text: 'Is empty',
                    color: Constant.bgRed,
                    size: 15.sp,
                    maxLine: 5,
                    fontWeight: FontWeight.normal,
                  )
              ],
              SizedBox(
                height: 3.h,
              ),
              if (settingsController.isOpenAllDay == 'No')
                ...listTheDetails(
                    heading: 'Entrance Day :-',
                    text: addPlaceController.openDayController.text)
              else ...[
                Constant.textWithStyle(
                  text: 'Entrance Day :-',
                  color: Constant.textSecondary,
                  size: 14.sp,
                  maxLine: 5,
                  fontWeight: FontWeight.normal,
                ),
                if (settingsController.isOpenAllDay == 'Yes')
                  Constant.textWithStyle(
                    text: 'Open all day',
                    color: Constant.textPrimary,
                    size: 14.sp,
                    maxLine: 5,
                    fontWeight: FontWeight.normal,
                  )
                else
                  Constant.textWithStyle(
                    text: 'Is empty',
                    color: Constant.bgRed,
                    size: 15.sp,
                    maxLine: 5,
                    fontWeight: FontWeight.normal,
                  )
              ],
              SizedBox(
                height: 3.h,
              ),
              if (settingsController.costisYes == 'Yes')
                ...listTheDetails(
                    heading: 'Cost to visit :-',
                    text: addPlaceController.costController.text)
              else ...[
                Constant.textWithStyle(
                  text: 'Cost to visit :-',
                  color: Constant.textSecondary,
                  size: 14.sp,
                  maxLine: 5,
                  fontWeight: FontWeight.normal,
                ),
                if (settingsController.costisYes == 'No')
                  Constant.textWithStyle(
                    text: 'Not have any cost',
                    color: Constant.textPrimary,
                    size: 14.sp,
                    maxLine: 5,
                    fontWeight: FontWeight.normal,
                  )
                else
                  Constant.textWithStyle(
                    text: 'Is empty',
                    color: Constant.bgRed,
                    size: 15.sp,
                    maxLine: 5,
                    fontWeight: FontWeight.normal,
                  )
              ],
              SizedBox(
                height: 3.h,
              ),
              Constant.textWithStyle(
                text: 'Family friendly :-',
                color: Constant.textSecondary,
                size: 14.sp,
                maxLine: 5,
                fontWeight: FontWeight.normal,
              ),
              Constant.textWithStyle(
                text: settingsController.isFamilyYes == ''
                    ? 'Is empty'
                    : settingsController.isFamilyYes,
                color: settingsController.isFamilyYes == ''
                    ? Constant.bgRed
                    : Constant.textPrimary,
                size: 15.sp,
                maxLine: 5,
                fontWeight: FontWeight.normal,
              ),
              SizedBox(
                height: 3.h,
              ),
              Constant.textWithStyle(
                text: 'Carry food :-',
                color: Constant.textSecondary,
                size: 14.sp,
                maxLine: 5,
                fontWeight: FontWeight.normal,
              ),
              Constant.textWithStyle(
                text: settingsController.holdFood == ''
                    ? 'Is empty'
                    : settingsController.holdFood,
                color: settingsController.holdFood == ''
                    ? Constant.bgRed
                    : Constant.textPrimary,
                size: 15.sp,
                maxLine: 5,
                fontWeight: FontWeight.normal,
              ),
              SizedBox(
                height: 3.h,
              ),
              // ...listTheDetails(
              //     heading: 'What have there :-',
              //     text: addPlaceController.whatHaveController.text),
              SizedBox(
                height: 3.h,
              ),
              ...listTheDetails(
                  heading: 'Will you visit again :-',
                  text: addPlaceController.currentSituation.text),
              SizedBox(
                height: 3.h,
              ),
              ...lisTheSelectedWraps(
                  lisItem: settingsController.selectedMonth,
                  heading: 'Best Month :-'),
              SizedBox(
                height: 3.h,
              ),
              ...lisTheSelectedWraps(
                  lisItem: settingsController.selectedTime,
                  heading: 'Best Time :-'),
              SizedBox(
                height: 3.h,
              ),
              ...listTheDetails(
                  heading: 'More :-',
                  text: addPlaceController.bestTimeController.text),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      if (addPlaceController.checkOne) {
                        addPlaceController.checkOne = false;
                      } else {
                        addPlaceController.checkOne = true;
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          color: addPlaceController.checkOne
                              ? Constant.bgGreen
                              : Colors.transparent,
                          border: Border.all(
                            color: Constant.bgGreen,
                          ),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Icon(
                          Icons.check,
                          color: Constant.bgPrimary,
                          size: 18.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Expanded(
                    child: Constant.textWithStyle(
                      text:
                          'Make Sure You are provided all the details about this spot. it will helps to get more reach.',
                      color: Constant.bgRed,
                      size: 14.sp,
                      maxLine: 5,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () async {
                      if (addPlaceController.checkTwo) {
                        addPlaceController.checkTwo = false;
                      } else {
                        addPlaceController.checkTwo = true;
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          color: addPlaceController.checkTwo
                              ? Constant.bgGreen
                              : Colors.transparent,
                          border: Border.all(
                            color: Constant.bgGreen,
                          ),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Icon(
                          Icons.check,
                          color: Constant.bgPrimary,
                          size: 18.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Expanded(
                    child: Constant.textWithStyle(
                      text: 'Make Sure provided details are correct.',
                      color: Constant.bgRed,
                      size: 14.sp,
                      maxLine: 5,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              if (addPlaceController.checkOne && addPlaceController.checkTwo)
                SizedBox(
                  height: 6.h,
                  width: 100.w,
                  child: ElevatedButton(
                    onPressed: () async {
                      addPlaceController.isUploading = true;
                      String formattedDate = DateTime.now().toString();
                      if (imagePickerController.selectedMediaList.isNotEmpty &&
                          addPlaceController
                              .spotNameController.text.isNotEmpty) {
                        String imageId = uuid.v4();
                        print(imageId);
                        final List<String> success =
                            await userRepository.uploadFiles(
                                images: imagePickerController.selectedMediaList,
                                id: userState.currentUser!.uid,
                                imageId: imageId);

                        if (success.isEmpty) {
                          Utilis.snackBar(
                              title: 'Error in file Uploading',
                              message:
                                  'Please try again later. repeat same please contact us.');
                          addPlaceController.isUploading = false;
                        } else {
                          bool status = await SpotApiProvider.createASpot(
                              id: userState.currentUser!.uid,
                              imageId: imageId,
                              currentLocation:
                                  '${locationController.latLng!.latitude},${locationController.latLng!.longitude}',
                              landMark:
                                  addPlaceController.writtenMapController.text,
                              spotName:
                                  addPlaceController.spotNameController.text,
                              spotDescription:
                                  addPlaceController.aboutSpotController.text,
                              spotType: settingsController.selectedPlaceType,
                              isHaveEntryTime:
                                  settingsController.entryTimeisYes,
                              entryTimeDetails:
                                  addPlaceController.entryTimeController.text,
                              isOpenAllDay: settingsController.isOpenAllDay,
                              entryOpenDaysDetails:
                                  addPlaceController.openDayController.text,
                              isHaveAnyCost: settingsController.costisYes,
                              costDetails:
                                  addPlaceController.costController.text,
                              isFamilyFriendly: settingsController.isFamilyYes,
                              isFoodHold: settingsController.holdFood,
                              whatHave:
                                  addPlaceController.whatHaveController.text,
                              visitAgain: settingsController.willYouVisitAgain,
                              visitAgainDetails:
                                  addPlaceController.currentSituation.text,
                              bestMonths: settingsController.selectedMonth,
                              bestTimes: settingsController.selectedTime,
                              moreAbout:
                                  addPlaceController.bestTimeController.text,
                              addedDate: formattedDate,
                              spoImg: success,
                              adminApproved: false);
                          if (status) {
                            Get.off(() => const StatusScreen());
                          }

                          // final user = PostModel(
                          //     latLng:
                          //         '${locationController.latLng!.latitude},${locationController.latLng!.longitude}',
                          //     placeName:
                          //         addPlaceController.placeNameController.text,
                          //     descName: addPlaceController.descController.text,
                          //     landMark:
                          //         addPlaceController.landMarkController.text,
                          //     entranceTime: addPlaceController
                          //         .entranceTimeController.text,
                          //     visitCost: addPlaceController.costController.text,
                          //     whatHave:
                          //         addPlaceController.whatHaveController.text,
                          //     bestTime:
                          //         addPlaceController.bestTimeController.text,
                          //     spotImage: success,
                          //     addedDate: formattedDate);

                          // await userRepository.createPost(
                          //     postModel: user, id: userState.currentUser!.uid);
                          addPlaceController.isUploading = false;
                        }
                      } else {
                        Utilis.snackBar(
                            title: 'Oops',
                            message:
                                'Please check you are provided all details.');
                      }
                      addPlaceController.isUploading = false;
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Constant.bgGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: addPlaceController.isUploading
                        ? const MutationLoader()
                        : Constant.textWithStyle(
                            text: 'Upload Spot',
                            color: Constant.bgWhite,
                            fontWeight: FontWeight.normal,
                            size: 15.sp,
                          ),
                  ),
                )
              else
                SizedBox(
                  height: 6.h,
                  width: 100.w,
                  child: ElevatedButton(
                    onPressed: () async {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Constant.bgGreen.withOpacity(.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Constant.textWithStyle(
                      text: 'Upload Spot',
                      color: Constant.bgWhite.withOpacity(.5),
                      fontWeight: FontWeight.normal,
                      size: 15.sp,
                    ),
                  ),
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
                          child:
                              AdWidget(ad: adMobControll.bannerLargeAdInSpot!)),
                    ),
              SizedBox(
                height: 10.h,
              ),
            ],
          );
        });
      }),
    );
  }

  listTheDetails({required String text, required String heading}) {
    return [
      Constant.textWithStyle(
        text: heading,
        color: Constant.textSecondary,
        size: 14.sp,
        maxLine: 5,
        fontWeight: FontWeight.normal,
      ),
      if (text.isNotEmpty)
        Constant.textWithStyle(
          text: text,
          color: Constant.textPrimary,
          size: 15.sp,
          maxLine: 5,
          fontWeight: FontWeight.normal,
        )
      else
        Constant.textWithStyle(
          text: 'Is empty',
          color: Constant.bgRed,
          size: 15.sp,
          maxLine: 10,
          fontWeight: FontWeight.normal,
        ),
    ];
  }

  lisTheSelectedWraps({required List lisItem, required String heading}) {
    return [
      Constant.textWithStyle(
        text: heading,
        color: Constant.textSecondary,
        size: 14.sp,
        maxLine: 5,
        fontWeight: FontWeight.normal,
      ),
      SizedBox(
        height: .5.h,
      ),
      Wrap(
        spacing: 6,
        children: lisItem.isEmpty
            ? [
                Constant.textWithStyle(
                  text: 'Is empty',
                  color: Constant.bgRed,
                  size: 15.sp,
                  maxLine: 10,
                  fontWeight: FontWeight.normal,
                )
              ]
            : List.generate(lisItem.length, (i) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Constant.bgGreen,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Constant.textWithStyle(
                    text: lisItem[i],
                    color: Constant.bgWhite,
                    size: 15.sp,
                    maxLine: 5,
                    fontWeight: FontWeight.normal,
                  ),
                );
              }),
      )
    ];
  }
}
