import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('App Settings')),
        body: SingleChildScrollView(
            child: SizedBox(
                width: double.infinity,
                child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      buttonsz(context, 'App Settings',
                          () => AppSettings.openAppSettings()),
                      buttonsz(context, 'Device Settings',
                          () => AppSettings.openDeviceSettings()),
                      buttonsz(context, 'Location Settings',
                          () => AppSettings.openLocationSettings()),
                      buttonsz(context, 'Notification Settings',
                          () => AppSettings.openNotificationSettings()),
                      buttonsz(context, 'WiFi Settings',
                          () => AppSettings.openWIFISettings()),
                      buttonsz(context, 'Bluetooth Settings',
                          () => AppSettings.openBluetoothSettings()),
                      buttonsz(context, 'NFC Settings',
                          () => AppSettings.openNFCSettings()),
                      buttonsz(context, 'VPN Settings',
                          () => AppSettings.openVPNSettings()),
                      buttonsz(context, 'Security Settings',
                          () => AppSettings.openSecuritySettings()),
                      buttonsz(context, 'Data Roaming Settings',
                          () => AppSettings.openDataRoamingSettings()),
                      buttonsz(context, 'Display Settings',
                          () => AppSettings.openDisplaySettings()),
                      buttonsz(context, 'Date Time Settings',
                          () => AppSettings.openDateSettings()),
                      buttonsz(context, 'Sound Settings',
                          () => AppSettings.openSoundSettings()),
                      buttonsz(context, 'Storage Settings',
                          () => AppSettings.openInternalStorageSettings()),
                      buttonsz(context, 'Battery Optimization Settings',
                          () => AppSettings.openBatteryOptimizationSettings())
                    ]))));
  }

  Widget buttonsz(context, String label, VoidCallback onPressed) => Padding(
        padding: const EdgeInsets.all(4),
        child: FloatingActionButton.extended(
            onPressed: onPressed, label: Text(label)),
      );
}
