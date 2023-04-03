import 'package:flipbook/model/flip_book.dart';
import 'package:flipbook/pages/preview_flip_book.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FlipBookApp());
}

class FlipBookApp extends StatelessWidget {
  const FlipBookApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PreviewFlipBook(
        flipBook: FlipBook(
            title: "title",
            creationDate: "creationDate",
            imageUrls: ["imageUrls"]),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
