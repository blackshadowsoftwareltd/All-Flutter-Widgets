import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:Barcode_Scanner/main.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

void main() => runApp(MaterialApp(home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String barCode = 'Unknown';

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Barcode Scanner')),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: _width,
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: _Barcode(context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: _TextField(context)),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_ScannBarCode(), _CreateBarCode()],
        ),
      ),
    );
  }

  Widget _Barcode(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return BarcodeWidget(
      height: _width - 100,
      width: _width - 100,
      barcode: Barcode.code128(),
      data: barCode ?? 'Hello World',

      /// if true? The data will be desplay
      drawText: true,
    );
  }

  Widget _TextField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
          style: TextStyle(color: Colors.grey[700], fontSize: 20),
          cursorColor: Colors.grey[400],
          decoration: InputDecoration(hintText: barCode),
          onChanged: (value) => barCode = value),
    );
  }

  Widget _CreateBarCode() {
    return FloatingActionButton(
      child: Icon(Icons.done_outline_rounded, color: Colors.white),
      onPressed: () => setState(() {}),
    );
  }

  Widget _ScannBarCode() {
    return FloatingActionButton(
      child: Icon(Icons.scanner_rounded, size: 30, color: Colors.white),
      onPressed: () => _ScannNow(),
    );
  }

  Future<void> _ScannNow() async {
    try {
      final barcode = await FlutterBarcodeScanner.scanBarcode(
          '#fff000', 'Cancel', true, ScanMode.BARCODE);
      if (!mounted) return;
      setState(() {
        this.barCode = barCode;
      });
    } catch (e) {
      barCode = 'Failde to get platform version';
      print(e.toString());
    }
  }
}
