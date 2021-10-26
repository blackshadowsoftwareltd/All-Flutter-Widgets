import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class Simple extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: const Text('Simeple Example')),
        body: Container(
            margin: const EdgeInsets.all(5),
            child: ListView(children: [
              Card(
                  elevation: 5,
                  clipBehavior: Clip.antiAlias,
                  shadowColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(children: [
                    SizedBox(
                        width: double.infinity,
                        height: 250,
                        child: Image.network(
                            'https://images.unsplash.com/photo-1632479807993-52a16d48e99e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=688&q=80',
                            fit: BoxFit.cover)),

                    ///
                    ExpandablePanel(
                        header: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                            child: Text('Header Text',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20))),

                        ///
                        collapsed: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Card(
                                elevation: 5,
                                clipBehavior: Clip.antiAlias,
                                shadowColor: Colors.black87,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(headLine,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16))))),

                        ///
                        expanded: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Card(
                                elevation: 5,
                                clipBehavior: Clip.antiAlias,
                                shadowColor: Colors.black87,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                        List.generate(5, (index) => text)
                                            .join('\n\n'),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16))))))
                  ]))
            ])));
  }

  final headLine =
      'This is the headline of this article. It will remove when the Widget will be Expanded.';
  final text =
      'ExpandablePanel has a number of properties to customize its behavior, but it\'s restricted by having a title at the top and an expand icon shown as a down arrow (on the right or on the left). If that\'s not enough, you can implement custom expandable widgets by using a combination of Expandable, ExpandableNotifier, and ';
}
