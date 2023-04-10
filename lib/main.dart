import 'dart:io';

import 'package:flipbook/pages/home.dart';
import 'package:flipbook/state_management/flipbook_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

const openAppAndroidId = /*"ca-app-pub-8319377204356997/4548091779";*/
    'ca-app-pub-3940256099942544/3419835294'; //test-id
const openAppIosId = /*"ca-app-pub-8319377204356997/6982683425";*/
    'ca-app-pub-3940256099942544/5662855259'; //test-id
AppOpenAd? appOpenAd;
loadOpenAppId() {
  AppOpenAd.load(
    adUnitId: Platform.isAndroid ? openAppAndroidId : openAppIosId,
    request: AdRequest(),
    adLoadCallback: AppOpenAdLoadCallback(onAdLoaded: (ad) {
      appOpenAd = ad;
      appOpenAd!.show();
    }, onAdFailedToLoad: (error) {
      print("Error: $error");
    }),
    orientation: AppOpenAd.orientationPortrait,
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  // MobileAds.instance.updateRequestConfiguration(RequestConfiguration(
  //     testDeviceIds: ['22017594C9AEF62C9635374144614AF3']));

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  ));
  loadOpenAppId();
  runApp(
    ChangeNotifierProvider<FlipBookProvider>(
      create: (_) => FlipBookProvider(),
      child: const FlipBookApp(),
    ),
  );
}

class FlipBookApp extends StatelessWidget {
  const FlipBookApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
