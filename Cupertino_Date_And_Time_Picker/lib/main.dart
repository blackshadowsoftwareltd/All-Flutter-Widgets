import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Cupertino Date & Time Picker')),
        body: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  OutlinedButton(
                      child: Text('Pick time'),
                      onPressed: () => showCupertinoModalPopup(
                          context: context,
                          builder: (context) => CupertinoActionSheet(
                              actions: [datePicker()],
                              cancelButton: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    OutlinedButton(
                                        child: Text('Done'),
                                        onPressed: () => Navigator.pop(context))
                                  ])))),
                  Text(
                      '${_dateTime.day ?? ''}/${_dateTime.month ?? ''}/${_dateTime.year ?? ''}'),
                  OutlinedButton(
                      child: Text('data Time Picker'),
                      onPressed: () => showCupertinoModalPopup(
                          context: context,
                          builder: (context) => CupertinoActionSheet(
                              actions: [dataTimePicker()],
                              cancelButton: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    OutlinedButton(
                                        child: Text('Done'),
                                        onPressed: () => Navigator.pop(context))
                                  ])))),
                  Text(
                      '${_dateTime.minute ?? ''}:${_dateTime.hour ?? ''}:${_dateTime.weekday ?? ''}'),
                  OutlinedButton(
                      child: Text('time Picker'),
                      onPressed: () => showCupertinoModalPopup(
                          context: context,
                          builder: (context) => CupertinoActionSheet(
                              actions: [timePicker()],
                              cancelButton: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    OutlinedButton(
                                        child: Text('Done'),
                                        onPressed: () => Navigator.pop(context))
                                  ])))),
                  Text(
                      '${_dateTime.hour ?? ''}:${_dateTime.minute ?? ''}:${_dateTime.hour ?? ''}')
                ])));
  }

  Widget datePicker() => SizedBox(
        height: 250,
        child: CupertinoDatePicker(
          initialDateTime: _dateTime,
          mode: CupertinoDatePickerMode.date,
          backgroundColor: Colors.white,
          minimumYear: 2010,
          maximumYear: DateTime.now().year,
          onDateTimeChanged: (dateTime) => setState(() => _dateTime = dateTime),
        ),
      );

  Widget dataTimePicker() => SizedBox(
        height: 250,
        child: CupertinoDatePicker(
          use24hFormat: false,
          initialDateTime: _dateTime,
          mode: CupertinoDatePickerMode.dateAndTime,
          backgroundColor: Colors.white,
          minimumYear: 2010,
          maximumYear: DateTime.now().year,
          onDateTimeChanged: (dateTime) => setState(() => _dateTime = dateTime),
        ),
      );

  Widget timePicker() => SizedBox(
        height: 250,
        child: CupertinoDatePicker(
          initialDateTime: _dateTime,
          mode: CupertinoDatePickerMode.time,
          backgroundColor: Colors.white,
          use24hFormat: true,
          minimumYear: DateTime.now().hour,
          maximumYear: DateTime.now().year,
          onDateTimeChanged: (dateTime) => setState(() => _dateTime = dateTime),
        ),
      );
}
