import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotrootpartner/constant/constant.dart';
import 'package:spotrootpartner/controllers/locationController.dart';
import 'package:spotrootpartner/model/getUserSpot.dart';

class ViewSpotDetails extends StatelessWidget {
  final Spot data;

  const ViewSpotDetails({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Constant.bgPrimary,
        title: Constant.textWithStyle(
            text: 'Spot Details', size: 17.sp, color: Constant.bgGreen),
      ),
      backgroundColor: Constant.bgPrimary,
      body: Container(
        height: 100.h,
        width: 100.w,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        color: Constant.bgPrimary,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 3.h,
              ),
                 if (data.spotImg!.isNotEmpty)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: List.generate(
                    data.spotImg!.length,
                    (index) => ClipRRect(
                      child: Container(
                        margin: const EdgeInsets.only(right: 5),
                        width: 90.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Constant.bgGreen,
                          image: DecorationImage(
                              image: NetworkImage(data.spotImg![index]),
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
                height: 1.h,
              ),
              Constant.textWithStyle(
                  text:
                      'Added on ${DateFormat('dd-MM-yyyy').format(data.addedDate!)}',
                  fontWeight: FontWeight.normal,
                  size: 13.sp,
                  maxLine: 3,
                  color: Constant.textSecondary),
              SizedBox(
                height: 3.h,
              ),
              Constant.textWithStyle(
                text: data.spotName!,
                color: Constant.textPrimary,
                size: 18.sp,
                maxLine: 5,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 1.h,
              ),
              GetBuilder<LocationController>(
                  init: LocationController(),
                  builder: (loc) {
                    loc.getAddressForAddedSpot(
                        lat: double.parse(data.currentLocation!.split(',')[0]),
                        lng: double.parse(data.currentLocation!.split(',')[1]));
                    return Row(
                      children: [
                        Image.asset(
                          'lib/constant/icons/pin.png',
                          color: Constant.bgRed,
                          scale: 25,
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Expanded(
                          child: Constant.textWithStyle(
                              text: loc.addedSpotAdress,
                              maxLine: 5,
                              fontWeight: FontWeight.normal,
                              size: 14.sp,
                              color: Constant.textPrimary),
                        ),
                      ],
                    );
                  }),
              SizedBox(
                height: 3.h,
              ),
              lisTheSelectedWraps(data.spotType),
              SizedBox(
                height: 3.h,
              ),
              if (data.isHaveEntryTime == 'Yes') ...[
                Constant.textWithStyle(
                  text: data.entryTimeDetails!,
                  color: Constant.textPrimary,
                  size: 16.sp,
                  maxLine: 10,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(
                  height: 3.h,
                ),
              ],
              if (data.isOpenAllDay == 'No') ...[
                Constant.textWithStyle(
                  text: '${data.entryOpenDaysDetails!}is close day',
                  color: Constant.bgRed,
                  size: 16.sp,
                  maxLine: 10,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(
                  height: 3.h,
                ),
              ],
              if (data.isHaveAnyCost == 'Yes') ...[
                Constant.textWithStyle(
                  text: data.costDetails!,
                  color: Constant.textPrimary,
                  size: 16.sp,
                  maxLine: 10,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(
                  height: 3.h,
                ),
              ],
              if (data.isFamilyFriendly == 'Yes') ...[
                Constant.textWithStyle(
                  text: 'Family friendly place',
                  color: Constant.textPrimary,
                  size: 16.sp,
                  maxLine: 10,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(
                  height: 3.h,
                ),
              ],
              if (data.isFoodHold == 'Yes') ...[
                Constant.textWithStyle(
                  text:
                      'You may be hold food in hand. This area is may be have lack of food.',
                  color: Constant.textPrimary,
                  size: 16.sp,
                  maxLine: 10,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(
                  height: 3.h,
                ),
              ],
              Constant.textWithStyle(
                text: data.spotDescription!,
                color: Constant.textPrimary,
                size: 16.sp,
                maxLine: 10,
                fontWeight: FontWeight.normal,
              ),
              SizedBox(
                height: 2.h,
              ),
              Constant.textWithStyle(
                text: data.moreAbout!,
                color: Constant.textPrimary,
                size: 16.sp,
                maxLine: 10,
                fontWeight: FontWeight.normal,
              ),
              SizedBox(
                height: 3.h,
              ),
              Constant.textWithStyle(
                text: data.visitAgainDetails!,
                color: Constant.textPrimary,
                size: 16.sp,
                maxLine: 10,
                fontWeight: FontWeight.normal,
              ),
              SizedBox(
                height: 3.h,
              ),
              lisTheSelectedWraps(data.bestTime),
              SizedBox(
                height: 3.h,
              ),
              lisTheSelectedWraps(data.bestMonths),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  lisTheSelectedWraps(List<String>? spotType) {
    return Wrap(
      spacing: 6,
      children: spotType!.isEmpty
          ? [
              Constant.textWithStyle(
                text: 'Is empty',
                color: Constant.bgRed,
                size: 15.sp,
                maxLine: 10,
                fontWeight: FontWeight.normal,
              )
            ]
          : List.generate(spotType.length, (i) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                decoration: BoxDecoration(
                  color: Constant.bgWhite,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Constant.textWithStyle(
                  text: spotType[i],
                  color: Constant.bgGreen,
                  size: 15.sp,
                  maxLine: 5,
                  fontWeight: FontWeight.normal,
                ),
              );
            }),
    );
  }
}
