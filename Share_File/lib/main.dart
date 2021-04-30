import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Share Files')),
      body: Center(
          child: OutlinedButton(
              child: Text('Pick a File'), onPressed: () => ShareFile())),
    );
  }

  Future ShareFile() async {
    print('pressed');

    /// for file path
    final filePaths = await pickAFile();

    /// share
    if (!filePaths.isEmpty)
      Share.shareFiles(
        filePaths,
      );
  }

  Future pickAFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);
    return result == null ? <String>[] : result.paths;
  }
}
