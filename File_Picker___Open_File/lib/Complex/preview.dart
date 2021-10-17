import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class PreViewScreen extends StatelessWidget {
  final List<PlatformFile> files;

  const PreViewScreen({
    Key? key,
    required this.files,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PreVeiw Screen')),
      body: SizedBox(
        width: double.infinity,
        child: GridView.builder(
            padding: const EdgeInsets.all(5),
            itemCount: files.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 5),
            itemBuilder: (context, index) {
              final data = files[index];
              return zContainer(data);
            }),
      ),
    );
  }

  Widget zContainer(PlatformFile data) {
    final kb = data.size / 1024;
    final mb = kb / 1024;
    final fileSize =
        mb >= 1 ? '${mb.toStringAsFixed(2)} MB' : '${kb.toStringAsFixed(2)} KB';
    final extension = data.extension ?? 'none';
    // final color = getColor(extension);
    return InkWell(
        onTap: () => OpenFile.open(data.path),
        child: SizedBox(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
              child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green.shade100),
                  child: Text('.$extension',
                      style: const TextStyle(fontSize: 40)))),
          Text(data.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
          Text(fileSize,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
        ])));
  }
}
