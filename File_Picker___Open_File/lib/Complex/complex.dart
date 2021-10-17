import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:file_picker_all_file/Complex/preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ComplexWay extends StatefulWidget {
  const ComplexWay({Key? key}) : super(key: key);

  @override
  _ComplexWayState createState() => _ComplexWayState();
}

class _ComplexWayState extends State<ComplexWay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Complex Way')),
        body: SizedBox(
            width: double.infinity,
            child: Column(children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                      tileColor: Colors.green.shade100,
                      title: const Text('Pick single file then print'),
                      onTap: _pickFile)),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                      tileColor: Colors.green.shade100,
                      title: const Text('Pick Multiple files'),
                      onTap: _pickMultipleFile))
            ])));
  }

  /// single file
  _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      /// for allow multiple file
      allowMultiple: false,

      /// for picking custom extension file
      // type: FileType.image

      ///or
      // type: FileType.custom,
      // allowedExtensions: ['pdf', 'mp4', 'jpeg', 'jpg', 'png']
    );
    if (result == null) return;
    final file = result.files.first;

    ///
    final newFile = await _saveFilePermanently(file);

    /// print
    print('From picker path: ${file.path}');
    print('From Directory path: ${newFile.path}');
  }

  Future<File> _saveFilePermanently(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.name}');
    return File(file.path!).copy(newFile.path);
  }

  /// multiple files
  _pickMultipleFile() async {
    final result = await FilePicker.platform.pickFiles(
      /// for allow multiple file
      allowMultiple: true,

      /// for picking custom extension file
      // type: FileType.image

      ///or
      // type: FileType.custom,
      // allowedExtensions: ['pdf', 'mp4', 'jpeg', 'jpg', 'png']
    );
    if (result == null) return;
    openMultipleFileToNextScreen(result.files);
  }

  void openMultipleFileToNextScreen(List<PlatformFile> files) => Navigator.push(
      context,
      CupertinoPageRoute(
          builder: (context) => PreViewScreen(
                files: files,
              )));
}
