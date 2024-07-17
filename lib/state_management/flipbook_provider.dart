import 'dart:io';

import 'package:flipbook/model/flip_book.dart';
import 'package:flipbook/state_management/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../utilities/video_creator.dart';

class FlipBookProvider extends ChangeNotifier {
  Directory? applicationDir;
  final DbHelper _helper = DbHelper.instance;
  List<FlipBook> books = [];
  final _videoCreator = VideoCreator();
  String? videoOutputPath;
  int cameraOrScannerCameraImageUploadCount = 0;

  final interstitialAndroidId = "ca-app-pub-8319377204356997/3419924508";
  //'ca-app-pub-3940256099942544/1033173712'; //test-id
  final interstitialIosId = "ca-app-pub-8319377204356997/3157034777";
  // 'ca-app-pub-3940256099942544/4411468910'; //test-id
  final bannerAndroidId = "ca-app-pub-8319377204356997/8044731074";
  // 'ca-app-pub-3940256099942544/6300978111'; //test-id
  final bannerIosId = "ca-app-pub-8319377204356997/2106842839";
  // 'ca-app-pub-3940256099942544/2934735716'; //test-id

  InterstitialAd? interstitialAd;

  ///creates video and returns video path
  Future<bool> downloadVideo(FlipBook flipBook, int flipSpeed) async {
    //TODO show interstitial ad
    await showInterstitialAd();
    String outputFile = await _getVideoOutputFileName(flipBook.title);
    final success = await _videoCreator.createVideo(flipBook.imageUrls,
        flipBook.imagesDirPath!, outputFile, flipSpeed.toInt());

    if (success) {
      print("my download path :- 0");
      videoOutputPath = outputFile;
      notifyListeners();
    } else {
      print("my download path :- 1");
    }

    return success;
  }

  Future<BannerAd> initBannerAd() async {
    final bannerAd = BannerAd(
      adUnitId: getBannerAdUnitId(),
      request: const AdRequest(),
      size: AdSize.mediumRectangle,
      listener: BannerAdListener(
          onAdLoaded: (ad) {},
          onAdClosed: (ad) {
            ad.dispose();
          },
          onAdFailedToLoad: (ad, error) {
            print('Banner ad error: $error');
          }),
    );
    await bannerAd.load();
    return bannerAd;
  }

  Future _loadInterstitial() async {
    InterstitialAd.load(
        adUnitId: getInterstitialAdUnitId(),
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          // Called when an ad is successfully received.
          onAdLoaded: (ad) {
            debugPrint('$ad loaded.');
            ad.fullScreenContentCallback = FullScreenContentCallback(
              onAdDismissedFullScreenContent: (ad) {
                ad.dispose();
                // interstitialAd = null;
                notifyListeners();
              },
            );
            interstitialAd = ad;
            interstitialAd
                ?.show()
                .then((value) => {interstitialAd = null, notifyListeners()});
            notifyListeners();
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            debugPrint('InterstitialAd failed to load: $error');
          },
        ));
    return;
  }

  String getInterstitialAdUnitId() {
    if (Platform.isAndroid) {
      return interstitialAndroidId;
    } else {
      return interstitialIosId;
    }
  }

  String getBannerAdUnitId() {
    if (Platform.isAndroid) {
      return bannerAndroidId;
    } else {
      return bannerIosId;
    }
  }

  Future showInterstitialAd() async {
    await _loadInterstitial();
  }

  Future<String> _getVideoOutputFileName(String fliTitle) async {
    String title = fliTitle.trim().isNotEmpty
        ? fliTitle
        : DateTime.now().millisecondsSinceEpoch.toString();
    title = title
        .replaceAll(RegExp(r'[^\w\s]+'), '')
        .replaceAll(RegExp(r'\s+'), '');
    //final outputFile = "/storage/emulated/0/DCIM/Camera/$title.mp4";
    String? outputFile = await getDownloadPath();
    if (outputFile != null) {
      outputFile = '$outputFile/$title.mp4';
    }
    print('My output File ${outputFile}');

    return outputFile ?? "";
  }

  Future<String?> getDownloadPath() async {
    Directory? directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = Directory('/storage/emulated/0/DCIM/Camera');
        // Put file in global download folder, if for an unknown reason it didn't exist, we fallback
        // ignore: avoid_slow_async_io
        if (!await directory.exists())
          directory = await getApplicationDocumentsDirectory();
      }
    } catch (err, stack) {
      print("Cannot get download folder path");
    }
    return directory?.path;
  }

  Future<void> loadApplicationDir() async {
    try {
      final directory = await path_provider.getApplicationSupportDirectory();
      applicationDir = directory;
      print('Application directory Path: ${applicationDir!.path}');
    } catch (e) {
      print('Error loading application directory: $e');
      if (e is PlatformException) {
        print('PlatformException details: ${e.message}');
      }
      // Handle the error appropriately, maybe set a default directory or show an error message
    }
    notifyListeners();
  }

  deleteDb() {
    _helper.flushDb();
    notifyListeners();
  }

  Future<void> loadAllBooks() async {
    notifyListeners();
    books = await _helper.getAllFlipBooks();
    // books.forEach((element) {
    //   element.imageUrls.forEach((element) {
    //     final inputString = element;
    //     int secondLastIndex =
    //         inputString.lastIndexOf('/', inputString.lastIndexOf('/') - 1);
    //     String resultString = inputString.substring(secondLastIndex + 1);
    //     print(resultString);
    //   });
    // });
    notifyListeners();
  }

  createFlipBook(FlipBook flipBook) async {
    await _helper.insertFlipBook(flipBook);
    notifyListeners();
  }

  Future<void> startSharing(FlipBook flipBook) async {
    //TODO show interstitial ad
    String caption = flipBook.title.isNotEmpty ? flipBook.title : 'New Video';
    final List<String> tags = ['FlipBookMaker'];
    final String text = '$caption\n${tags.map((t) => '#$t').join(' ')}';

    try {
      final result = await Share.shareXFiles(
        [XFile(videoOutputPath!)],
        text: text,
        subject: caption,
        sharePositionOrigin: const Rect.fromLTWH(0, 0, 10, 10),
      );

      switch (result.status) {
        case ShareResultStatus.success:
          print('Share was successful');
          break;
        case ShareResultStatus.dismissed:
          print('Share was dismissed');
          break;
        case ShareResultStatus.unavailable:
          print('Sharing is unavailable');
          break;
      }
    } catch (e) {
      print('Error sharing: $e');
    }
  }
  // Future<void> startSharing(FlipBook flipBook) async {
  //   //TODO show interstitial ad
  //   String caption = flipBook.title.isNotEmpty ? flipBook.title : 'New Video';
  //   final List<String> tags = ['FlipBookMaker'];
  //   final String text = '$caption\n${tags.map((t) => '#$t').join(' ')}';
  //
  //   return await Share.shareXFiles(
  //     [XFile(videoOutputPath!)],
  //     text: text,
  //     subject: caption,
  //     sharePositionOrigin: const Rect.fromLTWH(0, 0, 10, 10),
  //     // mimeTypes: ['video/mp4'],
  //   );
  // }

  Future<bool> flipBookExists(FlipBook book) async {
    return _helper.recordExists(book);
  }

  updateFlipBook(FlipBook flipBook) async {
    await _helper.updateFlipBook(flipBook);
    notifyListeners();
  }

  deleteFlipBook(FlipBook flipBook) async {
    await _helper.deleteFlipBook(flipBook.id);
    notifyListeners();
  }

  ///generates unique id for a flip book
  ///takes creation time of fli book as a optional parameter
  String generateUniqueId({String? millisSinceEpoch}) {
    millisSinceEpoch ??= DateTime.now().millisecondsSinceEpoch.toString();
    final id = "id_${millisSinceEpoch.hashCode}";
    print("Id generated: $id");
    return id;
  }

  int countDigits(int number) {
    int count = 0;
    while (number != 0) {
      count++;
      number ~/= 10;
    }
    return count + 1;
  }

  void incrementCameraScannerCameraUploadCount() {
    cameraOrScannerCameraImageUploadCount++;
    if (cameraOrScannerCameraImageUploadCount != 0 &&
        cameraOrScannerCameraImageUploadCount % 6 == 0) {
      showInterstitialAd();
    }
    notifyListeners();
  }

  void resetOutputVideoPathAndImageUploadCount() {
    print('reset video path done: $videoOutputPath');
    print(
        'reset camera/scanner camera uplode done: $cameraOrScannerCameraImageUploadCount');
    videoOutputPath = null;
    cameraOrScannerCameraImageUploadCount = 0;
    notifyListeners();
  }

  void showMyToast(String content) {
    Fluttertoast.showToast(msg: content);
  }
}
