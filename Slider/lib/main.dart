import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Slider',
      home: MySlider(),
    ));

class MySlider extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SliderState();
  }
}

class _SliderState extends State<MySlider> {
  double _currentSliderValue = 25;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Remon Ahammad',
            style: TextStyle(fontSize: _currentSliderValue),
          ),
          SizedBox(
            height: 20,
          ),
          Slider(
            min: 10,
            max: 40,
            activeColor: Colors.green,
            inactiveColor: Colors.grey[700],
            value: _currentSliderValue,
            onChanged: (value) {
              setState(() {
                _currentSliderValue = value;
                print(_currentSliderValue);
              });
            },
          )
        ],
      ),
    );
  }
}
