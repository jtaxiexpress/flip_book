import 'dart:io';
import 'dart:ui' as ui;

import 'package:document_scanner_flutter/configs/configs.dart';
import 'package:document_scanner_flutter/document_scanner_flutter.dart';
import 'package:flipbook/custom_widgets/flipped_container.dart';
import 'package:flipbook/model/flip_book.dart';
import 'package:flipbook/pages/preview_flip_book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class EditFlipBook extends StatefulWidget {
  const EditFlipBook(
      {Key? key, required this.flipBook, this.isFromNewFlipPage = false})
      : super(key: key);
  final FlipBook flipBook;
  final bool isFromNewFlipPage;
  @override
  State<EditFlipBook> createState() => _EditFlipBookState();
}

class _EditFlipBookState extends State<EditFlipBook> {
  double flipSpeed = 25;
  var flipBookNameController = TextEditingController();
  bool hasFlipAnimation = true;
  final ScrollController scrollController = ScrollController();
  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    if (mounted) {
      setState(() {
        flipBookNameController.text = widget.flipBook.title;
        widget.flipBook.flipSpeed = widget.flipBook.flipSpeed == 25
            ? widget.flipBook.flipSpeed
            : flipSpeed;
        hasFlipAnimation = widget.flipBook.hasFlipAnimation;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    flipBookNameController.dispose();
    scrollController.dispose();
    deleteAllFilesFromTempDirectory();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                buildFlipBookEditWorkSpace(size),
                buildSwipePreviewBtnsRow(),
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

  SizedBox buildFlipBookEditWorkSpace(ui.Size size) {
    return SizedBox(
      width: size.width,
      height: size.height * 0.4,
      child: ReorderableListView.builder(
        scrollDirection: Axis.horizontal,
        scrollController: scrollController,
        // TODO make it non scrollable if want
        physics: const NeverScrollableScrollPhysics(),
        header: SizedBox(
            width: MediaQuery.of(context).size.width *
                (widget.flipBook.imageUrls.length == 1
                    ? 0.18
                    : 0.15)), // scrollCon
        footer: SizedBox(
            width: MediaQuery.of(context).size.width *
                (widget.flipBook.imageUrls.length == 1
                    ? 0.18
                    : 0.15)), // scrollCon// troller: scrollController,
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (newIndex > oldIndex) {
              newIndex -= 1;
            }
            final item = widget.flipBook.imageUrls.removeAt(oldIndex);
            widget.flipBook.imageUrls.insert(newIndex, item);
          });
        },

        itemCount: widget.flipBook.imageUrls.length,
        itemBuilder: (context, index) {
          return buildFlipItem(size, index);
        },
      ),
    );
  }

  Widget buildFlipItem(ui.Size size, index) {
    return GestureDetector(
      key: Key("Key $index"),
      onHorizontalDragUpdate: hasFlipAnimation
          ? null
          : (dt) {
              controlScrollOfReOrderableListView(dt.delta.dx < 0);
            },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
        child: SizedBox(
          width: size.width * 0.55,
          height: size.height * 0.4,
          child: hasFlipAnimation
              ? FlipContainer(
                  onSwipe: controlScrollOfReOrderableListView,
                  child: buildFlipCard(index),
                )
              : buildFlipCard(index),
        ),
      ),
    );
  }

  Card buildFlipCard(index) {
    return Card(
      color: Colors.white,
      elevation: 3,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: widget.flipBook.imageUrls[index].contains("/0/")
          ? Image.file(
              File(widget.flipBook.imageUrls[index]),
            )
          //TODO
          // make it network
          : Image.asset(
              widget.flipBook.imageUrls[index],
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
          onPressed: onImagesFromGalleryBtnPressed,
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
          onPressed: onImagesFromScannerBtnPressed,
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
          onPressed: onImagesFromCameraBtnPressed,
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
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: null,
              icon: Icon(
                Icons.swipe_left_outlined,
                color: Colors.grey.shade600,
              ),
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
                            min: 20,
                            max: 50,
                            onChanged: onFlipSpeedChanged,
                          ),
                        )
                      : SizedBox(
                          height: size.height * 0.05,
                          child: Slider(
                            value: flipSpeed,
                            onChanged: onFlipSpeedChanged,
                            label: flipSpeed.toStringAsFixed(2),
                            min: 20,
                            max: 50,
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
        onSubmitted: onFlipBookTitleChanged,
        onChanged: onFlipBookTitleChanged,
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
        widget.flipBook.hasFlipAnimation = hasFlipAnimation;
      });
    }
  }

  void onFlipSpeedChanged(double value) {
    if (mounted) {
      setState(() {
        flipSpeed = value;
        widget.flipBook.flipSpeed = flipSpeed;
      });
    }
  }

  void controlScrollOfReOrderableListView(bool isLeftSwipe) {
    if (isLeftSwipe) {
      //left swipe
      scrollController.animateTo(
          scrollController.offset + MediaQuery.of(context).size.width * 0.67,
          duration: Duration(milliseconds: flipSpeed.toInt()),
          curve: Curves.easeInOut);
    } else {
      scrollController.animateTo(
          scrollController.offset - MediaQuery.of(context).size.width * 0.67,
          duration: Duration(milliseconds: flipSpeed.toInt()),
          curve: Curves.easeInOut);
    }
  }

  Future<void> deleteAllFilesFromTempDirectory() async {
    final directory = await getApplicationDocumentsDirectory();
    final files = await directory.list().toList();

    for (final file in files) {
      if (file is File) {
        await file.delete();
      }
    }
    print('Flushed the temp dir successfully.');
  }

  void onImagesFromGalleryBtnPressed() async {
    final List<XFile> images = await picker.pickMultiImage();
    images.forEach((element) {
      widget.flipBook.imageUrls.add(element.path);
    });
    if (mounted) setState(() {});
  }

  void onImagesFromScannerBtnPressed() async {
    try {
      final scannedImg = await DocumentScannerFlutter.launch(
        context,
        source: ScannerFileSource.CAMERA,
      ); // Or ScannerFileSource.GALLERY
      if (scannedImg == null) return;
      widget.flipBook.imageUrls.add(scannedImg.path);
    } on PlatformException {
      // 'Failed to get document path or operation cancelled!';
      print("Platform exception");
    }
    if (mounted) setState(() {});
  }

  void onImagesFromCameraBtnPressed() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    print(image?.path);
    // final imagePath = '${directory.path}/${images[i].name}';
    if (image == null) return;
    widget.flipBook.imageUrls.add(image.path);

    if (mounted) setState(() {});
    // print(imagesPaths);
  }

  void onFlipBookTitleChanged(String val) {
    if (mounted) {
      setState(() {
        widget.flipBook.title = capitalizeText(val);
      });
    }
  }
}

String capitalizeText(String text) {
  List<String> words = text.split(' ');
  for (int i = 0; i < words.length; i++) {
    if (words[i].isNotEmpty) {
      words[i] = '${words[i][0].toUpperCase()}${words[i].substring(1)}';
    }
  }
  return words.join(' ');
}
