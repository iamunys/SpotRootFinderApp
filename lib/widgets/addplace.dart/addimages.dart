// ignore: file_names
import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:spotrootpartner/constant/constant.dart';
import 'package:spotrootpartner/controllers/PickMediaController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotrootpartner/controllers/adMobController.dart';

class AddImages extends StatelessWidget {
  const AddImages({
    super.key,
  });

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
            text: 'Add Spot Images',
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
          SizedBox(
            height: 5.h,
            width: 100.w,
            child: GetBuilder<ImagePickerController>(builder: (imgPicker) {
              if (imgPicker.selectedMediaList.length == 2) {
                return ElevatedButton(
                  onPressed: () async {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Constant.bgGreen.withOpacity(.6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Constant.textWithStyle(
                    text: 'Upload Images',
                    color: Constant.bgWhite.withOpacity(.6),
                    fontWeight: FontWeight.normal,
                    size: 14.sp,
                  ),
                );
              } else {
                return ElevatedButton(
                  onPressed: () async {
                    ImagePickerController imgController =
                        Get.put(ImagePickerController());

                    final file = await imgController.pickImage(
                        source: ImageSource.gallery);
                    if (file != null) {
                      final croppedfile = await imgController.crop(
                          aspctRatio: CropAspectRatioPreset.original,
                          cropStyle: CropStyle.rectangle,
                          file: file);
                      imgController.selectedImage = File(croppedfile!.path);
                      imgController.addSelectedMediaList =
                          imgController.selectedImage;
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Constant.bgGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Constant.textWithStyle(
                    text: 'Upload Images',
                    color: Constant.bgWhite,
                    fontWeight: FontWeight.normal,
                    size: 14.sp,
                  ),
                );
              }
            }),
          ),
          SizedBox(
            height: 1.h,
          ),
          Constant.textWithStyle(
            text:
                'Now we have only an option to upload two images. Next version you can upload multiple photo and videos.',
            color: Constant.bgRed.withOpacity(.7),
            size: 14.sp,
            maxLine: 5,
            fontWeight: FontWeight.normal,
          ),
          SizedBox(
            height: 3.h,
          ),
          GetBuilder<ImagePickerController>(builder: (imgPicker) {
            if (imgPicker.selectedMediaList.isEmpty) {
              return const SizedBox();
            } else {
              return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(
                      top: 0, bottom: 30, right: 10, left: 10),
                  //itemCount: imgPicker.selectedMediaList.length,
                  itemCount: imgPicker.selectedMediaList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 1.w,
                      crossAxisSpacing: 1.w,
                      crossAxisCount: 2,
                      mainAxisExtent: 20.h),
                  itemBuilder: (BuildContext context, int index) {
                    return ClipRRect(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Constant.bgGreen,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: FileImage(
                                    imgPicker.selectedMediaList[index]),
                                fit: BoxFit.cover)),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            onPressed: () {
                              imgPicker.remoevSelectedMediaList =
                                  imgPicker.selectedMediaList[index];
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Constant.bgWhite,
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            }
          }),
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
        ],
      ),
    );
  }
}
