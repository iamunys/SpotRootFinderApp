import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:spotrootpartner/controllers/adMobController.dart';

class AdMobService {
  static String? get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-6549647379310608/4039471600';
    } else if (Platform.isIOS) {
      return '';
    }
    return null;
  }

  static String? get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-6549647379310608/4090995387';
    } else if (Platform.isIOS) {
      return '';
    }
    return null;
  }

  static String? get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-6549647379310608/4039471600';
    } else if (Platform.isIOS) {
      return '';
    }
    return null;
  }

  static String? get appOpenAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-6549647379310608/3703982575';
    } else if (Platform.isIOS) {
      return '';
    }
    return null;
  }

  static String? get nativeAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-6549647379310608/2056892822';
    } else if (Platform.isIOS) {
      return '';
    }
    return null;
  }

  static BannerAdListener bannerAdListener = BannerAdListener(
    onAdLoaded: (ad) => debugPrint('Banner ad loaded.'),
    onAdFailedToLoad: (ad, error) {
      ad.dispose();
      debugPrint('Ad failed to load: $error');
    },
    onAdOpened: (ad) => debugPrint('Ad opened.'),
    onAdClosed: (ad) => debugPrint('Ad closed.'),
  );

  

  static NativeAdListener nativeAdListenerFunc(String v) {
    NativeAdListener nativeAdListener = NativeAdListener(
      onAdLoaded: (ad) {
        debugPrint('Native ad loaded.');
        debugPrint('TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT:$v.');
        switch (v) {
          case "homeLarge":
            Get.find<AdMobController>().largeNativeLoaderHome = true;
            break;
          case "homeSmall":
            Get.find<AdMobController>().smallNativeLoaderHome = true;
            break;
          case "paymentLarge":
            Get.find<AdMobController>().largeNativeLoaderPayment = true;
            break;
          case "paymentSmall":
            Get.find<AdMobController>().smallNativeLoaderPayment = true;
            break;
        }
      },
      onAdFailedToLoad: (ad, error) {
        ad.dispose();
        debugPrint('Ad failed to load: $error');
      },
      onAdOpened: (ad) => debugPrint('Ad opened.'),
      onAdClosed: (ad) => debugPrint('Ad closed.'),
    );
    return nativeAdListener;
  }
}
