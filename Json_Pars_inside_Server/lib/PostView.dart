import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PostView extends StatefulWidget {
  var data;
  PostView({this.data});
  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  @override
  Widget build(BuildContext context) {
    MaterialApp();
    return Scaffold(
      appBar: AppBar(
        title: Text('All Data'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.green,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Id: ${widget.data['id']}',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Divider(
              color: Colors.black,
              height: 5,
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              color: Colors.green,
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Title: ${widget.data['title']}',
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            Divider(
              color: Colors.black,
              height: 5,
            ),
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.green,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Description :${widget.data['body']}',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
