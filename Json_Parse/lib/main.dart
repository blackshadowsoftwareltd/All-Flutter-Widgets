import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:convert';

void main() => runApp(MaterialApp(home: _JsonPers()));

class _JsonPers extends StatefulWidget {
  @override
  __JsonPersState createState() => __JsonPersState();
}

class __JsonPersState extends State<_JsonPers> {
  List _data;
  Future<String> loadJsonData() async {
    var _jsonTxt = await rootBundle.loadString('assets/data.json');
    setState(() {
      _data = json.decode(_jsonTxt);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    this.loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Json Pers'),
      ),
      body: ListView.builder(
          itemCount: _data.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    child: Text(_data[index]['name'][0]),
                  ),
                  title: Text(_data[index]['name']),
                  subtitle: Text(_data[index]['mail']),
                  onTap: () {
                    Tooltip(message: 'name: ${_data[index]['name']}');
                  },
                )
              ],
            );
          }),
    );
  }
}
