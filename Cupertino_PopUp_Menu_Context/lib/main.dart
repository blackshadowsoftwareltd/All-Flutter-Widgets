// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  final img =
      'https://images.unsplash.com/photo-1608975213589-14e7f23aeab7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=687&q=80';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cupertino Context Menu')),
      body: Center(
        child: SizedBox(
          width: 150,
          height: 150,
          child: CupertinoContextMenu(
            previewBuilder: (context, animation, child) => SizedBox.expand(
                child:
                    _card()), // builder is optional for customization. (SizedBox.expand)

            ///
            child: _card(),
            actions: [
              CupertinoContextMenuAction(
                  child: const Text('Edit'),
                  trailingIcon: CupertinoIcons.pen,
                  onPressed: () {
                    print('pressed');
                    Navigator.pop(
                        context); // must need pop. otherwise onpressed method not work
                  }),
              CupertinoContextMenuAction(
                  child: const Text('Preview'),
                  trailingIcon: CupertinoIcons.eye,
                  onPressed: () {
                    print('pressed');
                    Navigator.pop(context);
                  }),
              CupertinoContextMenuAction(
                  isDestructiveAction:
                      true, // isDestructiveAction will make it red tile
                  child: const Text('Delete'),
                  trailingIcon: CupertinoIcons.delete_solid,
                  onPressed: () {
                    print('pressed');
                    Navigator.pop(context);
                  }),
              CupertinoContextMenuAction(
                child: const Text('Close'),
                trailingIcon: CupertinoIcons.command,
                onPressed: () {
                  print('pressed');
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Card _card() => Card(
      clipBehavior: Clip.antiAlias,
      shadowColor: Colors.black54,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.green.shade100,
      child: Image.network(img, fit: BoxFit.cover));
}
