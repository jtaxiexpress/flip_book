import 'package:flutter/material.dart';

class MyReorderableList extends StatefulWidget {
  @override
  _MyReorderableListState createState() => _MyReorderableListState();
}

class _MyReorderableListState extends State<MyReorderableList> {
  List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6'
  ];
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 100,
              child: GestureDetector(
                onHorizontalDragUpdate: (dt) {
                  if (dt.delta.dx < 0) {
                    //left swipe
                    scrollController.animateTo(
                        scrollController.offset +
                            MediaQuery.of(context).size.width * 0.9,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut);
                  } else {
                    scrollController.animateTo(
                        scrollController.offset -
                            MediaQuery.of(context).size.width * 0.9,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut);
                  }
                },
                child: ReorderableListView(
                  physics: NeverScrollableScrollPhysics(),
                  scrollController: scrollController,
                  scrollDirection: Axis.horizontal,
                  onReorder: (oldIndex, newIndex) {
                    setState(() {
                      if (newIndex > oldIndex) {
                        newIndex -= 1;
                      }
                      final item = items.removeAt(oldIndex);
                      items.insert(newIndex, item);
                    });
                  },
                  children: [
                    for (final item in items)
                      SizedBox(
                        key: Key(item),
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Text(item),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
