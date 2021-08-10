import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_version/new_version.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    checkVersion();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void checkVersion() async {
    final newVersion = NewVersion(
      androidId: 'com.blackshadowsoftware.ktmwallpaper',
    );

    /// only notify the users.
    // newVersion.showAlertIfNecessary(context: context);

    final status = await newVersion.getVersionStatus().then((value) {
      if (value!.localVersion != value.storeVersion) {
        print(
            'Local version: ${value.localVersion} Store version: ${value.storeVersion}');

        ///
        newVersion.showUpdateDialog(
            context: context,
            versionStatus: value,
            dialogTitle: 'Please Update',
            dialogText:
                'Your App needs an update. you must need to update this App to use.\nCurrent version is ${value.localVersion}. Store version is ${value.storeVersion}',

            ///
            updateButtonText: 'Update now',

            ///
            dismissButtonText: 'Close App',
            allowDismissal: false
            // dismissAction: () => SystemNavigator.pop(),
            );
      }
    });
  }
}
