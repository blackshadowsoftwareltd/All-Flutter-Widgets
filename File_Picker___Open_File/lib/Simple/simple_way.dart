import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class SimpleWay extends StatefulWidget {
  const SimpleWay({Key? key}) : super(key: key);

  @override
  _SimpleWayState createState() => _SimpleWayState();
}

class _SimpleWayState extends State<SimpleWay> {
  ///
  String? path;
  List<PlatformFile> files = [];

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple Way')),
      body: SizedBox(
          width: double.infinity,
          child: Column(children: [
            const Text('Single file'),
            SizedBox(
                width: double.infinity,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      path != null
                          ? Flexible(
                              child: Text(path.toString(),
                                  overflow: TextOverflow.ellipsis))
                          : const Text('Empty'),
                      OutlinedButton(
                          child: const Text('Pick file'),
                          onPressed: () async {
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
                            path = file.path;
                            print('Name: ${file.name}');
                            print('Bytes: ${file.bytes}');
                            print('Size: ${file.size}');
                            print('Extension: ${file.extension}');
                            print('Path: ${file.path}');
                            setState(() {});

                            /// then open
                            // final file = result.files.first;
                            // OpenFile.open(file.path);
                          }),
                      if (path != null)
                        OutlinedButton(
                            child: const Text('View file'),
                            onPressed: () => OpenFile.open(path))
                    ])),

            ///
            const Divider(color: Colors.black),
            const Text('List of file'),

            /// list of multiple files
            ...files
                .map((PlatformFile e) => Padding(
                      padding: const EdgeInsets.all(5),
                      child: ListTile(
                          tileColor: Colors.green.shade100,
                          onTap: () => OpenFile.open(e.path),
                          onLongPress: () => setState(() => files.remove(e)),
                          title: Text(e.name)),
                    ))
                .toList(),

            /// multiple file pick button
            OutlinedButton(
                child: const Text('Pick Multiple'),
                onPressed: () async {
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

                  /// add file in files list
                  files.add(PlatformFile(
                      name: result.files.first.name,
                      size: result.files.first.size,
                      bytes: result.files.first.bytes,
                      path: result.files.first.path,
                      readStream: result.files.first.readStream));
                  setState(() {});
                })
          ])),
    );
  }
}