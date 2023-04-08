import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:document_scanner_flutter/configs/configs.dart';
import 'package:document_scanner_flutter/document_scanner_flutter.dart';
import 'package:flipbook/model/flip_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

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
      body: SingleChildScrollView(
        child: SafeArea(
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
                  ),
                ),
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

  @override
  void dispose() {
    super.dispose();
    flipBookNameController.dispose();
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
    final dir = await getApplicationDocumentsDirectory();
    int index = 1;
    final extension =
        images.first.path.substring(images.first.path.lastIndexOf('.') + 1);
    images.forEach((e) {
      final fileName =
          "${dir.path}/image_${index.toString().padLeft(3, '0')}.$extension";
      e.saveTo(fileName).then((value) => debugPrint("Saved"));
      index++;
      imagesPaths.add(fileName);
    });
    print(imagesPaths);
    // print(images.length);
    // images.forEach((element) {
    //   imagesPaths.add(element.path);
    // });
    if (imagesPaths.isNotEmpty) {
      if (imagesPaths.length >= 6) {
        //TODO
        // show Ad
      }
      // imagesPaths = await saveToGallery(imagesPaths);
      print("new paths: $imagesPaths");
      FlipBook flipBook = FlipBook(
          title: flipBookNameController.text,
          creationDate: DateTime.now().toIso8601String(),
          imageUrls: imagesPaths);
      //TODO push to edit screen
      await Future.delayed(const Duration(milliseconds: 10));
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
    if (mounted) setState(() {});
  }

  void onImagesFromScannerBtnPressed() async {
    try {
      final scannedImg = await DocumentScannerFlutter.launch(
        context,
        source: ScannerFileSource.CAMERA,
      ); // Or ScannerFileSource.GALLERY
      if (scannedImg == null) return;
      imagesPaths.add(scannedImg.path);
      if (imagesPaths.isNotEmpty) {
        if (imagesPaths.length >= 6) {
          //TODO
          // show Ad
        }
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
    imagesPaths.add(image.path);
    if (imagesPaths.isNotEmpty) {
      if (imagesPaths.length >= 6) {
        //TODO
        // show Ad
      }
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
    if (mounted) setState(() {});
    // print(imagesPaths);
  }
}

// TODO u can move count digits
// length is 3 then the counts digit will be two so we will add two digit number left padded with 0

int countDigits(int number) {
  int count = 0;
  while (number != 0) {
    count++;
    number ~/= 10;
  }
  return count + 1;
}
