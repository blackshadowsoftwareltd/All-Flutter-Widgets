import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

void main() => runApp(const MaterialApp(home: Home()));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final pageController = PageController(initialPage: 0);

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery'),
        actions: [
          Center(
            child: Text('${currentIndex + 1} / ${images.length}    '),
          )
        ],
      ),
      body: PhotoViewGallery.builder(
          pageController: pageController,
          scrollDirection: Axis.horizontal,
          onPageChanged: (index) => setState(() => currentIndex = index),

          ///
          itemCount: images.length,
          builder: (context, index) {
            final img = images[index];
            return PhotoViewGalleryPageOptions(
                imageProvider: NetworkImage(img),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.contained * 5 // zoom 5x
                );
          }),
    );
  }

  final images = [
    'https://images.unsplash.com/photo-1635358530056-a86f39f27cfe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',
    'https://images.unsplash.com/photo-1635598785659-60ddfb58696b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    'https://images.unsplash.com/photo-1635417073744-0b09b9ac4dfc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    'https://images.unsplash.com/photo-1634145365165-3ac2cfdf1cf5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=687&q=80'
  ];
}
