import 'package:flip_widget/flip_widget.dart';
import 'package:flipbook/model/flip_book.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PreviewFlipBook extends StatefulWidget {
  const PreviewFlipBook({Key? key, required this.flipBook}) : super(key: key);
  final FlipBook flipBook;
  @override
  State<PreviewFlipBook> createState() => _PreviewFlipBookState();
}

class _PreviewFlipBookState extends State<PreviewFlipBook> {
  double flipSpeed = 0.5;
  int index = 1;
  final flipKey = GlobalKey<FlipWidgetState>();
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
                        child: Image.asset('assets/images/$index.png'),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: IconButton(
                    onPressed: () async {
                      // Timer.periodic(Duration(milliseconds: 2), (timer) {
                      //   if (mounted)
                      //     setState(() {
                      //       index++;
                      //     });
                      //   if (index == 8) {
                      //     timer.cancel();
                      //     flipKey.currentState?.stopFlip();
                      //   } else {
                      //     flipKey.currentState?.startFlip();
                      //   }
                      // });
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
                    padding: const EdgeInsets.all(8.0),
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
                              Slider(
                                value: flipSpeed,
                                onChanged: (value) {
                                  if (mounted)
                                    setState(() {
                                      flipSpeed = value;
                                    });
                                },
                                label: flipSpeed.toStringAsFixed(2),
                                min: -2,
                                max: 2,
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
}
