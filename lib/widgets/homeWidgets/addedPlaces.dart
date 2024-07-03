import 'package:intl/intl.dart';
import 'package:spotrootpartner/constant/constant.dart';
import 'package:spotrootpartner/controllers/FirebaseStore/spotRepository.dart';
import 'package:spotrootpartner/controllers/apiController.dart';
import 'package:spotrootpartner/controllers/mutationController.dart';
import 'package:spotrootpartner/controllers/userStateController.dart';
import 'package:spotrootpartner/model/getUserSpot.dart';
import 'package:spotrootpartner/views/listAddedPlaces.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotrootpartner/views/viewSpotDetails.dart';

class AddedPlaces extends StatelessWidget {
  const AddedPlaces({super.key});

  @override
  Widget build(BuildContext context) {
    final userStateController = Get.put(UserStateController());
    final apiController = Get.put(ApiController());
    apiController.getSpotMethod(id: userStateController.currentUser!.uid);

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Constant.bgSecondary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: GetBuilder<ApiController>(
          init: ApiController(),
          builder: (api) {
            return FutureBuilder<List<Spot>?>(
              future: api.getSpotList,
              builder: (context, snapshot) {
                final data = snapshot.data;
                if (snapshot.connectionState == ConnectionState.done) {
                  if (data!.isNotEmpty) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Constant.textWithStyle(
                            text: 'Activity',
                            size: 16.sp,
                            maxLine: 3,
                            fontWeight: FontWeight.w500,
                            color: Constant.textPrimary),
                        SizedBox(height: 1.h),
                        buildData(data),
                        SizedBox(height: 1.h),
                        if (data.length > 2)
                          Center(
                            child: SizedBox(
                              height: 5.h,
                              width: 100.w,
                              child: ElevatedButton(
                                onPressed: () async {
                                  Get.to(() => AddedPlaceView(
                                        data: data,
                                      ));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Constant.bgGreen,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Constant.textWithStyle(
                                  text: 'View All',
                                  color: Constant.bgWhite,
                                  fontWeight: FontWeight.normal,
                                  size: 14.sp,
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Constant.textWithStyle(
                            text: 'Activity',
                            size: 16.sp,
                            maxLine: 3,
                            fontWeight: FontWeight.w500,
                            color: Constant.textPrimary),
                        SizedBox(height: 25.h),
                        Center(
                          child: Constant.textWithStyle(
                              text: 'No Spot Added',
                              size: 14.sp,
                              maxLine: 3,
                              fontWeight: FontWeight.normal,
                              color: Constant.textSecondary),
                        ),
                        SizedBox(height: 25.h),
                      ],
                    );
                  }
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Constant.textWithStyle(
                          text: 'Activity',
                          size: 16.sp,
                          maxLine: 3,
                          fontWeight: FontWeight.w500,
                          color: Constant.textPrimary),
                      SizedBox(height: 25.h),
                      const Center(
                        child: MutationLoader(),
                      ),
                      SizedBox(height: 25.h),
                    ],
                  );
                }
              },
            );
          }),
    );
  }

  buildData(List<Spot> data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(
        data.length > 3 ? 3 : data.length,
        (index) => InkWell(
          onTap: () => Get.to(() => ViewSpotDetails(data: data[index])),
          child: Column(
            children: [
              Container(
                height: 12.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  // boxShadow: const [
                  //   BoxShadow(
                  //       blurRadius: 15,
                  //       offset: Offset(0, 10),
                  //       color: Constant.bgSecondary)
                  // ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 25.w,
                      height: 25.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Constant.textPrimary,
                        image: DecorationImage(
                            image: NetworkImage(
                              data[index].spotImg![0],
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 10.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Constant.textWithStyle(
                                text: data[index].spotName!,
                                size: 15.sp,
                                maxLine: 1,
                                color: Constant.textPrimary),
                            Constant.textWithStyle(
                                text: data[index].spotDescription!,
                                size: 13.sp,
                                maxLine: 2,
                                fontWeight: FontWeight.normal,
                                color: Constant.textSecondary),
                            SizedBox(
                              height: 1.h,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 18.sp,
                                  color: Constant.bgOrange,
                                ),
                                Constant.textWithStyle(
                                    text: " 4.5",
                                    size: 13.sp,
                                    fontWeight: FontWeight.normal,
                                    maxLine: 3,
                                    color: Constant.textPrimary),
                                const Spacer(),
                                Constant.textWithStyle(
                                    text: DateFormat('dd-MM-yyyy')
                                        .format(data[index].addedDate!),
                                    fontWeight: FontWeight.normal,
                                    size: 13.sp,
                                    maxLine: 3,
                                    color: Constant.textSecondary),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
