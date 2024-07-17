import 'package:flipbook/l10n/l10n.dart';
import 'package:flipbook/pages/splash.dart';
import 'package:flipbook/state_management/flipbook_provider.dart';
import 'package:flipbook/utilities/permission_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final flipBookProvider = FlipBookProvider();
  await flipBookProvider.loadApplicationDir();
  // await MobileAds.instance.initialize();

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
  const FlipBookApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      localizationsDelegates: L10n.localizationsDelegates, // 追加
      supportedLocales: L10n.supportedLocales,
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DummyC extends StatelessWidget {
  const DummyC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FloatingActionButton(
          onPressed: () async {
            await PermissionHelper.requestPermission();
          },
          child: const Text('Click'),
        ),
      ),
    );
  }
}
