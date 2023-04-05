import 'dart:io';

import 'package:flip_widget/flip_widget.dart';
import 'package:flipbook/model/flip_book.dart';
import 'package:flipbook/utilities/video_creator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class PreviewFlipBook extends StatefulWidget {
  const PreviewFlipBook({Key? key, required this.flipBook}) : super(key: key);
  final FlipBook flipBook;
  @override
  State<PreviewFlipBook> createState() => _PreviewFlipBookState();
}

class _PreviewFlipBookState extends State<PreviewFlipBook> {
  double flipSpeed = 25;
  int index = 1;
  final flipKey = GlobalKey<FlipWidgetState>();
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 10)).then((value) {
      if (mounted) {
        setState(() {
          flipSpeed = widget.flipBook.flipSpeed;
        });
      }
    });
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
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          color: Theme.of(context).primaryColor,
                        ),
                        Text(
                          'Edit',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Center(
                  child: FlipWidget(
                    leftToRight: true,
                    key: flipKey,
                    child: SizedBox(
                      width: size.width * 0.8,
                      height: size.height * 0.55,
                      child: Card(
                        color: Colors.white,
                        elevation: 3,
                        child: widget.flipBook.imageUrls[0].contains("/data/")
                            ? Image.file(File(widget.flipBook.imageUrls[0]))
                            : Image.asset(widget.flipBook.imageUrls[0]),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: IconButton(
                    onPressed: () async {
                      final dir = await getApplicationDocumentsDirectory();
                      final vc = VideoCreator(
                          imagePaths: widget.flipBook.imageUrls,
                          outputPath: join(dir.path, "mVideo.mp4"));
                      vc
                          .createVideo()
                          .then((value) => debugPrint("Video created"));
                    },
                    icon: Icon(FontAwesomeIcons.play),
                  ),
                ),
                // SizedBox(height: size.height * 0.01),
                Row(
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
                        child: Text('Download'),
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
                ),
                // SizedBox(height: size.height * 0.01),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.flip, color: Colors.green, size: 28),
                        SizedBox(width: size.width * 0.03),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Flip Speed',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 20),
                              ),
                              Platform.isIOS
                                  ? SizedBox(
                                      height: size.height * 0.05,
                                      child: CupertinoSlider(
                                        value: flipSpeed,
                                        min: 20,
                                        max: 40,
                                        onChanged: onSliderChanged,
                                      ),
                                    )
                                  : SizedBox(
                                      height: size.height * 0.05,
                                      child: Slider(
                                        value: flipSpeed,
                                        onChanged: onSliderChanged,
                                        label: flipSpeed.toStringAsFixed(2),
                                        min: 20,
                                        max: 40,
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ],
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

  void onSliderChanged(value) {
    if (mounted) {
      setState(() {
        flipSpeed = value;
      });
    }
  }
}
