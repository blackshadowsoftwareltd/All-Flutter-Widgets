import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'TootTip',
      home: _TootTip(),
    ));

class _TootTip extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _TootTipState();
  }
}

class _TootTipState extends State<_TootTip> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toot Tip'),
      ),
      body: Center(
        // ToolTip
        child: Tooltip(
          message: 'Container',
          child: Container(
            color: Colors.blue,
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.home,
                    size: 35,
                  ),
                  onPressed: () {},
                  // ToolTip
                  tooltip: 'Home',
                ),
                IconButton(
                  icon: Icon(
                    Icons.alarm,
                    size: 35,
                  ),
                  onPressed: () {},
                  // ToolTip
                  tooltip: 'Alarm',
                ),
                IconButton(
                  icon: Icon(
                    Icons.camera,
                    size: 35,
                  ),
                  onPressed: () {},
                  // ToolTip
                  tooltip: 'Camera',
                ),
                IconButton(
                  icon: Icon(
                    Icons.image,
                    size: 35,
                  ),
                  onPressed: () {},
                  // ToolTip
                  tooltip: 'Image',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
