import 'package:spotrootpartner/constant/constant.dart';
import 'package:spotrootpartner/views/editProfile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SuggestionScreen extends StatelessWidget {
  const SuggestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => const EditProfileScreen()),
      child: Container(
        height: 8.h,
        width: 100.w,
        decoration: BoxDecoration(
          color: Constant.bgWhite,
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
                  color: Constant.bgPrimary,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(
                    'lib/constant/icons/new.png',
                    //     color: Constant.bgBlue,
                  ),
                ),
              ),
              SizedBox(
                width: 1.h,
              ),
              Constant.textWithStyle(
                  text: 'Suggest any feature',
                  size: 15.sp,
                  fontWeight: FontWeight.normal,
                  maxLine: 3,
                  color: Constant.textPrimary),
            ],
          ),
        ),
      ),
    );
  }
}
