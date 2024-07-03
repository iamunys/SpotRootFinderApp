import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:spotrootpartner/constant/constant.dart';
import 'package:spotrootpartner/services/AdMobService.dart';

class AdMobController extends GetxController {
//Home Screen
  bool _largeNativeLoaderHome = false;
  bool _smallNativeLoaderHome = false;
  NativeAd? _nativeLargeAdInHome;
  NativeAd? _nativeSmallAdInHome;

  NativeAd? get getNativeLargeAdInHome => _nativeLargeAdInHome;
  set nativeLargeAdInHome(NativeAd v) {
    _nativeLargeAdInHome = v;
    update();
  }

  NativeAd? get getNativeSmallAdInHome => _nativeSmallAdInHome;
  set nativeSmallAdInHome(NativeAd v) {
    _nativeSmallAdInHome = v;
    update();
  }

  bool get largeNativeLoaderHome => _largeNativeLoaderHome;
  set largeNativeLoaderHome(bool v) {
    _largeNativeLoaderHome = v;
    update();
  }

  bool get smallNativeLoaderHome => _smallNativeLoaderHome;
  set smallNativeLoaderHome(bool v) {
    _smallNativeLoaderHome = v;
    update();
  }

//Payment Screen
  bool _largeNativeLoaderPayment = false;
  bool _smallNativeLoaderPayment = false;
  NativeAd? _nativeLargeAdInPayment;
  NativeAd? _nativeSmallAdInPayment;
  // BannerAd? _bannerLargeAdPayment;

  // BannerAd? get bannerLargeAdPayment => _bannerLargeAdPayment;

  NativeAd? get getNativeLargeAdInPayment => _nativeLargeAdInPayment;
  set nativeLargeAdInPayment(NativeAd v) {
    _nativeLargeAdInPayment = v;
    update();
  }

  NativeAd? get getNativeSmallAdInPayment => _nativeSmallAdInPayment;
  set nativeSmallAdInPayment(NativeAd v) {
    _nativeSmallAdInPayment = v;
    update();
  }

  bool get largeNativeLoaderPayment => _largeNativeLoaderPayment;
  set largeNativeLoaderPayment(bool v) {
    _largeNativeLoaderPayment = v;
    update();
  }

  bool get smallNativeLoaderPayment => _smallNativeLoaderPayment;
  set smallNativeLoaderPayment(bool v) {
    _smallNativeLoaderPayment = v;
    update();
  }

  ////////////////////////

  BannerAd? _bannerSmallAdInSpot;
  BannerAd? _bannerLargeAdInSpot;

  BannerAd? get bannerSmallAdInSpot => _bannerSmallAdInSpot;
  set setBannerSmallAdInSpot(BannerAd v) {
    _bannerSmallAdInSpot = v;
  }

    BannerAd? get bannerLargeAdInSpot => _bannerLargeAdInSpot;
  set setbannerLargeAdInSpot(BannerAd v) {
    _bannerLargeAdInSpot = v;
  }


  BannerAd createBannerAd({required AdSize size}) {
    return BannerAd(
        size: size,
        adUnitId: AdMobService.bannerAdUnitId!,
        listener: AdMobService.bannerAdListener,
        request: const AdRequest())
      ..load();
  }

  void createInterstitialAd() {
    InterstitialAd.load(
        adUnitId: AdMobService.interstitialAdUnitId!,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            ad.setImmersiveMode(true);
            ad.fullScreenContentCallback = FullScreenContentCallback(
              onAdDismissedFullScreenContent: (ad) {
                ad.dispose();
                //  _createInterstitialAd();
              },
              onAdFailedToShowFullScreenContent: (ad, error) {
                ad.dispose();
                createInterstitialAd();
              },
            );
            ad.show();
          },
          onAdFailedToLoad: (error) {
            debugPrint('Something Went Wrong');
          },
        ));
  }

  void createOpenAppAd() {
    AppOpenAd.load(
        adUnitId: AdMobService.appOpenAdUnitId!,
        request: const AdRequest(),
        adLoadCallback: AppOpenAdLoadCallback(
          onAdLoaded: (ad) {
            ad.setImmersiveMode(true);
            ad.fullScreenContentCallback = FullScreenContentCallback(
              onAdShowedFullScreenContent: (ad) {},
              onAdDismissedFullScreenContent: (ad) {
                ad.dispose();
                //  _createInterstitialAd();
              },
              onAdFailedToShowFullScreenContent: (ad, error) {
                ad.dispose();
                createOpenAppAd();
              },
            );
            ad.show();
          },
          onAdFailedToLoad: (error) {
            debugPrint('Something Went Wrong');
          },
        ));
  }

  NativeAd createNativeAd(
      {required TemplateType templateType, required String adType}) {
    return NativeAd(
      adUnitId: AdMobService.nativeAdUnitId!,
      listener: AdMobService.nativeAdListenerFunc(adType),
      request: const AdRequest(),
      nativeTemplateStyle: NativeTemplateStyle(
          templateType: templateType,
          mainBackgroundColor: Constant.bgSecondary,
          cornerRadius: 50.0,
          callToActionTextStyle: NativeTemplateTextStyle(
              textColor: Constant.bgWhite,
              backgroundColor: Constant.bgBlue,
              style: NativeTemplateFontStyle.bold,
              size: 16.0),
          primaryTextStyle: NativeTemplateTextStyle(
              textColor: Constant.textPrimary,
              backgroundColor: Constant.bgSecondary,
              style: NativeTemplateFontStyle.bold,
              size: 16.0),
          secondaryTextStyle: NativeTemplateTextStyle(
              textColor: Constant.textSecondary,
              backgroundColor: Constant.bgSecondary,
              style: NativeTemplateFontStyle.bold,
              size: 16.0),
          tertiaryTextStyle: NativeTemplateTextStyle(
              textColor: Constant.textSecondary,
              backgroundColor: Constant.bgSecondary,
              style: NativeTemplateFontStyle.italic,
              size: 16.0)),
    )..load();
  }

  // void createNativeSmallAd() {
  //   _nativeSmallAd = NativeAd(
  //     adUnitId: AdMobService.nativeAdUnitId!,
  //     listener: AdMobService.nativeAdListenerFunc(
  //         Get.find<AdMobController>().isSmallNativeAdLoadedInHomeScreen),
  //     request: const AdRequest(),
  //     nativeTemplateStyle: NativeTemplateStyle(
  //         templateType: TemplateType.small,
  //         mainBackgroundColor: Constant.bgSecondary,
  //         cornerRadius: 50.0,
  //         callToActionTextStyle: NativeTemplateTextStyle(
  //             textColor: Constant.bgWhite,
  //             backgroundColor: Constant.bgBlue,
  //             style: NativeTemplateFontStyle.bold,
  //             size: 16.0),
  //         primaryTextStyle: NativeTemplateTextStyle(
  //             textColor: Constant.textPrimary,
  //             backgroundColor: Constant.bgSecondary,
  //             style: NativeTemplateFontStyle.bold,
  //             size: 16.0),
  //         secondaryTextStyle: NativeTemplateTextStyle(
  //             textColor: Constant.textSecondary,
  //             backgroundColor: Constant.bgSecondary,
  //             style: NativeTemplateFontStyle.bold,
  //             size: 16.0),
  //         tertiaryTextStyle: NativeTemplateTextStyle(
  //             textColor: Constant.textSecondary,
  //             backgroundColor: Constant.bgSecondary,
  //             style: NativeTemplateFontStyle.italic,
  //             size: 16.0)),
  //   )..load();
  // }
}
