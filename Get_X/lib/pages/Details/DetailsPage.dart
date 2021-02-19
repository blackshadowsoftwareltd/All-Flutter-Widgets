import 'package:Get_X/Services/AllApiServeces.dart';
import 'package:Get_X/pages/Home/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final dataFetched = Get.find<ApiServices>();
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    print(dataFetched.fetchData());
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Get.back();
              }),
          title: Text('Details Page')),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Obx(
                  () => Text('${homeController.value} Minus'),
                ),
                onPressed: () {
                  homeController.decrement();
                })
          ],
        ),
      ),
    );
  }
}
