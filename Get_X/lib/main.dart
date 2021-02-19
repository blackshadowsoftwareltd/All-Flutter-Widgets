import 'package:Get_X/pages/Details/DetailsBind.dart';
import 'package:Get_X/pages/Details/DetailsPage.dart';
import 'package:Get_X/pages/Home/HomeBinding.dart';
import 'package:Get_X/pages/Home/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(GetMaterialApp(
      home: HomePage(),
      getPages: [
        GetPage(name: '/home', page: () => HomePage(), binding: HomeBind()),
        GetPage(
            name: '/details',
            page: () => DetailsPage(),
            binding: DetailsBaind())
      ],
    ));
