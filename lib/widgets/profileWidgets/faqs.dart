import 'package:spotrootpartner/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FAQS extends StatelessWidget {
  const FAQS({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => debugPrint('Hi FAQs Called'),
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
                    'lib/constant/icons/faq.png',
                    color: Constant.bgGreen,
                  ),
                ),
              ),
              SizedBox(
                width: 1.h,
              ),
              Constant.textWithStyle(
                  text: 'FAQs',
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
