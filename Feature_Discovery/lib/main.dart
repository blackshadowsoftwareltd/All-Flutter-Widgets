import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    home: FeatureDiscovery(

        /// recordStepsInSharedPreferences: true ? automatic save
        recordStepsInSharedPreferences: false,
        child: HomePage())));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      FeatureDiscovery.discoverFeatures(
          context, <String>['menu', 'floatButton']);
    });
  }

  var _overflowMode = OverflowMode.extendBackground;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Feature discovery'),
            leading: DescribedFeatureOverlay(
                featureId: 'menu',
                title: Text('Menu Button'),
                description: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('This is the menu Descriptions'),
                    FlatButton(
                        child: Text(
                          'Finish',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        onPressed: () {
                          print('Finished');
                          /// Dismiss all Feature
                          FeatureDiscovery.dismissAll(context);
                        })
                  ],
                ),
                targetColor: Colors.blue,
                textColor: Colors.white,
                backgroundColor: Colors.lightBlueAccent,

                /// text position from the button
                contentLocation: ContentLocation.below,
                pulseDuration: Duration(seconds: 3),
                openDuration: Duration(seconds: 2),
                tapTarget: Icon(Icons.menu, color: Colors.white),
                enablePulsingAnimation: true,

                /// if false? continue
                barrierDismissible: false,
                overflowMode: _overflowMode,
                child: IconButton(
                    icon: Icon(Icons.menu, color: Colors.white),
                    onPressed: () {}))),
        floatingActionButton: DescribedFeatureOverlay(
            featureId: 'floatButton',
            title: Text('Floating Action Button'),
            description: Text('This is the most useful button'),
            targetColor: Colors.deepOrange,
            textColor: Colors.white,
            backgroundColor: Colors.deepOrangeAccent,

            /// text position from the button
            contentLocation: ContentLocation.above,
            pulseDuration: Duration(seconds: 3),
            openDuration: Duration(seconds: 2),
            tapTarget: Icon(Icons.smartphone, size: 25, color: Colors.white),
            enablePulsingAnimation: true,

            /// if true? dismissed
            barrierDismissible: false,
            overflowMode: OverflowMode.extendBackground,
            child: FloatingActionButton(
                backgroundColor: Colors.deepOrange,
                child: Icon(Icons.smartphone, color: Colors.white),
                onPressed: () => print('\npressed'))));
  }
}
