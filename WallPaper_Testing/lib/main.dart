import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wallpaperplugin/wallpaperplugin.dart';

void main() => runApp(MaterialApp(
      home: Home(),
      theme: ThemeData(brightness: Brightness.dark),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _localPath;
  String url =
      'https://images.pexels.com/photos/1671325/pexels-photo-1671325.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WallPaper')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) => _showDialog(context, url));
            print('Clicked on Image...........');
          },
          child: Container(
            color: Colors.green,
            height: MediaQuery.of(context).size.height - 100,
            width: MediaQuery.of(context).size.width - 10,
            child: Image.network(
              url,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
        ),
      ),
    );
  }

  static Future<bool> _checkAndGetPermission() async {
    // final PermissionStatus permission=await
  }

  _showDialog(context, value) {
    return CupertinoAlertDialog(
      title: Text('Set as wallpaper'),
      content: Text('Click yes to set wallpaper'),
      actions: [
        FlatButton(
            onPressed: () {
              getPer();
              Navigator.pop(context);
              print('Clicked on Yes...........');
            },
            child: Text('Yes')),
        FlatButton(
            onPressed: () async {
              Navigator.pop(context);
              print('Clicked on No...........');
            },
            child: Text('No'))
      ],
    );
  }

  getPer() async {
    var storagePer = await Permission.storage.status;
    if (!storagePer.isGranted) {
      await Permission.storage.request();
    }
    if (await Permission.storage.isGranted) {
      print('permission.........');
      Dio dio = Dio();
      final Directory appdirectory = await getApplicationDocumentsDirectory();

      await Directory(appdirectory.path + '/wallpapers')
          .create(recursive: true);
      final String dir = appdirectory.path;
      String localPath = '$dir/myImage.jpeg';
      try {
        dio.download(url, localPath);
        setState(() {
          _localPath = localPath;
        });
        Wallpaperplugin.setAutoWallpaper(localFile: _localPath);
      } on PlatformException catch (e) {
        print(e);
      }
    }
  }
}
