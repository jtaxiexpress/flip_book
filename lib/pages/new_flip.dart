import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewFlip extends StatefulWidget {
  const NewFlip({Key? key}) : super(key: key);

  @override
  State<NewFlip> createState() => _NewFlipState();
}

class _NewFlipState extends State<NewFlip> {
  final fliBookNameController = TextEditingController();

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
                    onTap: () {},
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
                    backgroundColor: Colors.black,
                    onPressed: () {},
                    mini: true,
                    child: Icon(
                      FontAwesomeIcons.images,
                      color: Colors.white,
                      size: 17,
                    ),
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.black,
                    onPressed: () {},
                    mini: true,
                    child: Icon(
                      Icons.document_scanner_outlined,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.black,
                    onPressed: () {},
                    mini: true,
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBookNameField() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.09,
      child: TextField(
        controller: fliBookNameController,
        onSubmitted: (val) {
          if (mounted) {
            setState(() {
              fliBookNameController.text = val;
            });
          }
        },
        maxLength: 30,
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
}
