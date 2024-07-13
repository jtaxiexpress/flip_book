import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:document_scanner_flutter/configs/configs.dart';
import 'package:document_scanner_flutter/document_scanner_flutter.dart';
// import 'package:document_scanner_flutter/configs/configs.dart';
// import 'package:document_scanner_flutter/document_scanner_flutter.dart';
import 'package:flipbook/l10n/l10n.dart';
import 'package:flipbook/main.dart';
import 'package:flipbook/model/flip_book.dart';
import 'package:flipbook/state_management/flipbook_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_document_scanner/flutter_document_scanner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

// import '../utilities/banner_ads.dart';
import 'edit_flip_book.dart';

class NewFlip extends StatefulWidget {
  const NewFlip({Key? key, required this.onFlipCreate}) : super(key: key);

  final VoidCallback onFlipCreate;
  @override
  State<NewFlip> createState() => _NewFlipState();
}

class _NewFlipState extends State<NewFlip> {
  final flipBookNameController = TextEditingController();
  final ImagePicker picker = ImagePicker();
  List<String> imagesPaths = [];
  String? id;
  Directory? flipDirectory;
  final _scannerController = DocumentScannerController();

  BannerAd? bannerAd;
  @override
  void initState() {
    requestPermissions();
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 2)).then((value) async {
      final model = context.read<FlipBookProvider>();
      id = model.generateUniqueId();
      // bannerAd = await model.initBannerAd();
      if (mounted) {
        setState(() {});
      }

      createFlipImagesDirectory(id!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final model = context.read<FlipBookProvider>();

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
                        print("callll bbbbbbbbbbbbbbbbb");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FlipBookApp()),
                        );
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
      bottomNavigationBar: SafeArea(
        child: FutureBuilder<Widget>(
          // Todo: ad banner
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

  @override
  void dispose() {
    super.dispose();
    flipBookNameController.dispose();
    deleteFlipDirectoryIfEmpty();
  }

  Widget buildBookNameField() {
    final l10n = L10n.of(context)!;

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.075,
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

  void requestPermissions() {
    [Permission.storage, Permission.camera].request();
  }

  void onImagesFromGalleryBtnPressed() async {
    try {
      final ImagePicker picker = ImagePicker();

      // Pick multiple images from gallery
      final List<XFile>? images = await picker.pickMultiImage(limit: 20);

      if (images == null || images.isEmpty) {
        print("No images selected");
        return;
      }

      // Save images to flip directory
      int index = 1;
      for (XFile image in images) {
        final extension = image.path.split('.').last;
        final filePath =
            "${flipDirectory!.path}/image_${index.toString().padLeft(3, '0')}.$extension";

        try {
          await image.saveTo(filePath);
          debugPrint("Saved to $filePath");
          imagesPaths.add(filePath);
          index++;
        } catch (saveError) {
          print("Error saving image: $saveError");
        }
      }

      print("Selected image paths: $imagesPaths");

      if (imagesPaths.isNotEmpty) {
        if (imagesPaths.length >= 6) {
          // TODO: Show Ad
        }

        FlipBook flipBook = FlipBook(
          id: id!,
          imagesDirPath: flipDirectory!.path,
          title: flipBookNameController.text,
          creationDate: DateTime.now().toIso8601String(),
          imageUrls: imagesPaths,
        );

        // Navigate to EditFlipBook screen
        await Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => EditFlipBook(
              flipBook: flipBook,
              isFromNewFlipPage: true,
            ),
          ),
        );
      } else {
        print("No images were successfully saved");
      }

      // Notify that a flipbook has been created
      widget.onFlipCreate();
      if (mounted) setState(() {});
    } catch (e) {
      print("Error in image picking process: $e");
    }
  }
  // void onImagesFromGalleryBtnPressed() async {
  //   try {
  //     // Request permissions for camera and storage
  //     bool cameraPermissionGranted =
  //         await Permission.camera.request().isGranted;
  //     bool storagePermissionGranted =
  //         await Permission.storage.request().isGranted;
  //
  //     if (!cameraPermissionGranted || !storagePermissionGranted) {
  //       print("Required permissions are not granted");
  //       return;
  //     }
  //
  //     // Pick multiple images from gallery
  //     final List<XFile> images = await picker.pickMultiImage();
  //     if (images.isEmpty) return;
  //
  //     // Save images to flip directory
  //     int index = 1;
  //     final extension =
  //         images.first.path.substring(images.first.path.lastIndexOf('.') + 1);
  //     for (XFile e in images) {
  //       final filePath =
  //           "${flipDirectory!.path}/image_${index.toString().padLeft(3, '0')}.$extension";
  //       await e.saveTo(filePath);
  //       debugPrint("Saved to $filePath");
  //       index++;
  //       imagesPaths.add(filePath);
  //     }
  //     print(imagesPaths);
  //
  //     // If there are images saved, proceed to create a FlipBook and navigate
  //     if (imagesPaths.isNotEmpty) {
  //       if (imagesPaths.length >= 6) {
  //         // TODO: Show Ad
  //       }
  //       print("new paths: $imagesPaths");
  //
  //       FlipBook flipBook = FlipBook(
  //         id: id!,
  //         imagesDirPath: flipDirectory!.path,
  //         title: flipBookNameController.text,
  //         creationDate: DateTime.now().toIso8601String(),
  //         imageUrls: imagesPaths,
  //       );
  //
  //       // Navigate to EditFlipBook screen
  //       await Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => EditFlipBook(
  //             flipBook: flipBook,
  //             isFromNewFlipPage: true,
  //           ),
  //         ),
  //       );
  //
  //       // context.read<FlipBookProvider>().makeVideoPathNull();
  //     }
  //
  //     // Notify that a flipbook has been created
  //     widget.onFlipCreate();
  //     if (mounted) setState(() {});
  //   } catch (e) {
  //     print("Error picking images: $e");
  //   }
  // }

  void onImagesFromGalleryBtnPresseds() async {
    final List<XFile> images = await picker.pickMultiImage();

    if (images.isEmpty) return;
    int index = 1;
    final extension =
        images.first.path.substring(images.first.path.lastIndexOf('.') + 1);
    images.forEach((e) {
      final filePath =
          "${flipDirectory!.path}/image_${index.toString().padLeft(3, '0')}.$extension";
      e.saveTo(filePath).then((value) => debugPrint("Saved"));
      index++;
      imagesPaths.add(filePath);
    });
    print(imagesPaths);

    if (imagesPaths.isNotEmpty) {
      if (imagesPaths.length >= 6) {
        //TODO
        // show Ad
      }
      print("new paths: $imagesPaths");
      FlipBook flipBook = FlipBook(
          id: id!,
          imagesDirPath: flipDirectory!.path,
          title: flipBookNameController.text,
          creationDate: DateTime.now().toIso8601String(),
          imageUrls: imagesPaths);
      //TODO push to edit screen
      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => EditFlipBook(
            flipBook: flipBook,
            isFromNewFlipPage: true,
          ),
        ),
      );
      // context.read<FlipBookProvider>().makeVideoPathNull();
    }
    widget.onFlipCreate();
    if (mounted) setState(() {});
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

              final saveImageToPath =
                  "${flipDirectory?.path}/image_001${tempFile.path.substring(tempFile.path.lastIndexOf("."))}";

              // Copy the image to the new path
              await tempFile.copy(saveImageToPath);
              print("Image saved to path: $saveImageToPath");

              context
                  .read<FlipBookProvider>()
                  .incrementCameraScannerCameraUploadCount();

              FlipBook flipBook = FlipBook(
                id: id!,
                imagesDirPath: flipDirectory!.path,
                title: flipBookNameController.text,
                creationDate: DateTime.now().toIso8601String(),
                imageUrls: [saveImageToPath],
              );

              // Clean up the temporary file
              await tempFile.delete();
              await tempDir.delete();

              // Navigate to EditFlipBook page
              await Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => EditFlipBook(
                    flipBook: flipBook,
                    isFromNewFlipPage: true,
                  ),
                ),
              );

              // Call the callback function
              widget.onFlipCreate();
              if (mounted) setState(() {});
            },
          ),
        ),
      );
    } catch (e) {
      print("Error scanning document: $e");
    }
  }

  void onImagesFromScannerBtnPressed() async {
    try {
      // todo: document scanner code
      final image = await DocumentScannerFlutter.launch(
        context,
        source: ScannerFileSource.CAMERA,
      ); // Or ScannerFileSource.GALLERY
      if (image == null) return;
      final saveImageToPath =
          "${flipDirectory!.path}/image_001${image.path.substring(image.path.lastIndexOf("."))}";
      await image.copy(saveImageToPath);
      print("Image saved to path: $saveImageToPath");
      context
          .read<FlipBookProvider>()
          .incrementCameraScannerCameraUploadCount();

      FlipBook flipBook = FlipBook(
          id: id!,
          imagesDirPath: flipDirectory!.path,
          title: flipBookNameController.text,
          creationDate: DateTime.now().toIso8601String(),
          imageUrls: [saveImageToPath]);
      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => EditFlipBook(
            flipBook: flipBook,
            isFromNewFlipPage: true,
          ),
        ),
      );
      // context.read<FlipBookProvider>().makeVideoPathNull();
    } on PlatformException {
      // 'Failed to get document path or operation cancelled!';
      print("Platform exception");
    }
    widget.onFlipCreate();
    if (mounted) setState(() {});
  }

  void onImagesFromCameraBtnPressed() async {
    try {
      final XFile? image = await picker.pickImage(source: ImageSource.camera);
      // final XFile? image = (await ImagesPicker.openCamera()) as XFile?;
      if (image == null) return;

      final saveImageToPath =
          "${flipDirectory!.path}/image_001${image.name.substring(image.name.lastIndexOf("."))}";
      await image.saveTo(saveImageToPath);
      print("Image saved to path: $saveImageToPath");
      context
          .read<FlipBookProvider>()
          .incrementCameraScannerCameraUploadCount();

      FlipBook flipBook = FlipBook(
          id: id!,
          imagesDirPath: flipDirectory!.path,
          title: flipBookNameController.text,
          creationDate: DateTime.now().toIso8601String(),
          imageUrls: [saveImageToPath]);

      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => EditFlipBook(
            flipBook: flipBook,
            isFromNewFlipPage: true,
            onCreate: widget.onFlipCreate,
          ),
        ),
      );
      widget.onFlipCreate();

      if (mounted) setState(() {});
    } catch (e) {
      debugPrint('Error at onImagesFromCameraBtnPressed \n$e');
    }
  }

  void onImagesFromCameraBtnPresseds() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    // final XFile? image = (await ImagesPicker.openCamera()) as XFile?;
    if (image == null) return;
    final saveImageToPath =
        "${flipDirectory!.path}/image_001${image.name.substring(image.name.lastIndexOf("."))}";
    await image.saveTo(saveImageToPath);
    print("Image saved to path: $saveImageToPath");
    context.read<FlipBookProvider>().incrementCameraScannerCameraUploadCount();

    FlipBook flipBook = FlipBook(
        id: id!,
        imagesDirPath: flipDirectory!.path,
        title: flipBookNameController.text,
        creationDate: DateTime.now().toIso8601String(),
        imageUrls: [saveImageToPath]);
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => EditFlipBook(
          flipBook: flipBook,
          isFromNewFlipPage: true,
          onCreate: widget.onFlipCreate,
        ),
      ),
    );
    // context.read<FlipBookProvider>().makeVideoPathNull();
    widget.onFlipCreate();

    if (mounted) setState(() {});
  }

  createFlipImagesDirectory(String id) async {
    final appDir = context.read<FlipBookProvider>().applicationDir;
    final myDir = Directory("${appDir!.path}/$id");
    final dir = await myDir.create();
    if (mounted) {
      setState(() {
        flipDirectory = dir;
      });
    }
    print('Directory created: ${dir.path}');
  }

  deleteFlipDirectoryIfEmpty() async {
    final list = flipDirectory?.listSync() ?? [];
    print('List length: ${list.length}');
    if (list.isEmpty) {
      await flipDirectory!.delete(recursive: true);
    }
    if (!(await flipDirectory!.exists())) {
      print('Directory deleted: ${flipDirectory?.path}');
    }
  }
}

// TODO u can move count digits
// length is 3 then the counts digit will be two so we will add two digit number left padded with 0
