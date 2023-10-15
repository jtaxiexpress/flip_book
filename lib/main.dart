import 'dart:io';

import 'package:flipbook/l10n/l10n.dart';
import 'package:flipbook/pages/home.dart';
import 'package:flipbook/pages/splash.dart';
import 'package:flipbook/state_management/flipbook_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  ));

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
      localizationsDelegates: L10n.localizationsDelegates, // 追加
      supportedLocales: L10n.supportedLocales,
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
