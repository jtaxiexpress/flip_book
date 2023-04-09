import 'dart:async';
import 'dart:io';

import 'package:flipbook/model/flip_book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../state_management/flipbook_provider.dart';

class PreviewFlipBook extends StatefulWidget {
  const PreviewFlipBook(
      {Key? key, required this.flipBook, required this.flipSpeed})
      : super(key: key);
  final FlipBook flipBook;
  final double flipSpeed;
  @override
  State<PreviewFlipBook> createState() => _PreviewFlipBookState();
}

class _PreviewFlipBookState extends State<PreviewFlipBook> {
  //frame rate of video
  double flipSpeed = 7;
  bool isPlaying = false;
  int index = 0;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2)).then((value) {
      if (mounted) {
        setState(() {
          flipSpeed = widget.flipSpeed;
        });
      }
    });
    Fluttertoast.showToast(
      msg: "Move the slider to change speed.",
      backgroundColor: Colors.blue,
      gravity: ToastGravity.BOTTOM,
    );
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
                  child: SizedBox(
                    width: size.width * 0.8,
                    height: size.height * 0.55,
                    child: Card(
                      color: Colors.white,
                      elevation: 3,
                      child: widget.flipBook.imageUrls[0].contains("/0/")
                          ? Image.file(File(widget.flipBook.imageUrls[index]))
                          : Image.asset(widget.flipBook.imageUrls[index]),
                    ),
                  ),
                ),
                Center(
                  child: IconButton(
                    onPressed: () {
                      if (isPlaying) {
                        pause();
                        timer!.cancel();
                      } else {
                        play();
                      }
                    },
                    icon: Icon(isPlaying
                        ? FontAwesomeIcons.pause
                        : FontAwesomeIcons.play),
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
                        onPressed: () => onDownload(),
                        child: const Text('Download'),
                      ),
                    ),
                    IconButton(
                      onPressed: onShare,
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
                        const Icon(Icons.flip, color: Colors.green, size: 28),
                        SizedBox(width: size.width * 0.03),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Flip Speed',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 20),
                              ),
                              SizedBox(
                                height: size.height * 0.05,
                                child: Platform.isIOS
                                    ? CupertinoSlider(
                                        value: flipSpeed,
                                        min: 2,
                                        max: 12,
                                        // divisions: 24,
                                        onChanged: onSliderChanged,
                                        onChangeStart: onChangeStart,
                                        onChangeEnd: onChangeEnd,
                                      )
                                    : Slider(
                                        value: flipSpeed,
                                        onChanged: onSliderChanged,
                                        // divisions: 24,
                                        label: flipSpeed.toInt().toString(),
                                        min: 2,
                                        max: 12,
                                        onChangeStart: onChangeStart,
                                        onChangeEnd: onChangeEnd,
                                      ),
                              )
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

  void onSliderChanged(double value) {
    if (mounted) {
      setState(() {
        flipSpeed = value;
      });
    }
  }

  void pause() {
    isPlaying = false;
    setState(() {});
  }

  void play() {
    setState(() {
      isPlaying = true;
    });
    // double frames = 1 / flipSpeed;
    // final delay = (double.parse(frames.toStringAsFixed(2)) * 100).toInt();
    // print("delay: $delay");
    timer = Timer.periodic(
        Duration(milliseconds: (13 - flipSpeed.toInt()) * 50), (t) {
      // if (index < 0) index = widget.flipBook.imageUrls.length - 1;
      // if (index >= widget.flipBook.imageUrls.length) index = 0;
      if (index == widget.flipBook.imageUrls.length - 1) {
        // t.cancel();
        // isPlaying = false;
        index = 0;
      } else {
        index = (index + 1) % widget.flipBook.imageUrls.length;
      }
      if (mounted) {
        setState(() {});
      }
    });
  }

  void onChangeStart(double value) {
    setState(() {
      isPlaying = false;
      timer?.cancel();
    });
  }

  void onChangeEnd(double value) {
    setState(() {
      isPlaying = true;
      index = 0;
      play();
    });
  }

  void onShare() {
    final videoPath = context.read<FlipBookProvider>().videoOutputPath;
    if (videoPath == null) {
      onDownload().then((success) {
        if (success) {
          context.read<FlipBookProvider>().startSharing(widget.flipBook);
        }
      });
    } else {
      if (mounted) {
        setState(() {
          isPlaying = false;
        });
      }
    }
  }

  Future<bool> onDownload() async {
    await context
        .read<FlipBookProvider>()
        .createVideo(widget.flipBook, flipSpeed.toInt());
    final videoPath = context.read<FlipBookProvider>().videoOutputPath;
    if (videoPath != null) {
      if (mounted) {
        setState(() {
          isPlaying = false;
        });
      }
      Fluttertoast.showToast(
          msg: "Video created at $videoPath", backgroundColor: Colors.blue);
      if (mounted) {
        setState(() {});
      }
      return true;
    } else {
      Fluttertoast.showToast(
          msg: "Error downloading video!", backgroundColor: Colors.red);
      return false;
    }
  }
}
