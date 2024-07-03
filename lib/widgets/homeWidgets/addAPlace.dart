import 'package:spotrootpartner/constant/constant.dart';
import 'package:spotrootpartner/views/addAPlace.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddANewPlace extends StatelessWidget {
  const AddANewPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => const AddAPlaceScreen()),
      child: SizedBox(
        height: 10.h,
        width: 100.w,
        child: Container(
          decoration: BoxDecoration(
            color: Constant.bgGreen,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 12.w,
                  width: 12.w,
                  decoration: const BoxDecoration(
                    color: Constant.bgWhite,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(
                      'lib/constant/icons/addLocation.png',
                      color: Constant.bgGreen,
                    ),
                  ),
                ),
                SizedBox(
                  width: 1.h,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Constant.textWithStyle(
                        text: 'Add a Spot',
                        size: 15.sp,
                        maxLine: 3,
                        fontWeight: FontWeight.normal,
                        color: Constant.bgWhite),
                    Constant.textWithStyle(
                        text: 'Add a new spot you found.',
                        size: 13.sp,
                        fontWeight: FontWeight.normal,
                        maxLine: 3,
                        color: Constant.bgWhite.withOpacity(.7)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
