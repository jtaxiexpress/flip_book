import 'package:flutter/material.dart';

class ReorderableListViewExample extends StatefulWidget {
  @override
  _ReorderableListViewExampleState createState() =>
      _ReorderableListViewExampleState();
}

class _ReorderableListViewExampleState
    extends State<ReorderableListViewExample> {
  List<String> containers = List.generate(6, (index) => 'Container $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reorderable List View Example'),
      ),
      body: ReorderableListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: containers.length,
        itemBuilder: (context, index) => GestureDetector(
          key: Key('$index'),
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blue,
            child: Center(
              child: Text(containers[index]),
            ),
          ),
        ),
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final container = containers.removeAt(oldIndex);
            containers.insert(newIndex, container);
          });
        },
      ),
    );
  }
}
