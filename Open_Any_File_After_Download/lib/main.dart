import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: OutlinedButton(
                child: const Text('Downlaod then Open'),
                onPressed: () {
                  String url =
                      'https://png.pngtree.com/png-clipart/20200224/original/pngtree-nature-landscape-vector-illustration-with-cute-design-suitable-for-kids-png-image_5222457.jpg';

                  /// 1st way
                  /// if the file extension already exists in the last of the link.
                  String fileName = url.split('/').last;
                  openFile(url: url, fileName: fileName);

                  /// 2nd way
                  ///Otherwise must mention the filename with the file extension.
                  // openFile(url: url, fileName: 'img.jpg');
                })));
  }

  void openFile({required String url, required String fileName}) async {
    final resultFile = await downloadFile(url: url, fileName: fileName);
    if (resultFile == null) return;
    print('path: ${resultFile.path}');
    OpenFile.open(resultFile.path);
  }

  Future<File?> downloadFile(
      {required String url, required String fileName}) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$fileName');

    ///
    try {
      final response = await Dio().get(url,
          options: Options(
              responseType: ResponseType.bytes,
              followRedirects: false,
              receiveTimeout: 0));
      final ref = file.openSync(mode: FileMode.write);
      ref.writeFromSync(response.data);

      ///
      return file;
    } catch (e) {
      return null;
    }
  }
}
