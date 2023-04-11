import 'dart:async';
import 'dart:math';

import 'package:flipbook/model/flip_book.dart';
import 'package:flipbook/utilities/banner_ads.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

import '../custom_widgets/book_card.dart';
import '../state_management/flipbook_provider.dart';
import 'edit_flip_book.dart';
import 'new_flip.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final searchController = TextEditingController();
  List<FlipBook> initialBooks = [];
  List<FlipBook> books = [];

  var isLoadingBooks = false;

  BannerAd? bannerAd;
  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      filterBooks();
      if (mounted) setState(() {});
    });
    Future.delayed(const Duration(milliseconds: 2)).then((value) async {
      final model = context.read<FlipBookProvider>();
      bannerAd = await model.initBannerAd();
      if (mounted) {
        setState(() {});
      }
      model.loadApplicationDir();
      model.resetOutputVideoPathAndImageUploadCount();
      loadBooks();
      // context.read<FlipBookProvider>().deleteDb();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final model = context.read<FlipBookProvider>();
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
              isLoadingBooks
                  ? Container(
                      margin: EdgeInsets.only(top: size.height * 0.3),
                      child: const Center(child: CircularProgressIndicator()))
                  : buildBody(),
              Container(
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.only(top: 10, right: 10),
                  child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () async {
                        _showLicense(context);
                      },
                      icon: Icon(
                        Icons.info,
                        color: Colors.grey,
                        size: 14,
                      ))),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: const ValueKey("edit"),
        onPressed: () async {
          //TODO show interstitial ad
          model.showInterstitialAd();
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewFlip(
                onFlipCreate: loadBooks,
              ),
            ),
          );
          if (mounted) {
            setState(() {});
          }
          context
              .read<FlipBookProvider>()
              .resetOutputVideoPathAndImageUploadCount();
          loadBooks();
        },
        child: const Icon(Icons.edit),
      ),
      bottomNavigationBar: SafeArea(
        child: FutureBuilder<Widget>(
          future: Ads.buildBannerWidget(
            context: context,
          ),
          builder: (_, snapshot) {
            if (!snapshot.hasData) return const Text("...");

            return SizedBox(
              height: 70,
              width: MediaQuery.of(context).size.width,
              child: snapshot.data,
            );
          },
        ),
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
          suffixIcon: searchController.text.isEmpty
              ? null
              : IconButton(
                  onPressed: () {
                    searchController.clear();
                    if (mounted) setState(() {});
                  },
                  icon: const Icon(Icons.clear)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
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

  void loadBooks() async {
    if (mounted) {
      setState(() {
        isLoadingBooks = true;
      });
    }
    print('Reloading...');
    await context.read<FlipBookProvider>().loadAllBooks();
    initialBooks = context.read<FlipBookProvider>().books;
    books = initialBooks;
    if (mounted) {
      setState(() {
        isLoadingBooks = false;
      });
    }
    print('reloaded');
  }

  Expanded buildBody() {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: books.isEmpty
                ? SizedBox(
                    height: size.height * 0.6,
                    child: Center(
                      child: Text(
                        capitalizeText('No flipbooks for now.'),
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ),
                  )
                : StaggeredGrid.count(
                    axisDirection: AxisDirection.down,
                    crossAxisCount: 2,
                    mainAxisSpacing: size.height * 0.01,
                    crossAxisSpacing: size.width * 0.02,
                    children: List.generate(
                      books.length,
                      (index) => StaggeredGridTile.fit(
                        crossAxisCellCount: 1,
                        child: FlipBookCard(
                          onDeleted: () {
                            loadBooks();
                          },
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EditFlipBook(flipBook: books[index])),
                            );
                            if (mounted) {
                              setState(() {});
                            }

                            context
                                .read<FlipBookProvider>()
                                .resetOutputVideoPathAndImageUploadCount();
                            loadBooks();
                            searchController.clear();
                            if (mounted) setState(() {});
                          },
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
                  // ToDO add crown button onPressed
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

//show licences
  Future _showLicense(BuildContext context) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    showAboutDialog(
      context: context,
      applicationName: packageInfo.appName,
      applicationVersion: packageInfo.version,
      applicationIcon: Icon(Icons.tag_faces),
      applicationLegalese: "Minerva K.K",
    );
  }
}
