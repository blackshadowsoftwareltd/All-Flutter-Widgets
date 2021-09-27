import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  OverlayEntry? entry;
  Offset offset = Offset(20, 50);
  bool isShow = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /// if need floating overlay Widget in initState. when app is start
    /// must need WidgetsBinding. otherwise it will be throw an error
    WidgetsBinding.instance!
        .addPostFrameCallback((timeStamp) => showFloatingOverlayWidget());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    /// if we use floating overlay widget in initState. otherwize no need to dispose it
    stopFloatingOverlayWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Floating Overlay Widget')),
        body: Center(
            child: TextButton(
                child: Text(isShow ? 'Stop' : 'Start',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: isShow ? Colors.deepOrange : Colors.green)),
                onPressed: isShow
                    ? stopFloatingOverlayWidget
                    : showFloatingOverlayWidget)));
  }

  void showFloatingOverlayWidget() {
    entry = OverlayEntry(
        builder: (context) => Positioned(
            left: offset.dx,
            top: offset.dy,
            child: GestureDetector(
                onPanUpdate: (details) {
                  offset += details.delta;
                  entry!.markNeedsBuild();
                },
                child: FloatingActionButton.extended(
                    backgroundColor: Colors.deepOrange,
                    label: Text(
                      'Floating Overlay',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () => print('Pressed')))));

    ///
    final overlay = Overlay.of(context)!;
    overlay.insert(entry!);
    isShow = true;
    setState(() {});
  }

  void stopFloatingOverlayWidget() {
    entry?.remove();
    entry = null;
    isShow = false;
    setState(() {});
  }
}
