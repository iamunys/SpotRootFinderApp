import 'package:spotrootpartner/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PaymentPassbook extends StatelessWidget {
  const PaymentPassbook({super.key});

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
              text: 'Passbook',
              size: 16.sp,
              maxLine: 3,
              fontWeight: FontWeight.w500,
              color: Constant.textPrimary),
          SizedBox(height: 1.h),
          Column(
            children: List.generate(1, (index) {
              if (index == 0) {
                return Container(
                  height: 10.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Center(
                    child: Constant.textWithStyle(
                        text: 'No Transactions',
                        fontWeight: FontWeight.normal,
                        size: 13.sp,
                        color: Constant.textSecondary.withOpacity(.5)),
                  ),
                );
              } else {
                return Container(
                  height: 8.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        height: 15.w,
                        width: 15.w,
                        decoration: const BoxDecoration(
                          color: Constant.bgWhite,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                            child: Image.asset(
                          'lib/constant/icons/bank.png',
                          color: Constant.bgGreen,
                        )),
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Constant.textWithStyle(
                                text: 'Mohammed Unaise',
                                size: 15.sp,
                                maxLine: 3,
                                fontWeight: FontWeight.w500,
                                color: Constant.textPrimary),
                            Constant.textWithStyle(
                                text: "22/06/2024",
                                size: 13.sp,
                                fontWeight: FontWeight.normal,
                                maxLine: 3,
                                color: Constant.textSecondary),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Constant.textWithStyle(
                              text: index == 2
                                  ? '₹ 500'
                                  : index == 0
                                      ? "₹ 350"
                                      : "₹ 1499",
                              size: 15.sp,
                              maxLine: 3,
                              fontWeight: FontWeight.w600,
                              color: index == 2
                                  ? Constant.bgRed
                                  : Constant.bgGreen),
                          Constant.textWithStyle(
                              fontWeight: FontWeight.normal,
                              text: index == 2 ? "Failed" : "Debited",
                              size: 13.sp,
                              maxLine: 3,
                              color: index == 2
                                  ? Constant.bgRed
                                  : Constant.textPrimary),
                        ],
                      ),
                    ],
                  ),
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
