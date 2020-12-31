import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String brand,
      id,
      androidId,
      board,
      bootloader,
      device,
      display,
      fingerprint,
      manufacturer,
      model,
      host,
      product,
      tags,
      type,
      hardware;
  var version,
      supported32BitAbis,
      supported64BitAbis,
      supportedAbis,
      systemFeatures;

  bool isPhysicalDevice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            Text('\nbrand : $brand'),
            Text('\nid : $id'),
            Text('\nandroidId : $androidId'),
            Text('\nboard : $board'),
            Text('\nbootloader : $bootloader'),
            Text('\ndevice : $device'),
            Text('\ndisplay : $display'),
            Text('\nfingerprint : $fingerprint'),
            Text('\nhardware : $hardware'),
            Text('\nhost : $host'),
            Text('\nmanufacturer : $manufacturer'),
            Text('\nmodel : $model'),
            Text('\nproduct : $product'),
            Text('\ntags : $tags'),
            Text('\ntype : $type'),
            Text('\nversion : $version'),
            Text('\nisPhysicalDevice : $isPhysicalDevice'),
            Text('\nsupported32BitAbis : $supported32BitAbis'),
            Text('\nsupported64BitAbis : $supported64BitAbis'),
            Text('\nsupportedAbis : $supportedAbis'),
            Text('\nsystemFeatures : $systemFeatures'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(
          Icons.info,
          color: Colors.white,
        ),
        onPressed: () async {
          AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
          setState(() {
            brand = androidInfo.brand;
            id = androidInfo.id;
            androidId = androidInfo.androidId;
            board = androidInfo.board;
            bootloader = androidInfo.bootloader;
            device = androidInfo.device;
            display = androidInfo.display;
            fingerprint = androidInfo.fingerprint;
            hardware = androidInfo.hardware;
            host = androidInfo.host;
            manufacturer = androidInfo.manufacturer;
            model = androidInfo.model;
            product = androidInfo.product;
            tags = androidInfo.tags;
            type = androidInfo.type;
            version = androidInfo.version;
            isPhysicalDevice = androidInfo.isPhysicalDevice;
            supported32BitAbis = androidInfo.supported32BitAbis;
            supported64BitAbis = androidInfo.supported64BitAbis;
            supportedAbis = androidInfo.supportedAbis;
            systemFeatures = androidInfo.systemFeatures;
          });
        },
      ),
    );
  }
}
