import 'package:spotrootpartner/constant/constant.dart';
import 'package:spotrootpartner/controllers/userStateController.dart';
import 'package:spotrootpartner/views/AuthScreens/loginScreen.dart';
import 'package:spotrootpartner/views/NavAuthRoot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.find<UserStateController>().signOut(),
      child: Container(     height: 8.h,
        width: 100.w,
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
                    'lib/constant/icons/power.png',
                    color: Constant.bgGreen,
                  ),
                ),
              ),
              SizedBox(
                width: 1.h,
              ),
              Constant.textWithStyle(
                  text: 'Logout',
                  size: 15.sp,
                  maxLine: 3,
                  color: Constant.bgWhite),
            ],
          ),
        ),
      ),
    );
  }
}
