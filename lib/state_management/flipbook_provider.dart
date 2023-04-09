import 'dart:io';

import 'package:flipbook/model/flip_book.dart';
import 'package:flipbook/state_management/db_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class FlipBookProvider extends ChangeNotifier {
  late Directory applicationDir;
  final DbHelper _helper = DbHelper.instance;
  List<FlipBook> books = [];

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
    books.forEach((element) {
      element.imageUrls.forEach((element) {
        final inputString = element;
        int secondLastIndex =
            inputString.lastIndexOf('/', inputString.lastIndexOf('/') - 1);
        String resultString = inputString.substring(secondLastIndex + 1);
        print(resultString);
      });
    });
    // final temp = books.first.imageUrls[0];
    // books.first.imageUrls[0] = books.first.imageUrls[2];
    // books.first.imageUrls[2] = temp;
    // updateFlipBook(books.first);
    notifyListeners();
  }

  createFlipBook(FlipBook flipBook) async {
    await _helper.insertFlipBook(flipBook);
    notifyListeners();
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
}
