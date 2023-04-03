import 'dart:math';

import 'package:flipbook/model/flip_book.dart';
import 'package:flipbook/pages/new_flip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jiffy/jiffy.dart';

import '../custom_widgets/book_card.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final searchController = TextEditingController();
  static final List<FlipBook> initialBooks = List.generate(
      10,
      (index) => FlipBook(
            title: generateRandomWord(),
            creationDate: Jiffy.parseFromDateTime(DateTime.now())
                .format(pattern: "yyyy/MM/dd hh:mm"),
            imageUrls: List.generate(8, (i) => "assets/images/${i + 1}.png"),
          ));
  List<FlipBook> books = initialBooks;
  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      filterBooks();
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeader(context),
              SizedBox(height: size.height * 0.01),
              buildSearchField(),
              buildBody(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: const ValueKey("edit"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NewFlip()),
          );
        },
        child: const Icon(Icons.edit),
      ),
      bottomNavigationBar: Container(
        color: Colors.grey.shade300,
        height: size.height * 0.1,
        child: const Center(child: Text('banner Ad')),
      ),
    );
  }

  Widget buildSearchField() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.06,
      child: TextField(
        keyboardType: TextInputType.name,
        controller: searchController,
        decoration: InputDecoration(
          hintText: "Search",
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          prefixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Expanded buildBody() {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: StaggeredGrid.count(
              axisDirection: AxisDirection.down,
              crossAxisCount: 2,
              mainAxisSpacing: size.height * 0.01,
              crossAxisSpacing: size.width * 0.02,
              children: List.generate(
                books.length,
                (index) => StaggeredGridTile.fit(
                  crossAxisCellCount: 1,
                  child: FlipBookCard(
                    book: books[index],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Flip Book',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              shape: BoxShape.circle,
            ),
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.width * 0.1,
            child: Center(
              child: IconButton(
                style: IconButton.styleFrom(shape: const CircleBorder()),
                onPressed: () {
                  // handle onPressed event here
                },
                icon: const Icon(
                  FontAwesomeIcons.crown,
                  size: 15,
                  color: Colors.orange,
                ),
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void filterBooks() {
    if (searchController.text.isEmpty) {
      books = initialBooks;
      return;
    }
    books = initialBooks
        .where((element) => element.title
            .toLowerCase()
            .startsWith(searchController.text.toLowerCase()))
        .toList();
  }

  static String generateRandomWord() {
    final random = Random();
    const chars = 'ABCDEFGHIJKLMNOPQRSTU';
    final length =
        random.nextInt(20) + 10; // generate a random length between 1 and 6
    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(random.nextInt(chars.length))));
  }
}
