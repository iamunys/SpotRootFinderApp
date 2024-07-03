// ignore: file_names
import 'package:spotrootpartner/constant/constant.dart';
import 'package:spotrootpartner/views/AuthScreens/loginScreen.dart';
import 'package:spotrootpartner/views/AuthScreens/signupScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NavAuthRoot extends StatelessWidget {
  const NavAuthRoot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
              backgroundColor: Constant.bgPrimary,
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
                gradient: SweepGradient(colors: [
              Constant.bgLightOrange,
              Constant.bgLightBgGreen,
              Constant.bgLightOrange,
            ])),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    //lobster
                    Text(
                      'Spot Root',
                      style: GoogleFonts.lobster(
                          color: Constant.bgGreen,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.sp,
                          letterSpacing: 3),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    InkWell(
                      onTap: () => Get.to(() => const LoginScreen()),
                      child: SizedBox(
                        height: 8.h,
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
                                // Container(
                                //   padding: const EdgeInsets.all(10),
                                //   height: 12.w,
                                //   width: 12.w,
                                //   decoration: const BoxDecoration(
                                //     color: Constant.bgWhite,
                                //     shape: BoxShape.circle,
                                //   ),
                                //   child: Center(
                                //     child: Image.asset(
                                //       'lib/constant/icons/click.png',
                                //       color: Constant.bgRed,
                                //     ),
                                //   ),
                                // ),
                                SizedBox(
                                  width: 1.h,
                                ),
                                Constant.textWithStyle(
                                    text: 'Login',
                                    size: 15.sp,
                                    maxLine: 3,
                                    color: Constant.bgWhite),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    InkWell(
                      onTap: () => Get.to(() => SignUpScreen()),
                      child: SizedBox(
                        height: 8.h,
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
                                // Container(
                                //   padding: const EdgeInsets.all(10),
                                //   height: 12.w,
                                //   width: 12.w,
                                //   decoration: const BoxDecoration(
                                //     color: Constant.bgWhite,
                                //     shape: BoxShape.circle,
                                //   ),
                                //   child: Center(
                                //     child: Image.asset(
                                //       'lib/constant/icons/click.png',
                                //       color: Constant.bgRed,
                                //     ),
                                //   ),
                                // ),
                                SizedBox(
                                  width: 1.h,
                                ),
                                Constant.textWithStyle(
                                    text: 'Register',
                                    size: 15.sp,
                                    maxLine: 3,
                                    color: Constant.bgWhite),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
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
