import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';

import 'data/source_data_list.dart';
import 'model/draggable_list.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<DragAndDropList> lists;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lists = allLists.map(listContent).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Drag and Drop List')),
      body: DragAndDropLists(
          children: lists,
          onItemReorder: onReOrderListItem,
          onListReorder: onReOrderList,
          listPadding: EdgeInsets.all(5),

          /// this property for end of the list blank spacing
          lastListTargetSize: 10,
          lastItemTargetHeight: 5,
          addLastItemTargetHeightToTop: true,
          listInnerDecoration: BoxDecoration(
              color: Colors.deepPurple[100],
              borderRadius: BorderRadius.circular(10)),
          itemDivider: Divider(thickness: .5, height: 0, color: Colors.white),
          itemDecorationWhileDragging:
              BoxDecoration(color: Colors.deepPurple[300]),
          listDragHandle: dragHandler(isList: true),
          itemDragHandle: dragHandler()),
    );
  }

  DragAndDropList listContent(DraggableList list) => DragAndDropList(
      header: Container(
          padding: const EdgeInsets.all(5),
          child: Text(list.header,
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 18,
                  fontWeight: FontWeight.bold))),
      children: list.items
          .map((item) => DragAndDropItem(
                  child: ListTile(
                leading: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(50)),
                    child: Image.asset(item.urlImage, width: 40, height: 40)),
                title: Text(item.title),
                onTap: () => print('pressed'),
              )))
          .toList());

  /// this method of moving a single listTile
  void onReOrderListItem(int oldItemIndex, int oldListIndex, int newItemIndex,
          int newListIndex) =>
      setState(() {
        final oldListItems = lists[oldListIndex].children;
        final newListItems = lists[newListIndex].children;
        final movedItem = oldListItems.removeAt(oldItemIndex);
        newListItems.insert(newItemIndex, movedItem);
      });

  /// this method for moving group of list
  void onReOrderList(int oldListIndex, int newListIndex) => setState(() {
        final movedList = lists.removeAt(oldListIndex);
        lists.insert(newListIndex, movedList);
      });

  /// this method for menu Icon
  DragHandle dragHandler({bool isList = false}) {
    final verticalAlignment = isList
        ? DragHandleVerticalAlignment.top
        : DragHandleVerticalAlignment.center;
    final color = isList ? Colors.grey[500] : Colors.white;

    return DragHandle(
        verticalAlignment: verticalAlignment,
        child: Container(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.menu, color: color)));
  }
}
