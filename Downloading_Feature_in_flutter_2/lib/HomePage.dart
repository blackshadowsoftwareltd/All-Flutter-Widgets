import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  final Dio dio = Dio();
  double progressValue = 0;

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
                          value: progressValue,
                          backgroundColor: Colors.grey[300],
                        )
                      : null),
              Spacer(flex: 1),
              Text('${progressValue*100}'),
              Spacer(flex: 2)
            ],
          )),
    );
  }

  Future<bool> saveFile(String url, String fileName) async {
    Directory directory;
    try {
      if (Platform.isAndroid) {
        /// for Android devices
        if (await _requestPermission(Permission.storage)) {
          directory = await getExternalStorageDirectory();
          print(directory.path);

          /// creating a folder
          String newPath = '';

          List<String> folders = directory.path.split('/');
          for (int x = 1; x < folders.length; x++) {
            String folder = folders[x];
            if (folder != 'Android')
              newPath += '/' + folder;
            else
              break;
          }
          newPath = newPath + '/myFolder'; //myFolder is my folder name.
          directory = Directory(newPath);
          print(directory.path);
        } else
          return false;
      } else {
        /// for iOS devices

        if (await _requestPermission(Permission.photos)) {
          directory = await getTemporaryDirectory();
        } else
          return false;
      }
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      if (await directory.existsSync()) {
        File saveFile = File(
            directory.path + '/myFolder'); //myFolder is my folder name
        await dio.download(url, saveFile.path,
            onReceiveProgress: (downloaded, totalSize) {
          setState(() => progressValue = downloaded / totalSize);
        });

        if (Platform.isIOS) {
          await ImageGallerySaver.saveFile(saveFile.path,
              isReturnPathOfIOS: true);
        }

        return true;
      }
    } catch (e) {
      print(e.toString());
    }
    return false;
  }

  /// checking permission
  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted)
      return true;
    else {
      var result = await permission.request();
      if (result == PermissionStatus.granted)
        return true;
      else
        return false;
    }
  }

  ///
  downloadFile() async {
    setState(() {
      isLoading = true;
      progressValue = 0;
    });
    // bool downloaded = await saveFile(
    //     'https://www.youtube.com/watch?v=rI1dYoIdPUU', 'testVideo.mp4');
    // bool downloaded = await saveFile(
    //     'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4', 'testVideo.mp4');
    bool downloaded = await saveFile(
        'https://images.unsplash.com/photo-1613255167658-6815dfa67cdc?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1050&q=80',
        'testVideo.png');
    if (downloaded)
      print('File Downloaded');
    else
      print('Problem Downloading File');
    setState(() => isLoading = false);
  }
}
