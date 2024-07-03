import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotrootpartner/constant/constant.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    initConnectivity();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    super.onInit();
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
      _updateConnectionStatus(result);
    } on PlatformException catch (e) {
      e.toString();
      return;
    }
  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      Get.rawSnackbar(
          messageText: Constant.textWithStyle(
              text: 'PLEASE CONNECT TO THE INTERNET',
              size: 14.sp,
              color: Constant.bgWhite),
          isDismissible: false,
          duration: const Duration(days: 1),
          backgroundColor: Constant.bgRed,
          icon: Icon(
            Icons.wifi_off,
            color: Colors.white,
            size: 20.sp,
          ),
          margin: EdgeInsets.zero,
          snackStyle: SnackStyle.GROUNDED);
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }
}
