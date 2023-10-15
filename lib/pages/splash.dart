import 'dart:async';
import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flipbook/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AppOpenAd? openAd;
  int launchCounter = 0;

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized()
        .addPostFrameCallback((_) => initPlugin());

    launchSum().then((value) => launchCount > 1 ? loadAd() : null);

    Future.delayed(const Duration(milliseconds: 2800)).then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
    });
    super.initState();
  }

  int launchCount = 0;

  Future<int> launchSum() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    launchCount = prefs.getInt('counter') ?? 0;

    setState(() {
      launchCount++;
      prefs.setInt('counter', launchCount);
    });

    return launchCount;
  }

  Future<void> initPlugin() async {
    final status = await AppTrackingTransparency.trackingAuthorizationStatus;
    if (status == TrackingStatus.notDetermined) {
      await Future.delayed(const Duration(milliseconds: 200));
      await AppTrackingTransparency.requestTrackingAuthorization();
    }
  }

  Future<void> loadAd() async {
    String adUnitId = Platform.isAndroid
        ? 'ca-app-pub-8319377204356997/4548091779'
        : 'ca-app-pub-8319377204356997/6982683425';
    await AppOpenAd.load(
        adUnitId: adUnitId,
        request: const AdRequest(),
        adLoadCallback: AppOpenAdLoadCallback(onAdLoaded: ((ad) {
          print('ad is loaded');
          openAd = ad;
          openAd!.show();
        }), onAdFailedToLoad: (error) {
          print('ad failed to load $error');
        }),
        orientation: AppOpenAd.orientationPortrait);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(
          child: Center(
            child: Image.asset(
              'images/icon.png',
              width: 200,
              height: 200,
            ),
          ),
        ),
      ),
    );
  }
}
