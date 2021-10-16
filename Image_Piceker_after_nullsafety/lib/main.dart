import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File? image;
  List<File> images = [];
  final _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
          width: double.infinity,
          child: Column(children: [
            Container(
                color: Colors.green.shade100,
                padding: const EdgeInsets.all(10),
                child: _image()),
            ...images.map((File e) {
              print(e.path);
              return InkWell(
                onLongPress: () => setState(() => images.remove(e)),
                child: Container(
                    margin: const EdgeInsets.all(5),
                    height: 100,
                    child: Image.file(e, fit: BoxFit.fitHeight)),
              );
            }),
            const SizedBox(height: 10),
            FloatingActionButton.extended(
                icon: const Icon(Icons.add_a_photo),
                label: const Text('Pick Multiple'),
                onPressed: _pickMultipleImageFromGallery)
          ])),
    );
  }

  Widget _image() =>
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        image == null
            ? const Flexible(child: Text('Select one'))
            : SizedBox(
                height: 100, child: Image.file(image!, fit: BoxFit.fitHeight)),
        image == null
            ? Row(children: [
                IconButton(
                    onPressed: _pickImageFromCamera,
                    icon: const Icon(Icons.camera, color: Colors.blueGrey)),
                IconButton(
                    onPressed: _pickImageFromGallery,
                    icon: const Icon(Icons.image, color: Colors.blueGrey))
              ])
            : IconButton(
                onPressed: () => setState(() => image = null),
                icon: const Icon(Icons.delete, color: Colors.blueGrey))
      ]);
  Future _pickImageFromGallery() async {
    final _pickedFiled =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
    setState(() {
      if (_pickedFiled != null)
        image = File(_pickedFiled.path);
      else
        print('No image selected');
    });
  }

  Future _pickImageFromCamera() async {
    final _pickedFiled =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 100);
    setState(() {
      if (_pickedFiled != null)
        image = File(_pickedFiled.path);
      else
        print('No image selected');
    });
  }

  Future _pickMultipleImageFromGallery() async {
    final _pickedFiled =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
    setState(() {
      if (_pickedFiled != null) {
        images.add(File(_pickedFiled.path));
        print(images.length);
      } else
        print('No image selected');
    });
  }

  Future _pickMultipleImageFromCamera() async {
    final _pickedFiled =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 100);
    setState(() {
      if (_pickedFiled != null)
        images.add(File(_pickedFiled.path));
      else
        print('No image selected');
    });
  }
}
