import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String url1 =
      'https://images.unsplash.com/photo-1594794637446-96206da170be?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80';

  String url2 =
      'https://images.unsplash.com/photo-1570459027562-4a916cc6113f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80';

  /// custom cache maneger for cached data upto 2 days.
  static final customCacheManeger =
      CacheManager(Config('customCacheKey', stalePeriod: Duration(days: 2)));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              cachedImage(),
              Text(
                  'tap on blue button to clear flutter cache or green button to clear all cache and cachedNetworkImge cache'),
              normalImage()
            ]),
        floatingActionButton:
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton(
            child: Icon(Icons.clear_all_rounded),
            onPressed: () => clearCached(),
          ),
          FloatingActionButton(
              backgroundColor: Colors.green,
              child: Icon(Icons.clear_all_rounded),
              onPressed: () => clearAllCached())
        ]));
  }

  void clearCached() {
    imageCache.clear();
    imageCache.clearLiveImages();

    setState(() => print('clear'));
  }

  void clearAllCached() {
    DefaultCacheManager().emptyCache();
    imageCache.clear();
    imageCache.clearLiveImages();

    setState(() => print('clear'));
  }

  Widget cachedImage() => Container(
      height: 200,
      child: Row(children: [
        CachedNetworkImage(
            cacheManager: customCacheManeger,
            imageUrl: url1,
            key: UniqueKey(),
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => Icon(Icons.error)),
        CachedNetworkImage(
            cacheManager: customCacheManeger,
            imageUrl: url2,
            key: UniqueKey(),
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => Icon(Icons.error)),
      ]));

  Widget normalImage() => Container(
      height: 200,
      child: Row(children: [
        Image.network(url1, fit: BoxFit.cover, key: UniqueKey()),
        Image.network(url2, fit: BoxFit.cover, key: UniqueKey())
      ]));
}
