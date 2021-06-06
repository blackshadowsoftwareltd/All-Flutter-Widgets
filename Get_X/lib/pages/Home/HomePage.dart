import 'package:Get_X/Services/AllApiServeces.dart';
import 'package:Get_X/pages/Details/DetailsPage.dart';
import 'package:Get_X/pages/Home/HomeBinding.dart';
import 'package:Get_X/pages/Home/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBind homeBind = HomeBind();
  final homeController = Get.put(HomeController());
  final apiServicesController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    // print(dataFetching.fetchData());
    return Scaffold(
        appBar: AppBar(title: Text('HomePage')),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text('Details Page'),
                  onPressed: () {
                    Get.toNamed('/details');
                  }),
              FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Obx(
                    () => Text('${homeController.value} Plus'),
                  ),
                  onPressed: () {
                    homeController.increment();
                  }),
              FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text('Simple Dialog'),
                  onPressed: () {
                    Get.defaultDialog(
                      backgroundColor: Colors.grey[900],
                      title: 'Title',
                      titleStyle: TextStyle(color: Colors.white),
                      middleText: 'Middle Text',
                      middleTextStyle: TextStyle(color: Colors.white),

                      confirm: FlatButton(
                          onPressed: () => Get.back(),
                          child: Text(
                            'OK',
                            style: TextStyle(color: Colors.white),
                          )),
                    );
                  }),
              FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text('Simple SnackBar'),
                  onPressed: () {
                    Get.snackbar('title', 'message',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.grey[200],
                        margin: EdgeInsets.all(10),
                        duration: Duration(seconds: 3),
                        icon: Icon(Icons.home),
                        borderWidth: .5,
                        borderColor: Colors.black,
                        colorText: Colors.grey[600],
                        titleText: Text(
                          'Title Text',
                          textAlign: TextAlign.justify,
                          style: TextStyle(color: Colors.black),
                        ),
                        onTap: (snack) => print('Snack Bar'),
                        showProgressIndicator: true,
                        isDismissible: false,
                        messageText: Text('Message Text'));
                  }),
            ],
          ),
        ));
  }
}
