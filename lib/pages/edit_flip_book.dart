import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flip_widget/flip_widget.dart';
import 'package:flipbook/model/flip_book.dart';
import 'package:flipbook/pages/preview_flip_book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditFlipBook extends StatefulWidget {
  const EditFlipBook({Key? key, required this.flipBook}) : super(key: key);
  final FlipBook flipBook;
  @override
  State<EditFlipBook> createState() => _EditFlipBookState();
}

class _EditFlipBookState extends State<EditFlipBook> {
  double flipSpeed = 0.5;
  int index = 1;
  final flipKey = GlobalKey<FlipWidgetState>();

  var flipBookNameController = TextEditingController();
  PageController _controller = PageController(initialPage: 0);
  List<String> _images =
      List.generate(8, (index) => "assets/images/${index + 1}.png");

  bool hasFlipAnimation = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Image image = Image.asset(widget.flipBook.imageUrls[0]);
    Completer<ui.Image> completer = Completer<ui.Image>();
    image.image.resolve(const ImageConfiguration()).addListener(
        ImageStreamListener((ImageInfo info, bool synchronousCall) {
      completer.complete(info.image);
    }));
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildHeader(context, size),
                SizedBox(height: size.height * 0.01),
                buildCameraOptionsRow(),
                SizedBox(height: size.height * 0.01),
                SizedBox(
                  width: size.width,
                  height: size.height * 0.4,
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                      autoPlay: false,
                      aspectRatio: 1.0,
                      viewportFraction: 0.63,
                      // enlargeCenterPage: true,
                    ),
                    itemCount: widget.flipBook.imageUrls.length,
                    itemBuilder: (context, index, pageIndex) =>
                        FutureBuilder<ui.Image>(
                      future: completer.future,
                      builder: (context, snapshot) {
                        return snapshot.hasData
                            ? SizedBox(
                                width:
                                    getWidth(snapshot.data!.width.toDouble()),
                                height:
                                    getHeight(snapshot.data!.height.toDouble()),
                                child: Card(
                                  color: Colors.white,
                                  elevation: 3,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero),
                                  child: Image.asset(
                                    widget.flipBook.imageUrls[index],
                                  ),
                                ),
                              )
                            : const Text('Loading...');
                      },
                    ),
                  ),
                ),

                buildSwipePreviewBtnsRow(),
                // SizedBox(height: size.height * 0.01),
                buildDownloadUploadBtnsRow(size, context),
                SizedBox(height: size.height * 0.01),
                buildFlipAnimationTile(),
                buildFlipSpeedTile(size),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.grey.shade300,
        height: size.height * 0.1,
        child: const Center(child: Text('banner Ad')),
      ),
    );
  }

  Row buildCameraOptionsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          heroTag: const ValueKey("images"),
          backgroundColor: Colors.black,
          onPressed: () {},
          mini: true,
          child: const Icon(
            FontAwesomeIcons.images,
            color: Colors.white,
            size: 17,
          ),
        ),
        FloatingActionButton(
          heroTag: const ValueKey("scanner"),
          backgroundColor: Colors.black,
          onPressed: () {},
          mini: true,
          child: const Icon(
            Icons.document_scanner_outlined,
            color: Colors.white,
            size: 18,
          ),
        ),
        FloatingActionButton(
          heroTag: const ValueKey("camera"),
          backgroundColor: Colors.black,
          onPressed: () {},
          mini: true,
          child: const Icon(
            Icons.camera_alt,
            color: Colors.white,
            size: 20,
          ),
        ),
      ],
    );
  }

  Row buildHeader(BuildContext context, ui.Size size) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: Theme.of(context).primaryColor,
                ),
                Text(
                  'Home',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 15),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: size.width * 0.03),
        Expanded(child: buildBookNameField()),
      ],
    );
  }

  Row buildSwipePreviewBtnsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(child: SizedBox()),
        Expanded(
          flex: 2,
          child: IconButton(
            onPressed: null,
            icon: Icon(
              Icons.swipe_outlined,
              color: Colors.grey.shade600,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        PreviewFlipBook(flipBook: widget.flipBook)),
              );
            },
            child: Text(
              'Preview',
              style: TextStyle(
                color: Colors.grey.shade600,
                decoration: TextDecoration.underline,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildDownloadUploadBtnsRow(ui.Size size, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: size.height * 0.045,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            onPressed: () {},
            child: const Text('Download'),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.file_upload_outlined,
            color: Theme.of(context).primaryColor,
            size: 28,
          ),
        ),
      ],
    );
  }

  Card buildFlipSpeedTile(ui.Size size) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.flip, color: Colors.green, size: 28),
            SizedBox(width: size.width * 0.03),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.05),
                    child: const Text(
                      'Flip Speed',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Platform.isIOS
                      ? SizedBox(
                          height: size.height * 0.05,
                          child: CupertinoSlider(
                            value: flipSpeed,
                            min: -2,
                            max: 2,
                            onChanged: onFlipSpeedChanged,
                          ),
                        )
                      : SizedBox(
                          height: size.height * 0.05,
                          child: Slider(
                            value: flipSpeed,
                            onChanged: onFlipSpeedChanged,
                            label: flipSpeed.toStringAsFixed(2),
                            min: -2,
                            max: 2,
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Card buildFlipAnimationTile() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: const Icon(Icons.animation, color: Colors.orange, size: 28),
        title: const Text(
          'Flip Animation',
          style: TextStyle(fontSize: 20),
        ),
        trailing: Platform.isIOS
            ? CupertinoSwitch(
                value: hasFlipAnimation,
                onChanged: onFlipAnimation,
              )
            : Switch(
                value: hasFlipAnimation,
                onChanged: onFlipAnimation,
              ),
      ),
    );
  }

  double getHeight(double height) {
    double h = height;
    final size = MediaQuery.of(context).size;
    return h > size.height * 0.4 ? size.height * 0.4 : h;
  }

  double getWidth(double height) {
    double w = height;
    final size = MediaQuery.of(context).size;
    return w > size.width * 0.55 ? size.width * 0.55 : w;
  }

  Widget buildBookNameField() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.09,
      child: TextField(
        controller: flipBookNameController,
        onSubmitted: (val) {
          if (mounted) {
            setState(() {
              flipBookNameController.text = val;
            });
          }
        },
        maxLength: 30,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          hintText: "Flip Book's Title",
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  void onFlipAnimation(bool value) {
    if (mounted) {
      setState(() {
        hasFlipAnimation = value;
      });
    }
  }

  void onFlipSpeedChanged(double value) {
    if (mounted) {
      setState(() {
        flipSpeed = value;
      });
    }
  }
}

/*
SizedBox(
                  width: size.width,
                  height: size.height * 0.4,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.flipBook.imageUrls.length,
                      itemBuilder: (context, index) => FutureBuilder<ui.Image>(
                          future: completer.future,
                          builder: (context, snapshot) {
                            return snapshot.hasData
                                ? FlipWidget(
                                    leftToRight: true,
                                    key: flipKey,
                                    child: SizedBox(
                                      width: getWidth(
                                          snapshot.data!.width.toDouble()),
                                      height: getHeight(
                                          snapshot.data!.height.toDouble()),
                                      child: Card(
                                        color: Colors.white,
                                        elevation: 3,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.zero),
                                        child: Image.asset(
                                          widget.flipBook.imageUrls[0],
                                        ),
                                      ),
                                    ),
                                  )
                                : const Text('Loading...');
                          })),
                ),
 */
