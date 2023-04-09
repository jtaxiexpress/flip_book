import 'package:flipbook/pages/home.dart';
import 'package:flipbook/state_management/flipbook_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // TODO init the ffmpeg
  // FFmpegKitConfig.init();

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
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
