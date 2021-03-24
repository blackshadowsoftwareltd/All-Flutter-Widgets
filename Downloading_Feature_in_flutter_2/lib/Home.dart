import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Dio dio = Dio();
  bool isLoading = false;
  double progressValue = 0;
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Downloading feature in Flutter 2')),
      body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(flex: 2),
              FlatButton(
                  child: Text(
                    'Download',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  color: Colors.blue,
                  onPressed: () => downloadFile()),
              Spacer(flex: 1),
              Container(
                  width: MediaQuery.of(context).size.width - 20,
                  alignment: Alignment.center,
                  child: isLoading
                      ? LinearProgressIndicator(
                          minHeight: 10,
                          value:progressValue,
                          backgroundColor: Colors.grey[300],
                        )
                      : null),
              Spacer(flex: 1),
              Text('${progressValue * 100}'), Text('$value'),
              Spacer(flex: 2)
            ],
          )),
    );
  }

  ///
  Future<bool> saveVideo(String url, String fileName) async {
    Directory directory;
    try {
      if (Platform.isAndroid) {
        if (await _requestPermission(Permission.storage)) {
          directory = await getExternalStorageDirectory();
          String newPath = "";
          print(directory);
          List<String> paths = directory.path.split("/");
          for (int x = 1; x < paths.length; x++) {
            String folder = paths[x];
            if (folder != "Android") {
              newPath += "/" + folder;
            } else {
              break;
            }
          }
          newPath = newPath + "/FlutterApp";
          directory = Directory(newPath);
        } else {
          return false;
        }
      } else {
        if (await _requestPermission(Permission.photos)) {
          directory = await getTemporaryDirectory();
        } else {
          return false;
        }
      }
      File saveFile = File(directory.path + "/$fileName");
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      if (await directory.exists()) {
        await dio.download(url, saveFile.path,
            onReceiveProgress: (value1, value2) {
          setState(() {
            progressValue = value1 / value2;
            double v=progressValue*100;
            value =v.toInt();
          });
        });
        if (Platform.isIOS) {
          await ImageGallerySaver.saveFile(saveFile.path,
              isReturnPathOfIOS: true);
        }
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  ///
  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }

  ///
  downloadFile() async {
    setState(() {
      isLoading = true;
      progressValue = 0;
    });
    // bool downloaded = await saveVideo(
    //     "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4",
    //     "video.mp4");

    bool downloaded = await saveVideo(
        'https://images.unsplash.com/photo-1613255167658-6815dfa67cdc?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1050&q=80',
        'image.jpg');

    if (downloaded) {
      print("File Downloaded");
    } else {
      print("Problem Downloading File");
    }
    setState(() {
      isLoading = false;
    });
  }
}
