import 'package:Json_Pars_inside_Server/PostView.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(MaterialApp(home: JsonPersFromServer()));

class JsonPersFromServer extends StatefulWidget {
  @override
  _JsonPersFromServerState createState() => _JsonPersFromServerState();
}

class _JsonPersFromServerState extends State<JsonPersFromServer> {
  List _posts;
  Future<bool> _getPost() async {
    String _serverUrl = 'https://jsonplaceholder.typicode.com/posts';
    var _response = await http.get(_serverUrl);
    setState(() {
      _posts = json.decode(_response.body.toString());
    });
  }

  @override
  void initState() {
    super.initState();
    this._getPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Json Pers form Server'),
        ),
        body: ListView.builder(
            itemCount: _posts.length == null ? 0 : _posts.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(_posts[index]['title']),
                // subtitle: Text(_posts[index]['id']),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => PostView(
                                data: _posts[index],
                              )));
                },
              );
            }));
  }
}
