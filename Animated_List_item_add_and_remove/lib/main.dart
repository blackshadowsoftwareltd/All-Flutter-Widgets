import 'package:animated_list/list_items.dart';
import 'package:flutter/material.dart';

import 'list_item_widget.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  final List<ListItem> items = List.from(listItems);
  final listKey = GlobalKey<AnimatedListState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AnimatedList(
        key: listKey,
        initialItemCount: items.length,
        itemBuilder:
            (BuildContext context, int index, Animation<double> animation) =>
                ListItemWidget(
          item: items[index],
          animation: animation,
          onClickd: () => removeItem(index),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => addItem(items.length),
      ),
    );
  }

  void removeItem(int index) {
    final removedItem = items[index];
    items.removeAt(index);
    listKey.currentState!.removeItem(
        index,
        (context, animation) => ListItemWidget(
            item: removedItem, animation: animation, onClickd: () {}),

        /// for animation style 1
        duration: Duration(seconds: 1));

        /// for animation style 2
        // duration: Duration(seconds: 3));
  }

  void addItem(int length) {
    final newIndex = length;
    final newItem = ListItem(brand: 'KTM', model: 'RC 125');
    items.insert(newIndex, newItem);
    listKey.currentState!.insertItem(newIndex, duration: Duration(seconds: 1));
  }
}
