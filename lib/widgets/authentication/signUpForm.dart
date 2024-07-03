import 'package:get/get.dart';
import 'package:spotrootpartner/constant/constant.dart';
import 'package:spotrootpartner/controllers/mutationController.dart';
import 'package:spotrootpartner/controllers/userStateController.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotrootpartner/controllers/widgetsController.dart';
import 'package:spotrootpartner/services/ApiProvider/AuthApi.dart';
import 'package:spotrootpartner/widgets/utilis.dart';

class SignUpForm extends StatelessWidget {
  final TextEditingController fullNameController;
  final TextEditingController userNameController;
  final TextEditingController placeNameController;

  final UserStateController userStateController;
  final bool isEdit;

  const SignUpForm(
      {super.key,
      required this.fullNameController,
      required this.userNameController,
      required this.placeNameController,
      required this.userStateController,
      required this.isEdit});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getThefields(
            hintText: 'Instagram Username',
            controller: userNameController,
            isValidate: true),
        SizedBox(
          height: .5.h,
        ),
        GetBuilder<WidgetsController>(
            init: WidgetsController(),
            builder: (controller) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Constant.textWithStyle(
                  text: controller.isUserNameAvailable
                      ? 'username available'
                      : userNameController.text.length > 1
                          ? 'username not available.'
                          : '',
                  color: controller.isUserNameAvailable
                      ? Constant.bgSecondaryGreen.withOpacity(.7)
                      : Constant.bgRed.withOpacity(.6),
                  size: 14.sp,
                  maxLine: 5,
                  fontWeight: FontWeight.normal,
                ),
              );
            }),
        SizedBox(
          height: .5.h,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Constant.textWithStyle(
            text:
                'Provide your instagram username, It may helps to get more reach.',
            color: Constant.textSecondary.withOpacity(.6),
            size: 14.sp,
            maxLine: 5,
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        getThefields(
            hintText: 'Full name',
            controller: fullNameController,
            isValidate: false),
        SizedBox(
          height: 1.h,
        ),
        getThefields(
            hintText: 'Place name',
            controller: placeNameController,
            isValidate: false),
        SizedBox(
          height: 1.h,
        ),
        if (isEdit)
          Constant.textWithStyle(
            text: 'Name or Username should be different from current value.',
            color: Constant.textSecondary,
            size: 14.sp,
            maxLine: 5,
            fontWeight: FontWeight.normal,
          ),
        SizedBox(
          height: 1.h,
        ),
        SizedBox(
          height: 5.h,
          width: 100.w,
          child: GetBuilder<WidgetsController>(
              init: WidgetsController(),
              builder: (controller) {
                return ElevatedButton(
                  onPressed: () async {
                    if (userNameController.text.isNotEmpty &&
                        fullNameController.text.isNotEmpty &&
                        placeNameController.text.isNotEmpty) {
                      if (fullNameController.text.length > 2 &&
                          userNameController.text.length > 2 &&
                          placeNameController.text.isNotEmpty) {
                        if (controller.isUserNameAvailable) {
                          String? phoneNumber =
                              userStateController.currentUser?.phoneNumber;
                          userStateController.isLoading = true;

                          bool isSuccess = await AuthApiProvider.signUpApi(
                              userName: userNameController.text,
                              fullName: fullNameController.text,
                              phoneNumber: phoneNumber!.split('+')[1],
                              placeName: placeNameController.text);
                          if (isSuccess) {
                            await userStateController.currentUser
                                ?.updateDisplayName(
                                    '${fullNameController.text}|${userNameController.text}');
                          } else {
                            Utilis.snackBar(
                                title: 'Sorry!',
                                message:
                                    'Something went wrong please try later.');
                          }

                          userStateController.isLoading = false;
                          userStateController.subscribeToAuthChanges();
                        } else {
                          Utilis.snackBar(
                              title: 'Sorry',
                              message: 'Username is already taken.');
                        }
                      } else {
                        Utilis.snackBar(
                            title: 'Sorry!',
                            message: 'Please enter a valid name and username.');
                      }
                    } else {
                      Utilis.snackBar(
                          title: 'Oops',
                          message: 'Please fill the form to go head.');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Constant.bgGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: userStateController.isLoading
                      ? const MutationLoader()
                      : Constant.textWithStyle(
                          text: 'COUNTINUE',
                          color: Constant.bgWhite,
                          fontWeight: FontWeight.w500,
                          size: 14.sp,
                        ),
                );
              }),
        ),
      ],
    );
  }

  getThefields(
      {required String hintText,
      required TextEditingController controller,
      required bool isValidate}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 6.h,
      width: 100.w,
      decoration: BoxDecoration(
          color: Constant.bgSecondary,
          // border: Border.all(color: Constant.bgGreen, width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        controller: controller,
        cursorColor: Constant.textPrimary,
        maxLines: 1,
        textAlign: TextAlign.left,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            counterText: '',
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: GoogleFonts.unbounded(
                color: Constant.textSecondary.withOpacity(.5),
                fontSize: 15.sp,
                letterSpacing: 2,
                fontWeight: FontWeight.normal)),
        style: GoogleFonts.unbounded(
            color: Constant.textPrimary,
            fontSize: 15.sp,
            letterSpacing: 2,
            fontWeight: FontWeight.w500),
        autovalidateMode: AutovalidateMode.always,
        validator: (input) {
          print('ddddddddddddddd');
          if (isValidate) {
            bool isTrue = input!.length > 2;
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              if (isTrue) {
                Get.find<WidgetsController>().isUserNameAvailable =
                    await AuthApiProvider.checkUserName(
                        userName: userNameController.text);
              } else {
                Get.find<WidgetsController>().isUserNameAvailable = false;
              }
            });
            return null;
          }
          return null;
        },
      ),
    );
  }
}
