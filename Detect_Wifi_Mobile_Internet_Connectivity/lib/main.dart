import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(home: HomePage()),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(5), elevation: 5),
          child: Text('Check Connection',
              style: TextStyle(fontSize: 20, color: Colors.white)),
          onPressed: () async {
            final result = await Connectivity().checkConnectivity();
            showConnectivitySnackBar(result);
          },
        ),
      ),
    );
  }

  showConnectivitySnackBar(ConnectivityResult result) {
    final hasInternet = result != ConnectivityResult.none;
    final snackMessage = hasInternet
        ? 'You have again ${result.toString()}'
        : 'You have no Internet';
    final snackColor = hasInternet ? Colors.green : Colors.red;
    print(snackMessage);
    Utils.showTopSnackBar(context, snackMessage, snackColor);
  }
}

class Utils {
  static void showTopSnackBar(
          BuildContext context, String message, Color color) =>
      showSimpleNotification(Text('Internet Connectivity Update'),
          subtitle: Text(
            message,
            style: TextStyle(fontSize: 20),
          ),
          background: color);
}
