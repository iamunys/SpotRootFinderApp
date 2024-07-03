// ignore: file_names
import 'package:get/get.dart';
import 'package:spotrootpartner/constant/constant.dart';
import 'package:spotrootpartner/controllers/userStateController.dart';
import 'package:spotrootpartner/widgets/authentication/signUpForm.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    super.key,
  });

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final fullNameController = TextEditingController();
  final userNameController = TextEditingController();
  final placeNameController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    userNameController.dispose();
    placeNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
              backgroundColor: Constant.bgPrimary,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
        ),
        extendBodyBehindAppBar: true,
        body: GetBuilder<UserStateController>(
              init: UserStateController(),
              builder: (userStateController) {
            return SingleChildScrollView(
              child: Container(
                color: Constant.bgPrimary,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Constant.textWithStyle(
                          text: 'You\'re almost there! 👋',
                          color: Constant.textPrimary,
                          size: 20.sp,
                          maxLine: 5,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Constant.textWithStyle(
                          text:
                              'Please provide the details given below to become a partner of Spot Root.',
                          color: Constant.textSecondary,
                          size: 14.sp,
                          maxLine: 5,
                          fontWeight: FontWeight.normal,
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        SignUpForm(
                          fullNameController: fullNameController,
                          userNameController: userNameController,
                          placeNameController: placeNameController,
                          userStateController: userStateController,
                          isEdit: false,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        // TextButton(
                        //   onPressed: () {
                        //     Get.back();
                        //   },
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Constant.textWithStyle(
                        //         text: 'Already have an account? ',
                        //         color: Constant.textSecondary,
                        //         size: 14.sp,
                        //         maxLine: 5,
                        //         fontWeight: FontWeight.normal,
                        //       ),
                        //       Constant.textWithStyle(
                        //         text: 'Login',
                        //         color: Constant.bgBlue,
                        //         size: 15.sp,
                        //         maxLine: 5,
                        //         fontWeight: FontWeight.normal,
                        //       ),
                        //     ],
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
