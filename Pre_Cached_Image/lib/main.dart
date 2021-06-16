import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final imgList = [
    'https://images.unsplash.com/photo-1541296604437-8cb5efd2da96?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1091&q=80',
    'https://images.unsplash.com/photo-1567540227188-f27fb2e2babd?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=675&q=80',
    'https://images.unsplash.com/photo-1602130707301-2f09f9d68179?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=634&q=80',
    'https://images.unsplash.com/photo-1594794637446-96206da170be?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
    'https://images.unsplash.com/photo-1508591086314-d7deb00cede9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
    'https://images.unsplash.com/photo-1533903655515-91fb3870be93?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=634&q=80 '
  ];
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => loadData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Pre Ceched Imge')),
      body:   ListView.separated(
              padding: EdgeInsets.all(10),
              itemCount: imgList.length,
              separatorBuilder: (context, index) => Divider(height: 3),
              itemBuilder: (context, index) {
                final imageUrl = imgList[index];
                return isLoading ? loadingView() : previewImage(imageUrl);
              }),
    );
  }

  Future loadData() async {
    setState(() => isLoading = true);

    await Future.wait(
        imgList.map((img) => cachingImage(context, img)).toList());

    setState(() => isLoading = false);
  }

  /// precacheImage method is come from Flutter SDK
  Future cachingImage(BuildContext context, String image) =>
      precacheImage(CachedNetworkImageProvider(image), context);

  Widget previewImage(String imageUrl) => Container(
      height: 150,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
      ));

  Widget loadingView() => Container(
      margin: EdgeInsets.all(20),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(20)));
}
