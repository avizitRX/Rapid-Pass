import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobServices {
  static String? get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-1531376268159748/6440681346';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-1531376268159748/3019137620';
    }
    return null;
  }

  static String? get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-1531376268159748/1240325555';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-1531376268159748/4387580680';
    }
    return null;
  }

  // static String? get nativeAdUnitId {
  //   if (Platform.isAndroid) {
  //     return 'ca-app-pub-3940256099942544/2247696110';
  //   } else if (Platform.isIOS) {
  //     return 'ca-app-pub-3940256099942544/3986624511';
  //   }
  //   return null;
  // }

  static final BannerAdListener bannerListener = BannerAdListener(
    onAdFailedToLoad: (ad, error) {
      ad.dispose();
      debugPrint('Ad failed to load: $error');
    },
    onAdOpened: (ad) => debugPrint('Ad opened!'),
    onAdClosed: (ad) => debugPrint('Ad closed!'),
  );

  // static final NativeAdListener nativeListener = NativeAdListener(
  //   onAdLoaded: (ad) {
  //     debugPrint('$NativeAd loaded.');
  //   },
  //   onAdFailedToLoad: (ad, error) {
  //     debugPrint('$NativeAd failed to load: $error');
  //     ad.dispose();
  //   },
  // );

  // static final NativeTemplateStyle customMediumNativeTemplateStyle =
  //     NativeTemplateStyle(
  //   // Required: Choose a template.
  //   templateType: TemplateType.medium,
  //   // Optional: Customize the ad's style.
  //   mainBackgroundColor: Colors.purple,
  //   cornerRadius: 10.0,
  //   callToActionTextStyle: NativeTemplateTextStyle(
  //       textColor: Colors.cyan,
  //       backgroundColor: Colors.red,
  //       style: NativeTemplateFontStyle.monospace,
  //       size: 16.0),
  //   primaryTextStyle: NativeTemplateTextStyle(
  //       textColor: Colors.red,
  //       backgroundColor: Colors.cyan,
  //       style: NativeTemplateFontStyle.italic,
  //       size: 16.0),
  //   secondaryTextStyle: NativeTemplateTextStyle(
  //       textColor: Colors.green,
  //       backgroundColor: Colors.black,
  //       style: NativeTemplateFontStyle.bold,
  //       size: 16.0),
  //   tertiaryTextStyle: NativeTemplateTextStyle(
  //       textColor: Colors.brown,
  //       backgroundColor: Colors.amber,
  //       style: NativeTemplateFontStyle.normal,
  //       size: 16.0),
  // );
}
