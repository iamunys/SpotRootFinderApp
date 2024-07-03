import 'package:get/get.dart';
import 'package:spotrootpartner/constant/constant.dart';
import 'package:spotrootpartner/controllers/userStateController.dart';
import 'package:spotrootpartner/widgets/utilis.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PaymentPendingAndPaid extends StatelessWidget {
  const PaymentPendingAndPaid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Constant.bgSecondary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Constant.textWithStyle(
              text: 'Status',
              size: 15.sp,
              maxLine: 3,
              fontWeight: FontWeight.w500,
              color: Constant.textPrimary),
          SizedBox(height: 1.h),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Constant.bgPrimary,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 1.h,
                        ),
                        Constant.textWithStyle(
                            text: 'Total Payouts',
                            size: 13.sp,
                            fontWeight: FontWeight.normal,
                            maxLine: 3,
                            color: Constant.textSecondary),
                        SizedBox(
                          height: .5.h,
                        ),
                        Constant.textWithStyle(
                            fontWeight: FontWeight.w600,
                            text: '₹${5*8}',
                            size: 17.sp,
                            maxLine: 3,
                            color: Constant.textPrimary),
                        SizedBox(
                          height: .5.h,
                        ),
                        Row(
                          children: [
                            Constant.textWithStyle(
                                // text: '+2.6%',
                                text: 'Availbale payouts',
                                size: 13.sp,
                                fontWeight: FontWeight.normal,
                                maxLine: 3,
                                color: Constant.bgSecondaryGreen),
                            // Constant.textWithStyle(
                            //     text: ' vs last payouts',
                            //     size: 13.sp,
                            //     fontWeight: FontWeight.normal,
                            //     maxLine: 3,
                            //     color: Constant.textSecondary),
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 1.h,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Constant.bgPrimary,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 1.h,
                        ),
                        Constant.textWithStyle(
                            text: 'Upcoming Payouts',
                            size: 13.sp,
                            fontWeight: FontWeight.normal,
                            maxLine: 3,
                            color: Constant.textSecondary),
                        SizedBox(
                          height: .5.h,
                        ),
                        Constant.textWithStyle(
                            text: '₹0',
                            size: 17.sp,
                            fontWeight: FontWeight.w600,
                            maxLine: 3,
                            color: Constant.textPrimary),
                        SizedBox(
                          height: .5.h,
                        ),
                        Row(
                          children: [
                            Constant.textWithStyle(
                                // text: '-5.8%',
                                text: 'Pending payouts',
                                size: 13.sp,
                                maxLine: 3,
                                fontWeight: FontWeight.normal,
                                color: Constant.bgRed),
                            // Constant.textWithStyle(
                            //     text: ' vs last payouts',
                            //     size: 13.sp,
                            //     maxLine: 3,
                            //     fontWeight: FontWeight.normal,
                            //     color: Constant.textSecondary),
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Center(
            child: SizedBox(
              height: 5.h,
              width: 100.w,
              child: ElevatedButton(
                onPressed: () async {
                  Utilis.launchWhatsApp(
                      message:
                          'Payout Activated.\n' 
                          'Full Name: ${Get.find<UserStateController>().currentUser!.displayName?.split("|")[0]}.\n'
                          'User Name: ${Get.find<UserStateController>().currentUser!.displayName?.split("|")[1]}.');
                  // Utilis.showAlertDialog(
                  //     context: context,
                  //     title: 'Can\'t Transfer',
                  //     description: 'There is no amount to transfer.');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Constant.bgGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Constant.textWithStyle(
                  text: 'Get Amount',
                  color: Constant.bgWhite,
                  fontWeight: FontWeight.normal,
                  size: 14.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
