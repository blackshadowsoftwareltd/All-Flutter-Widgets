import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List imgList = [
    'images/bd.png',
    'images/pakistan.png',
    'images/iran.png',
    'images/indonesia.png',
    'images/germany.png',
    'images/seol.png',
    'images/london.png',
    'images/america.png',
    'images/australia.png'
  ];
  double _width;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            CarouselSlider(
                items: imgList.map((img) => flagContainer(img)).toList(),
                options: CarouselOptions(
                    viewportFraction: 1,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    autoPlayAnimationDuration: Duration(seconds: 1),
                    autoPlayInterval: Duration(seconds: 2),
                    aspectRatio: 16 / 9,
                    initialPage: 0,
                    scrollDirection: Axis.horizontal))
          ],
        ),
      ),
    );
  }

  Widget flagContainer(String img) => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 5, color: Colors.grey[300])),
        margin: EdgeInsets.all(5),
        // width: _width -50,
        // height: 250,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(17),
          child: Image.asset(
            img,
            fit: BoxFit.cover,
          ),
        ),
      );
}
