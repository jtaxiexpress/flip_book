import 'package:flipbook/model/flip_book.dart';
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
  final List<double> heights = [100, 50, 20, 60, 80, 100];
  final searchController = TextEditingController();
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
              SizedBox(height: size.height * 0.01),
              buildBody(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.edit),
      ),
    );
  }

  TextField buildSearchField() {
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
        hintText: "Search",
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Expanded buildBody() {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StaggeredGrid.count(
          axisDirection: AxisDirection.down,
          crossAxisCount: 2,
          mainAxisSpacing: size.height * 0.02,
          crossAxisSpacing: size.width * 0.05,
          children: List.generate(
            heights.length,
            (index) => StaggeredGridTile.fit(
              crossAxisCellCount: 1,
              child: FlipBookCard(
                book: FlipBook(
                  title: 'title$index title$index title$index title$index',
                  creationDate: Jiffy.parseFromDateTime(DateTime.now())
                      .format(pattern: "yyyy/MM/dd hh:mm"),
                  imageUrls:
                      List.generate(8, (i) => "assets/images/${i + 1}.png"),
                ),
              ),
            ),
          ),
        ),
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

  void filterBooks() {}
}
