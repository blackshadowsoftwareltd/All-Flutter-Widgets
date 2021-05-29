import 'package:drag_and_drop/model/draggable_list.dart';

List<DraggableList> allLists = [
  DraggableList(header: 'Best Fruits', items: [
    DraggableListItem(title: 'Oragne', urlImage: 'images/orange.png'),
    DraggableListItem(title: 'Mango', urlImage: 'images/mango.png'),
    DraggableListItem(title: 'Watermelon', urlImage: 'images/watermelon.png'),
    DraggableListItem(title: 'Grapes', urlImage: 'images/grapes.png'),
  ]),
  DraggableList(header: 'Cheap Fruite', items: [
    DraggableListItem(title: 'Bananas', urlImage: 'images/bananas.png'),
    DraggableListItem(title: 'Mango', urlImage: 'images/mango.png'),
    DraggableListItem(title: 'Pineapple', urlImage: 'images/pineapple.png'),
    DraggableListItem(title: 'Watermelon', urlImage: 'images/watermelon.png'),
  ]),
  DraggableList(header: 'Expencive Fruits', items: [
    DraggableListItem(title: 'Apple', urlImage: 'images/apple.png'),
    DraggableListItem(title: 'Strawberry', urlImage: 'images/strawberry.png'),
    DraggableListItem(title: 'Orange', urlImage: 'images/orange.png'),
    DraggableListItem(title: 'Grapes', urlImage: 'images/grapes.png'),
  ])
];
