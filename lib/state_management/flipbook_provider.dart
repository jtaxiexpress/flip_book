import 'dart:io';
import 'dart:ui' show Rect;

import 'package:flipbook/model/flip_book.dart';
import 'package:flipbook/state_management/db_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../utilities/video_creator.dart';

class FlipBookProvider extends ChangeNotifier {
  late Directory applicationDir;
  final DbHelper _helper = DbHelper.instance;
  List<FlipBook> books = [];
  final _videoCreator = VideoCreator();
  String? videoOutputPath;

  ///creates video and returns video path
  Future<bool> createVideo(FlipBook flipBook, int flipSpeed) async {
    final outputFile = _getVideoOutputFileName(flipBook.title);
    final success = await _videoCreator.createVideo(flipBook.imageUrls,
        flipBook.imagesDirPath!, outputFile, 14 - flipSpeed.toInt());
    if (success) {
      videoOutputPath = outputFile;
      notifyListeners();
    }
    return success;
  }

  String _getVideoOutputFileName(String fliTitle) {
    String title = fliTitle.trim().isNotEmpty
        ? fliTitle
        : DateTime.now().millisecondsSinceEpoch.toString();
    title = title
        .replaceAll(RegExp(r'[^\w\s]+'), '')
        .replaceAll(RegExp(r'\s+'), '');
    final outputFile = "/storage/emulated/0/DCIM/Camera/$title.mp4";
    return outputFile;
  }

  Future<void> loadApplicationDir() async {
    applicationDir = await getApplicationDocumentsDirectory();
    print('Application directory Path: ${applicationDir.path}');
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
    String caption = flipBook.title.isNotEmpty ? flipBook.title : 'New Video';
    final List<String> tags = ['FlipBookMaker'];
    final String text = '$caption\n${tags.map((t) => '#$t').join(' ')}';

    return await Share.shareFiles(
      [videoOutputPath!],
      text: text,
      subject: caption,
      sharePositionOrigin: const Rect.fromLTWH(0, 0, 10, 10),
      mimeTypes: ['video/mp4'],
    );
  }

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

  void resetOutputVideoPath() {
    print('reset video path done: $videoOutputPath');
    videoOutputPath = null;
    notifyListeners();
  }
}
