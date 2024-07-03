// ignore: file_names
import 'package:spotrootpartner/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotrootpartner/widgets/utilis.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //final Uri whatsApp = Uri.parse('https://wa.me/918590120729');
    final Uri instagram = Uri.parse(
        'https://www.instagram.com/spot.root?igsh=MW1oc24xZGo0NjM0aA%3D%3D&utm_source=qr');

    return Scaffold(
      backgroundColor: Constant.bgPrimary,
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Constant.bgPrimary,
        title: Constant.textWithStyle(
            text: 'Help Center', size: 17.sp, color: Constant.bgGreen),
      ),
      body: Container(
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
              // InkWell(
              //   onTap: () => canLaunchUrl(call),
              //   child: Container(
              //     height: 8.h,
              //     width: 100.w,
              //     decoration: BoxDecoration(
              //       color: const Color.fromARGB(255, 32, 31, 31),
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     child: Padding(
              //       padding: const EdgeInsets.all(10.0),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         children: [
              //           Container(
              //             padding: const EdgeInsets.all(10),
              //             height: 12.w,
              //             width: 12.w,
              //             decoration: const BoxDecoration(
              //               color: Constant.bgPrimary,
              //               shape: BoxShape.circle,
              //             ),
              //             child: Center(
              //               child: Image.asset(
              //                 'lib/constant/icons/call.png',
              //                 color: Constant.bgBlue,
              //               ),
              //             ),
              //           ),
              //           SizedBox(
              //             width: 1.h,
              //           ),
              //           Constant.textWithStyle(
              //               text: 'Call',
              //               size: 15.sp,
              //               fontWeight: FontWeight.normal,
              //               maxLine: 3,
              //               color: Constant.textPrimary),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              InkWell(
                onTap: () => launchUrl(instagram),
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
                              'lib/constant/icons/instagram.png',
                              //     color: Constant.bgBlue,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 1.h,
                        ),
                        Constant.textWithStyle(
                            text: 'Instagram',
                            size: 15.sp,
                            fontWeight: FontWeight.normal,
                            maxLine: 3,
                            color: Constant.textPrimary),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),

              Constant.textWithStyle(
                  text:
                      'Follow spotroot official instagram account to get latest updates and features.',
                  size: 14.sp,
                  fontWeight: FontWeight.normal,
                  maxLine: 5,
                  color: Constant.textSecondary),
              SizedBox(
                height: 1.h,
              ),
              InkWell(
                onTap: () => Utilis.launchWhatsApp(message: 'Its the message from help center.'),
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
                              'lib/constant/icons/whatsapp.png',
                              //     color: Constant.bgBlue,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 1.h,
                        ),
                        Constant.textWithStyle(
                            text: 'Whats App',
                            size: 15.sp,
                            fontWeight: FontWeight.normal,
                            maxLine: 3,
                            color: Constant.textPrimary),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Constant.textWithStyle(
                  text:
                      'Contact us on whatsapp for any type of queries.Your privacy is important to us, We Won\'t share your personal number or information to others.',
                  size: 14.sp,
                  fontWeight: FontWeight.normal,
                  maxLine: 5,
                  color: Constant.textSecondary),
              SizedBox(
                height: 1.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
