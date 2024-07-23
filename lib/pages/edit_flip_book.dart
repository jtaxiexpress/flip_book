import 'dart:io';
import 'dart:ui' as ui;

// import 'package:document_scanner_flutter/configs/configs.dart';
// import 'package:document_scanner_flutter/document_scanner_flutter.dart';
import 'package:document_scanner_flutter/configs/configs.dart';
import 'package:document_scanner_flutter/document_scanner_flutter.dart';
import 'package:flipbook/custom_widgets/flipped_container.dart';
import 'package:flipbook/l10n/l10n.dart';
import 'package:flipbook/model/flip_book.dart';
import 'package:flipbook/pages/preview_flip_book.dart';
import 'package:flipbook/state_management/flipbook_provider.dart';
// import 'package:flipbook/utilities/banner_ads.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_document_scanner/flutter_document_scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class EditFlipBook extends StatefulWidget {
  const EditFlipBook(
      {Key? key,
      required this.flipBook,
      this.isFromNewFlipPage = false,
      this.onCreate})
      : super(key: key);
  final FlipBook flipBook;
  final VoidCallback? onCreate;
  final bool isFromNewFlipPage;
  @override
  State<EditFlipBook> createState() => _EditFlipBookState();
}

class _EditFlipBookState extends State<EditFlipBook> {
  double flipSpeed = 4;
  var flipBookNameController = TextEditingController();
  bool hasFlipAnimation = true;
  final ScrollController scrollController = ScrollController();
  final ImagePicker picker = ImagePicker();
  bool alreadyInsertedInDb = false;
  List<String> list = [];
  bool isReordering = false;
  final _scannerController = DocumentScannerController();
  BannerAd? bannerAd;

  String? id;
  Directory? flipDirectory;
  List<String> imagesPaths = [];
  VoidCallback? onFlipCreate;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      setState(() {
        flipBookNameController.text = widget.flipBook.title;
        hasFlipAnimation = widget.flipBook.hasFlipAnimation;
        list = List.from(widget.flipBook.imageUrls);
      });
    }
    Future.delayed(const Duration(milliseconds: 2)).then((value) async {
      final model = context.read<FlipBookProvider>();

      bannerAd = await model.initBannerAd();
      if (mounted) {
        setState(() {});
      }
      alreadyInsertedInDb = await model.flipBookExists(widget.flipBook);
      print('Flip book exits: $alreadyInsertedInDb');
      if (!alreadyInsertedInDb) {
        await model.createFlipBook(widget.flipBook);
        setState(() {
          alreadyInsertedInDb = true;
        });
        print('Inserted now.');
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.flipBook.imageUrls.isEmpty) {
      deleteAllFilesFromFlipBookDirectory();
    }
    flipBookNameController.dispose();
    scrollController.dispose();
    if (widget.isFromNewFlipPage) {
      widget.onCreate?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context)!;

    final size = MediaQuery.of(context).size;
    final model = context.read<FlipBookProvider>();
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
      bottomNavigationBar: SafeArea(
        child: FutureBuilder<Widget>(
          // future: Ads.buildBannerWidget(
          //   context: context,
          // ),
          builder: (_, snapshot) {
            if (!snapshot.hasData) return const Text("No Banner yet");

            return SizedBox(
              height: 70,
              width: MediaQuery.of(context).size.width,
              child: snapshot.data,
            );
          },
          future: null,
        ),
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
        physics: isReordering ? null : const NeverScrollableScrollPhysics(),
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
        onReorderStart: (val) {
          isReordering = true;
          setState(() {});
        },
        onReorderEnd: (val) {
          isReordering = false;
          setState(() {});
        },
        onReorder: (oldIndex, newIndex) async {
          if (newIndex > oldIndex) {
            newIndex -= 1;
          }
          String firstFilePath = list[oldIndex]; //002.png
          String secondFilePath = list[newIndex]; //001.png

          // final file = File(firstFileName);
          // final extension = file.path.substring(file.path.lastIndexOf("."));
          // String random =
          //     "${widget.flipBook.imagesDirPath!}/random$extension"; //random.png
          // final file2 = await file.copy(random); //002->random.png
          // await File(secondFileName).rename(firstFileName);
          // await file2
          //     .copy(secondFileName)
          //     .then((value) => debugPrint("renamed second file"));
          // file2.delete();

          print("Before");
          // print(widget.flipBook.imageUrls);
          // widget.flipBook.imageUrls[oldIndex] = secondFilePath;
          // widget.flipBook.imageUrls[newIndex] = firstFilePath;
          print(list);
          swapFileNames(firstFilePath, secondFilePath);
          // // // update in database
          print("After");
          list[newIndex] = firstFilePath;
          list[oldIndex] = secondFilePath;
          // print(widget.flipBook.imageUrls);
          // if (alreadyInsertedInDb) {
          //   context.read<FlipBookProvider>().updateFlipBook(widget.flipBook);
          // }
          setState(() {});
        },

        itemCount: list.length,
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
      child: list[index].contains("/0/")
          ? Image.file(
              File(list[index]),
            )
          //TODO
          // make it network
          : Image.asset(
              list[index],
            ),
    );
  }

  void swapFileNames(String pathA, String pathB) {
    final fileA = File(pathA);
    final fileB = File(pathB);

    if (fileA.existsSync() && fileB.existsSync()) {
      final tempFile = fileA.renameSync('${fileA.path}.temp');
      fileB.renameSync(fileA.path);
      tempFile.renameSync(fileB.path);
      print('swap successful');
    }
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
    final l10n = L10n.of(context)!;

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
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PreviewFlipBook(
                    flipBook: widget.flipBook,
                    flipSpeed: flipSpeed,
                  ),
                ),
              );
              if (mounted) {
                setState(() {});
              }

              // print(context.read<FlipBookProvider>().initialBooks);
            },
            child: Text(
              l10n.preview,
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
    final l10n = L10n.of(context)!;

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
            onPressed: () {
              onDownloadVideo();
              if (mounted) {
                setState(() {});
              }
            },
            child: Text(l10n.download),
          ),
        ),
        IconButton(
          onPressed: () async {
            await onShare();
            setState(() {});
          },
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
    final l10n = L10n.of(context)!;

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
                    child: Text(
                      l10n.flipSpeed,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  Platform.isIOS
                      ? SizedBox(
                          height: size.height * 0.05,
                          child: CupertinoSlider(
                            value: flipSpeed,
                            min: 2,
                            max: 12,
                            // divisions: 24,
                            onChanged: onFlipSpeedChanged,
                          ),
                        )
                      : SizedBox(
                          height: size.height * 0.05,
                          child: Slider(
                            value: flipSpeed,
                            onChanged: onFlipSpeedChanged,
                            // divisions: 24,
                            label: flipSpeed.toInt().toString(),
                            min: 2,
                            max: 12,
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
    final l10n = L10n.of(context)!;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: const Icon(Icons.animation, color: Colors.orange, size: 28),
        title: Text(
          l10n.flipAnimation,
          style: const TextStyle(fontSize: 18),
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
    final l10n = L10n.of(context)!;

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.075,
      child: TextField(
        controller: flipBookNameController,
        onSubmitted: (val) {
          onFlipBookTitleChanged(val);
          context.read<FlipBookProvider>().updateFlipBook(widget.flipBook);
        },
        onChanged: onFlipBookTitleChanged,
        maxLength: 30,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          hintText: l10n.title,
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
      });
    }
  }

  void controlScrollOfReOrderableListView(bool isLeftSwipe) async {
    if (isLeftSwipe) {
      //left swipe
      await Future.delayed(Duration(milliseconds: flipSpeed.toInt()));
      scrollController.animateTo(
          scrollController.offset + MediaQuery.of(context).size.width * 0.67,
          duration: const Duration(milliseconds: 1),
          curve: Curves.fastLinearToSlowEaseIn);
    } else {
      scrollController.animateTo(
          scrollController.offset - MediaQuery.of(context).size.width * 0.67,
          duration: const Duration(milliseconds: 1),
          curve: Curves.linear);
    }
  }

  Future<void> deleteAllFilesFromFlipBookDirectory() async {
    final myDir = Directory(widget.flipBook.imagesDirPath!);
    if (await myDir.exists()) {
      final files = await myDir.list().toList();
      for (final file in files) {
        if (file is File) {
          await file.delete();
        }
      }
    }
    print('Flushed the images(${myDir.path}) dir successfully.');
  }

//   void onImagesFromGalleryBtnPressed() async {
//     try {
// // Request permissions for camera and storage
//       bool cameraPermissionGranted =
//           await Permission.camera.request().isGranted;
//       bool storagePermissionGranted =
//           await Permission.storage.request().isGranted;

//       if (!cameraPermissionGranted || !storagePermissionGranted) {
//         print("Required permissions are not granted");
//         return;
//       }

// // Pick multiple images from gallery
//       final List<XFile> images = await picker.pickMultiImage();
//       if (images.isEmpty) return;

// // Save images to flip directory
//       int index = 1;
//       final extension =
//           images.first.path.substring(images.first.path.lastIndexOf('.') + 1);
//       for (XFile e in images) {
//         final filePath =
//             "${flipDirectory!.path}/image_${index.toString().padLeft(3, '0')}.$extension";
//         await e.saveTo(filePath);
//         debugPrint("Saved to $filePath");
//         index++;
//         imagesPaths.add(filePath);
//       }
//       print(imagesPaths);

// // If there are images saved, proceed to create a FlipBook and navigate
//       if (imagesPaths.isNotEmpty) {
//         if (imagesPaths.length >= 6) {
// // TODO: Show Ad
//         }
//         print("new paths: $imagesPaths");

//         FlipBook flipBook = FlipBook(
//           id: id!,
//           imagesDirPath: flipDirectory!.path,
//           title: flipBookNameController.text,
//           creationDate: DateTime.now().toIso8601String(),
//           imageUrls: imagesPaths,
//         );

// // Navigate to EditFlipBook screen
//         await Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => EditFlipBook(
//               flipBook: flipBook,
//               isFromNewFlipPage: true,
//             ),
//           ),
//         );

// // context.read<FlipBookProvider>().makeVideoPathNull();
//       }

// // Notify that a flipbook has been created
//       widget.onFlipCreate();
//       if (mounted) setState(() {});
//     } catch (e) {
//       print("Error picking images: $e");
//     }
//   }

  // void onImagesFromGalleryBtnPressed() async {
  //   try {
  //     final List<XFile>? pickedImages = await picker.pickMultiImage();
  //     if (pickedImages == null || pickedImages.isEmpty) return;

  //     int startIndex = widget.flipBook.imageUrls.length;

  //     for (int i = 0; i < pickedImages.length; i++) {
  //       XFile image = pickedImages[i];
  //       int index = startIndex + i + 1;
  //       final saveImageToPath = generatePathForNewImage(index, image.name);

  //       await image.saveTo(saveImageToPath);
  //       widget.flipBook.imageUrls.add(saveImageToPath);
  //       print("Image saved to path: $saveImageToPath");

  //       if (!list.contains(saveImageToPath)) {
  //         list.add(saveImageToPath);
  //       }
  //     }

  //     context.read<FlipBookProvider>().updateFlipBook(widget.flipBook);

  //     if (mounted) setState(() {});
  //   } catch (e) {
  //     print("Error in image picking process: $e");
  //   }
  // }

  void onImagesFromGalleryBtnPressed() async {
    try {
      final List<XFile> images = await picker.pickMultiImage();
      int before = widget.flipBook.imageUrls.length;
      images.forEach((image) async {
        widget.flipBook.imageUrls.add(image.path);
      });
      int afterLength = widget.flipBook.imageUrls.length;
      if (afterLength > before) {
        int index = before + 1;
        images.forEach((image) async {
          final saveImageToPath = generatePathForNewImage(index, image.name);
          widget.flipBook.imageUrls[index - 1] = saveImageToPath;
          index++;
          await image.saveTo(saveImageToPath);
          print("Image saved to path: $saveImageToPath");
        });
      }
      if (list.length < widget.flipBook.imageUrls.length) {
        widget.flipBook.imageUrls.forEach((element) {
          if (!list.contains(element)) list.add(element);
        });
      }
      context.read<FlipBookProvider>().updateFlipBook(widget.flipBook);

      if (mounted) setState(() {});
    } catch (e) {
      print("Error in image picking process: $e");
    }
  }

  void onImagesFromScannerBtnPressedd() async {
    try {
      final result = await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DocumentScanner(
            controller: _scannerController,
            generalStyles: const GeneralStyles(
              baseColor: Colors.white,
            ),
            resolutionCamera: ResolutionPreset.high,
            onSave: (Uint8List imageBytes) async {
              // Create a temporary file to store the image
              final tempDir = await Directory.systemTemp.createTemp();
              final tempFile = File('${tempDir.path}/scanned_image.jpg');
              await tempFile.writeAsBytes(imageBytes);

              final saveImageToPath = generatePathForNewImage(
                  widget.flipBook.imageUrls.length + 1, tempFile.path);

              // Copy the image to the new path
              await tempFile.copy(saveImageToPath);
              print("Image saved to path: $saveImageToPath");

              widget.flipBook.imageUrls.add(saveImageToPath);
              context
                  .read<FlipBookProvider>()
                  .incrementCameraScannerCameraUploadCount();

              list.add(saveImageToPath);

              // Clean up the temporary file
              await tempFile.delete();
              await tempDir.delete();

              // Return to the previous screen
              Navigator.of(context).pop();
            },
          ),
        ),
      );

      if (result == true) {
        context.read<FlipBookProvider>().updateFlipBook(widget.flipBook);
        if (mounted) setState(() {});
      }
    } catch (e) {
      print("Error scanning document: $e");
    }
  }

  void onImagesFromScannerBtnPressed() async {
    try {
      // TODO: document scanner code
      final image = await DocumentScannerFlutter.launch(
        context,
        source: ScannerFileSource.CAMERA,
      ); // Or ScannerFileSource.GALLERY
      if (image == null) return;
      final saveImageToPath = generatePathForNewImage(
          widget.flipBook.imageUrls.length + 1, image.path);
      await image.copy(saveImageToPath);
      print("Image saved to path: $saveImageToPath");
      widget.flipBook.imageUrls.add(saveImageToPath);
      context
          .read<FlipBookProvider>()
          .incrementCameraScannerCameraUploadCount();
      list.add(image.path);
    } on PlatformException {
      // 'Failed to get document path or operation cancelled!';
      print("Platform exception");
    }
    context.read<FlipBookProvider>().updateFlipBook(widget.flipBook);
    if (mounted) setState(() {});
  }

  void onImagesFromCameraBtnPressed() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    print(image?.path);
    // final imagePath = '${directory.path}/${images[i].name}';
    if (image == null) return;
    final saveImageToPath = generatePathForNewImage(
        widget.flipBook.imageUrls.length + 1, image.path);
    await image.saveTo(saveImageToPath);
    print("Image saved to path: $saveImageToPath");
    context.read<FlipBookProvider>().incrementCameraScannerCameraUploadCount();
    widget.flipBook.imageUrls.add(saveImageToPath);
    list.add(image.path);
    context.read<FlipBookProvider>().updateFlipBook(widget.flipBook);
    if (mounted) setState(() {});

    // print(imagesPaths);
  }

  generatePathForNewImage(int imageNumber, String imageName) {
    final dir = widget.flipBook.imagesDirPath;
    return "$dir/image_${imageNumber.toString().padLeft(3, "0")}${imageName.substring(imageName.lastIndexOf("."))}";
  }

  void onFlipBookTitleChanged(String val) {
    if (mounted) {
      setState(() {
        widget.flipBook.title = capitalizeText(val);
      });
    }
  }

  Future<bool> onDownloadVideo() async {
    final l10n = L10n.of(context)!;

    await context
        .read<FlipBookProvider>()
        .downloadVideo(widget.flipBook, flipSpeed.toInt());
    final videoPath = context.read<FlipBookProvider>().videoOutputPath;
    if (videoPath != null) {
      Fluttertoast.showToast(
          msg: l10n.successDownload, backgroundColor: Colors.blue);
      if (mounted) {
        setState(() {});
      }
      return true;
    } else {
      print("my download path :- ${videoPath}");
      Fluttertoast.showToast(msg: l10n.error, backgroundColor: Colors.red);
      return false;
    }
  }

  Future<void> onShare() async {
    final videoPath = context.read<FlipBookProvider>().videoOutputPath;
    if (videoPath == null) {
      onDownloadVideo().then((success) {
        if (success) {
          context.read<FlipBookProvider>().startSharing(widget.flipBook);
        }
      });
    } else {
      await context.read<FlipBookProvider>().showInterstitialAd();
      context.read<FlipBookProvider>().startSharing(widget.flipBook);
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
