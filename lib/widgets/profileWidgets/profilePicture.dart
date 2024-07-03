import 'package:get/get.dart';
import 'package:spotrootpartner/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotrootpartner/controllers/userStateController.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserStateController>(
        init: UserStateController(),
        builder: (userStateController) {
          return Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Constant.bgPrimary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100.w,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Constant.bgPrimary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Center(
                            child: Image.asset(
                              'lib/constant/icons/user.png',
                              scale: 5,
                              fit: BoxFit.fill,
                              color: Constant.textSecondary.withOpacity(.5),
                            ),
                          ),
                          SizedBox(height: 1.h),
                          Constant.textWithStyle(
                              textAlign: TextAlign.center,
                              text:
                                  '${userStateController.currentUser?.displayName?.split('|')[1]}',
                              size: 17.sp,
                              maxLine: 3,
                              fontWeight: FontWeight.w500,
                              color: Constant.textPrimary),
                          Constant.textWithStyle(
                              textAlign: TextAlign.center,
                              text:
                                  '${userStateController.currentUser?.displayName?.split('|')[0]}',
                              size: 15.sp,
                              maxLine: 3,
                              fontWeight: FontWeight.normal,
                              color: Constant.textSecondary),
                          Constant.textWithStyle(
                              textAlign: TextAlign.center,
                              text:
                                  '${userStateController.currentUser?.phoneNumber}',
                              size: 14.sp,
                              maxLine: 3,
                              fontWeight: FontWeight.normal,
                              color: Constant.textSecondary),
                        ],
                      ),
                    )
                  ]));
        });
  }
}
