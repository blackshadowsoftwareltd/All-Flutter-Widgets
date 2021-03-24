import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RangeValues values = RangeValues(10, 90);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SliderTheme(
          data: SliderThemeData(

              ///ticks in between /// ...........
              activeTickMarkColor: Colors.transparent,
              inactiveTickMarkColor: Colors.transparent,

              ///track color
              activeTrackColor: Colors.green,
              inactiveTrackColor: Colors.orange,

              ///thumb color
              thumbColor: Colors.purple),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Spacer(flex: 1),
              Text('First one'),
              _RangeSlider(),
              Spacer(flex: 1),
              Text('Second one'),
              _RangeSlider2(),
              Spacer(flex: 1)
            ],
          ),
        ),
      ),
    );
  }

  Widget _RangeSlider() => RangeSlider(
      values: values,
      min: 0,
      max: 100,

      ///active Colors
      activeColor: Colors.green,

      ///inactive Colors
      inactiveColor: Colors.red,

      ///bandwidth
      divisions: 10,
      labels: RangeLabels(
          values.start.round().toString(), values.end.round().toString()),
      onChanged: (values) => setState(() => this.values = values));

  Widget _RangeSlider2() => RangeSlider(
      values: values,
      min: 0,
      max: 100,

      /// SliderTheme will not work when active color and inactive color are null in RangeSlider
      //
      ///bandwidth
      divisions: 10,
      labels: RangeLabels(
          values.start.round().toString(), values.end.round().toString()),
      onChanged: (values) => setState(() => this.values = values));
}
