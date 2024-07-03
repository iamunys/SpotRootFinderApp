import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:spotrootpartner/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotrootpartner/model/getUserSpot.dart';
import 'package:spotrootpartner/views/viewSpotDetails.dart';

class AddedPlaceView extends StatelessWidget {
  final List<Spot> data;
  const AddedPlaceView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Constant.bgPrimary,
        title: Constant.textWithStyle(
            text: 'Added Places', size: 17.sp, color: Constant.bgGreen),
      ),
      backgroundColor: Constant.bgPrimary,
      body: Container(
        height: 100.h,
        width: 100.w,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        color: Constant.bgPrimary,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
              data.length,
              (index) => InkWell(
                onTap: () => Get.to(ViewSpotDetails(data: data[index])),
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
                                      maxLine: 3,
                                      color: Constant.textPrimary),
                                  Constant.textWithStyle(
                                      text: data[index].landMark!,
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
                                    text: DateFormat('dd-MM-yyyy').format(data[index].addedDate!),
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
          ),
        ),
      ),
    );
  }
}
