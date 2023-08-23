import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flipbook/pages/edit_flip_book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

import '../model/flip_book.dart';
import '../state_management/flipbook_provider.dart';

class FlipBookCard extends StatelessWidget {
  final FlipBook book;

  final VoidCallback onPressed;
  final VoidCallback onDeleted;

  const FlipBookCard(
      {Key? key,
      required this.book,
      required this.onPressed,
      required this.onDeleted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Image image = Image.file(File(book.imageUrls[0]));
    Completer<ui.Image> completer = Completer<ui.Image>();
    image.image.resolve(const ImageConfiguration()).addListener(
        ImageStreamListener((ImageInfo info, bool synchronousCall) {
      completer.complete(info.image);
    }));
    return GestureDetector(
      onTap: onPressed,
      onLongPress: () async {
        bool? confirmed = await showDeleteConfirmationDialog(context);
        if (confirmed == true) {
          context.read<FlipBookProvider>().deleteFlipBook(book);
          onDeleted();
        } else {
          print('not deleted');
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FutureBuilder<ui.Image>(
              future: completer.future,
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? Card(
                        elevation: 2,
                        shadowColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          height: getHeight(
                              context, snapshot.data!.height.toDouble()),
                          width: getWidth(
                              context, snapshot.data!.width.toDouble()),
                          // 100 + Random().nextDouble() * (300 - 100)),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: FileImage(File(book.imageUrls[0])),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      )
                    : const Center(child: Text('Loading...'));
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.002),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                book.title.isNotEmpty ? book.title : "no title",
                textAlign: TextAlign.end,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                Jiffy.parse(book.creationDate)
                    .format(pattern: "yyyy/MM/dd hh:mm"),
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey.shade500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool?> showDeleteConfirmationDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        if (Theme.of(context).platform == TargetPlatform.iOS) {
          // Show Cupertino-style dialog on iOS devices
          return CupertinoAlertDialog(
            title: Text(
              book.title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            content: const Text('Do you want to delete this Flip Book?'),
            actions: <Widget>[
              CupertinoDialogAction(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              CupertinoDialogAction(
                child:
                    const Text('Delete', style: TextStyle(color: Colors.red)),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        } else {
          // Show Material-style dialog on Android and other platforms
          return AlertDialog(
            title: Text(capitalizeText(book.title)),
            content: const Text('Do you want to delete this Flip book?'),
            actions: <Widget>[
              TextButton(
                child:
                    const Text('Cancel', style: TextStyle(color: Colors.blue)),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              TextButton(
                child:
                    const Text('Delete', style: TextStyle(color: Colors.red)),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        }
      },
    );
  }

  double getHeight(context, double height) {
    double h = height;
    // print(h);
    final size = MediaQuery.of(context).size;
    if (h < size.height * 0.3) return h;
    return size.height * 0.3;
  }

  double getWidth(context, double width) {
    double w = width;
    // print(w);
    final size = MediaQuery.of(context).size;
    if (w < size.width * 0.45) return w;
    return size.width * 0.45;
  }
}
