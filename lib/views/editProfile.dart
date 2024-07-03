// ignore: file_names
import 'package:spotrootpartner/constant/constant.dart';
import 'package:spotrootpartner/controllers/userStateController.dart';
import 'package:spotrootpartner/widgets/authentication/mobileNumber.dart';
import 'package:spotrootpartner/widgets/authentication/signUpForm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({
    super.key,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final fullNameController = TextEditingController();
  final userNameController = TextEditingController();
  final placeNameController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.bgPrimary,
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Constant.bgPrimary,
        title: Constant.textWithStyle(
            text: 'Edit Profile', size: 17.sp, color: Constant.bgGreen),
      ),
      body: GetBuilder<UserStateController>(
          init: UserStateController(),
          builder: (userStateController) {
            return Container(
              height: 100.h,
              width: 100.w,
              color: Constant.bgPrimary,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 1.h,
                    ),
                    SignUpForm(
                      fullNameController: fullNameController,
                      userNameController: userNameController,
                      placeNameController: placeNameController,
                      userStateController: userStateController,
                      isEdit: true,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
