import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class UserImage extends StatefulWidget {
  final Function(String imageUrl) onFileChanged;

  const UserImage({Key? key, required this.onFileChanged}) : super(key: key);

  @override
  _UserImageState createState() => _UserImageState();
}

class _UserImageState extends State<UserImage> {
  final ImagePicker _picker = ImagePicker();
  String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (imageUrl == null) Icon(Icons.image, size: 50, color: Colors.green),
        if (imageUrl != null)
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: _selectPhoto,
            child: Container(
              margin: EdgeInsets.all(10),
              child: Image.network(
                imageUrl!,
                fit: BoxFit.contain,
              ),
            ),
          ),
        SizedBox(height: 50),
        InkWell(
          onTap: _selectPhoto,
          child: Text(imageUrl != null ? 'Change Photo' : 'Select Photo'),
        )
      ],
    );
  }

  /// select from
  Future _selectPhoto() async {
    print('pressed');

    await showModalBottomSheet(
        context: context,
        builder: (context) => BottomSheet(
            onClosing: () {},
            builder: (context) => Column(
                  children: [
                    ListTile(
                        title: Text('Camera'),
                        onTap: () {
                          Navigator.pop(context);
                          _pickImage(ImageSource.camera);
                        }),
                    ListTile(
                        title: Text('Gallery'),
                        onTap: () {
                          Navigator.pop(context);
                          _pickImage(ImageSource.gallery);
                        }),
                  ],
                )));
  }

  /// get photo
  Future _pickImage(ImageSource source) async {
    /// compressing originla imgae to 50%
    final pickedFile =
        await _picker.pickImage(source: source, imageQuality: 50);
    if (pickedFile == null) {
      return;
    }

    /// croping
    // var file = await ImageCropper.cropImage(
    //     sourcePath: pickedFile.path,
    //     aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1));
    File? file = await ImageCropper.cropImage(
        sourcePath: pickedFile.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        ));

    if (file == null) {
      return;
    }
    file = await compressImage(file.path, 35);

    /// upload to internet
    await _uploadFile(file.path);
  }

  /// compressing
  Future<File> compressImage(String path, int quality) async {
    /// p from line 6
    final newPath = p.join((await getTemporaryDirectory()).path,
        '${DateTime.now()}.${p.extension(path)}');
    final result = await FlutterImageCompress.compressAndGetFile(path, newPath,
        quality: quality);
    return result!;
  }

  Future _uploadFile(String path) async {
    print('Path>>> $path');
  }
}
