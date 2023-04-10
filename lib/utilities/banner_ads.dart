import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Ads {
  static BannerAd? _banner;
  static const bannerAndroidId = /*"ca-app-pub-8319377204356997/8044731074";*/
      'ca-app-pub-3940256099942544/6300978111'; //test-id
  static const bannerIosId = /*"ca-app-pub-8319377204356997/2106842839";*/
      'ca-app-pub-3940256099942544/2934735716'; //test-id
  static Future<Widget> buildBannerWidget({
    required BuildContext context,
  }) async {
    final mediaQuery = MediaQuery.of(context);
    await _instantiateBanner(
      mediaQuery.orientation,
      mediaQuery.size.width.toInt(),
    );
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 70,
      child: AdWidget(ad: _banner!),
    );
  }

  static String _getBannerAdUnitId() {
    if (Platform.isAndroid) {
      return bannerAndroidId;
    } else {
      return bannerIosId;
    }
  }

  static Future<BannerAd> _instantiateBanner(orientation, width) async {
    _banner = BannerAd(
      adUnitId: _getBannerAdUnitId(),
      //  size: AdSize.banner,
      size: (await AdSize.getAnchoredAdaptiveBannerAdSize(orientation, width))!,
      request: _getBannerAdRequest(),
      listener: _buildListener(),
    );
    await _banner?.load();
    return _banner!;
  }

  static AdRequest _getBannerAdRequest() {
    return AdRequest();
  }

  static BannerAdListener _buildListener() {
    return BannerAdListener(
      onAdOpened: (Ad ad) {
        print('BannerAdListener onAdOpened ${ad.toString()}.');
      },
      onAdClosed: (Ad ad) {
        print('BannerAdListener onAdClosed ${ad.toString()}.');
      },
      onAdImpression: (Ad ad) {
        print('BannerAdListener onAdImpression ${ad.toString()}.');
      },
      onAdWillDismissScreen: (Ad ad) {
        print('BannerAdListener onAdWillDismissScreen ${ad.toString()}.');
      },
      onPaidEvent: (
        Ad ad,
        double valueMicros,
        PrecisionType precision,
        String currencyCode,
      ) {
        print(' BannerAdListener PaidEvent ${ad.toString()}.');
      },
      onAdLoaded: (Ad ad) {
        print('BannerAdListener onAdLoaded ${ad.toString()}.');
      },
      onAdFailedToLoad: (Ad bannerAd, LoadAdError error) {
        bannerAd.dispose();
        print(
            ' BannerAdListener onAdFailedToLoad error is ${error.responseInfo} | ${error.message} | ${error.code} | ${error.domain}');
      },
    );
  }

  static void disposeBanner() {
    _banner?.dispose();
  }
}
