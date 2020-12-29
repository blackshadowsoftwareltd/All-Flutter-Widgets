import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
      );
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /// Register a send port for the other isolates
    IsolateNameServer.registerPortWithName(
        _receivePort.sendPort, 'Downloading');

    /// Listening for the data is coming other isolates;
    _receivePort.listen((message) {
      setState(() {
        progressValue = message[2];
      });
      print(progressValue);
    });

    FlutterDownloader.registerCallback(downloadingCallback);
  }

  ReceivePort _receivePort = ReceivePort();
  int progressValue = 0;

  static downloadingCallback(id, status, progress) {
    /// Locking up for a send port
    SendPort sendPort = IsolateNameServer.lookupPortByName('Downloading');

    /// Sending the data
    sendPort.send([id, status, progress]);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.orange,
      statusBarBrightness: Brightness.dark,
    ));
    return Scaffold(
        appBar: AppBar(
          title: Text('File Downloader'),
          // backgroundColor: Colors.purple,
        ),
        body: Container(
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                // LinearProgressIndicator(
                //   backgroundColor: Colors.grey,
                //   valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                //   value: progressValue.toDouble(),
                //   minHeight: 60,
                // ),
                Text(
                  '$progressValue',
                  style: TextStyle(fontSize: 20),
                ),
                Container(
                    height: 60,
                    width: 150,
                    margin: EdgeInsets.all(10),
                    child: FlatButton(
                        color: Colors.orange,
                        child: Text(
                          'Download',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        onPressed: () async {
                          final status = await Permission.storage.request();
                          if (status.isGranted) {
                            final externalDir =
                                await getExternalStorageDirectory();
                            final id = await FlutterDownloader.enqueue(
                              url:
                                  'https://cdn.pixabay.com/photo/2019/02/03/16/52/taiwan-3973014_960_720.jpg',
                              savedDir: externalDir.path,
                              fileName: 'download',
                              showNotification: true,
                              openFileFromNotification: true,
                            );
                          } else {
                            print('Permission denied');
                          }
                        }))
              ])),
        ));
  }
}
