import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('StateFull Dialog')),
      body: Center(
        child: FlatButton(
          child: Text(
            'StateFull Dialog',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          color: Colors.blue,
          onPressed: () async => await showInfoDialog(context),
        )
      )
    );
  }

  Future<void> showInfoDialog(BuildContext context) async {
    int value = 0;
    return await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Container(
                height: 120,
                color: Colors.grey[300],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Number $value'),
                    TextButton(
                      child: Text('Increment ++'),
                      onPressed: () => setState(() => value++),
                    )
                  ],
                ),
              ),
              actions: [
                TextButton(
                  child: Text('Close'),
                  onPressed: () => Navigator.of(context).pop(),
                )
              ],
            );
          });
        });
  }
}
