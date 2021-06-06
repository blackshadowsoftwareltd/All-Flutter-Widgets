import 'dart:async';

import 'package:flutter/material.dart';
import 'package:battery/battery.dart';

void main() => runApp(MaterialApp(home: HoemPage()));

class HoemPage extends StatefulWidget {
  @override
  _HoemPageState createState() => _HoemPageState();
}

class _HoemPageState extends State<HoemPage> {
  final battery = Battery();
  int batteryLevel = 100;
  Timer timer;

  /// for current Battery state
  StreamSubscription subscription;
  BatteryState currentBatteryState = BatteryState.full;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /// method for battery level
    listernBatteryLevel();

    /// method for battery state
    listenBatteryState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    /// timer
    timer.cancel();

    /// subscription
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Battery Leverl Detector')),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: _batteryIcon(currentBatteryState),
        ));
  }

  Widget _batteryIcon(BatteryState batteryState, ) {
    String _text = 'Full';

    Color _color = Colors.blue;
    Icon _icon = Icon(
      Icons.battery_full,
    );
    if (batteryLevel < 15) {
      _color = Colors.red;
      _text = 'Need Charge';
      _icon = Icon(Icons.battery_alert, size: 200, color: _color);
    } else {
      switch (batteryState) {
        case BatteryState.full:
          _color = Colors.blue;
          _text = 'Full';
          _icon = Icon(Icons.battery_full, size: 200, color: _color);
          break;
        case BatteryState.charging:
          _color = Colors.blue;
          _text = 'Charging...';
          _icon = Icon(Icons.battery_charging_full, size: 200, color: _color);
          break;
        case BatteryState.discharging:
          _color = Colors.green;
          _text = 'Descharging';
          _icon = Icon(Icons.battery_full, size: 200, color: _color);
          break;

        default:
      }
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            _icon,
            Positioned(
                left: 65,
                bottom: 20,
                right: 65,
                child: Text(
                  '$batteryLevel \%',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ))
          ],
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            '$_text',
            style: TextStyle(fontSize: 30),
          ),
        )
      ],
    );
  }

  void listernBatteryLevel() {
    updateBatteryLevel();
    timer =
        Timer.periodic(Duration(seconds: 2), (_) async => updateBatteryLevel());
  }

  Future updateBatteryLevel() async {
    final batteryLevel = await battery.batteryLevel;
    setState(() => this.batteryLevel = batteryLevel);
  }

  void listenBatteryState() => subscription = battery.onBatteryStateChanged
      .listen((currentBatteryState) =>
          setState(() => this.currentBatteryState = currentBatteryState));
}
