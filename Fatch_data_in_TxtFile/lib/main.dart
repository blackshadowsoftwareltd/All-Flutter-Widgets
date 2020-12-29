import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() => runApp(MaterialApp(
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fatching data from Txt File',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: Center(
            child: ListView(
          children: [
            Text(_data, style: TextStyle(fontSize: 18)),
          ],
        )),
      ),
    );
  }

  String _data = '';
  fatchTxtFile() async {
    String _responseTxt;
    _responseTxt = await rootBundle.loadString('text/discription.txt');
    setState(() {
      _data = _responseTxt;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    fatchTxtFile();
    super.initState();
  }
}
