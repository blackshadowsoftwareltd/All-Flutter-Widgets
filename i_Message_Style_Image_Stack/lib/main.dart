import 'package:flutter/material.dart';
import 'package:swipe_deck/swipe_deck.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('i Message Style Image Stack')),
        body: SwipeDeck(
          widgets: images
              .map((e) => ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(e, fit: BoxFit.cover)))
              .toList(),

          ///
          emptyIndicator: Center(
              child:
                  CircularProgressIndicator()), // if any chance list has empty
          startIndex: 0, // no need
          aspectRatio: 1.5 / 1,
        ));
  }

  List<String> images = [
    'https://images.unsplash.com/photo-1485970247670-34cd80f5a996?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80',
    'https://images.unsplash.com/photo-1421789665209-c9b2a435e3dc?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1171&q=80',
    'https://images.unsplash.com/photo-1508349937151-22b68b72d5b1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=687&q=80',
    'https://images.unsplash.com/photo-1539901241555-2bd95a83dc6e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=715&q=80',
    'https://images.unsplash.com/photo-1501250523374-8f78abda6b86?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=627&q=80'
  ];
}
