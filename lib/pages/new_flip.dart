import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:document_scanner_flutter/configs/configs.dart';
import 'package:document_scanner_flutter/document_scanner_flutter.dart';
import 'package:flipbook/model/flip_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import 'edit_flip_book.dart';

class NewFlip extends StatefulWidget {
  const NewFlip({Key? key}) : super(key: key);

  @override
  State<NewFlip> createState() => _NewFlipState();
}

class _NewFlipState extends State<NewFlip> {
  final flipBookNameController = TextEditingController();
  final ImagePicker picker = ImagePicker();
  List<String> imagesPaths = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
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
                                color: Theme.of(context).primaryColor,
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: size.width * 0.03),
                  Expanded(child: buildBookNameField()),
                ],
              ),
              SizedBox(height: size.height * 0.01),
              Row(
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
              ),
              SizedBox(height: size.height * 0.02),
              SizedBox(
                  height: size.height * 0.6,
                  width: size.width,
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                      autoPlay: false,
                      aspectRatio: 1.0,
                      viewportFraction: 0.63,
                      enableInfiniteScroll: false,
                    ),
                    itemCount: imagesPaths.length,
                    itemBuilder: (context, index, pageIndex) => SizedBox(
                      width: size.width * 0.55,
                      height: size.height * 0.4,
                      child: Card(
                        color: Colors.white,
                        elevation: 3,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero),
                        child: Image.file(File(imagesPaths[index])),
                      ),
                    ),
                  )),
            ],
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

  void onImagesFromGalleryBtnPressed() async {
    final List<XFile> images = await picker.pickMultiImage();
    print(images.length);
    images.forEach((element) {
      imagesPaths.add(element.path);
    });
    if (mounted) setState(() {});
    if (imagesPaths.isNotEmpty) {
      if (imagesPaths.length >= 6) {
        //TODO
        // show Ad
        FlipBook flipBook = FlipBook(
            title: flipBookNameController.text,
            creationDate: DateTime.now().toIso8601String(),
            imageUrls: images.map((e) => e.path).toList());
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => EditFlipBook(
              flipBook: flipBook,
              isFromNewFlipPage: true,
            ),
          ),
        );
      }
    }
    // print(imagesPaths);
  }

  @override
  void dispose() {
    super.dispose();
    flipBookNameController.dispose();
  }

  void onImagesFromScannerBtnPressed() async {
    try {
      final scannedImg = await DocumentScannerFlutter.launch(
        context,
        source: ScannerFileSource.CAMERA,
      ); // Or ScannerFileSource.GALLERY
      if (scannedImg != null) {
        imagesPaths.add(scannedImg.path);
      }
      if (imagesPaths.isNotEmpty) {
        if (imagesPaths.length >= 6) {
          //TODO
          // show Ad
          FlipBook flipBook = FlipBook(
              title: flipBookNameController.text,
              creationDate: DateTime.now().toIso8601String(),
              imageUrls: imagesPaths);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => EditFlipBook(
                flipBook: flipBook,
                isFromNewFlipPage: true,
              ),
            ),
          );
        }
      }
      if (mounted) setState(() {});
    } on PlatformException {
      // 'Failed to get document path or operation cancelled!';
    }
  }

  void onImagesFromCameraBtnPressed() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    print(image?.path);
    // final imagePath = '${directory.path}/${images[i].name}';
    if (image != null) {
      imagesPaths.add(image.path);
    }
    if (imagesPaths.isNotEmpty) {
      if (imagesPaths.length >= 6) {
        //TODO
        // show Ad
        FlipBook flipBook = FlipBook(
            title: flipBookNameController.text,
            creationDate: DateTime.now().toIso8601String(),
            imageUrls: imagesPaths);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => EditFlipBook(
              flipBook: flipBook,
              isFromNewFlipPage: true,
            ),
          ),
        );
      }
    }
    if (mounted) setState(() {});
    // print(imagesPaths);
  }
}

/*
CarouselSlider.builder(
                    options: CarouselOptions(
                      autoPlay: false,
                      aspectRatio: 1.0,
                      viewportFraction: 0.63,
                    ),
                    itemCount: imagesPaths.length,
                    itemBuilder: (context, index, pageIndex) => SizedBox(
                      width: size.width * 0.55,
                      height: size.height * 0.4,
                      child: Card(
                        color: Colors.white,
                        elevation: 3,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero),
                        child: Image.file(File(imagesPaths[index])),
                      ),
                    ),
                  )
 */
