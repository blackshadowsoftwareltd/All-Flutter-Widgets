import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /// ignore: prefer_final_fields
  DateTimeRange _dateTimeRange = DateTimeRange(
      start: DateTime.now().add(const Duration(days: 1)),
      end: DateTime.now().add(const Duration(days: 3)));

  ///
  DateTimeRange? _newDateTimeRang;

  ///
  @override
  Widget build(BuildContext context) {
    _newDateTimeRang = _newDateTimeRang ?? _dateTimeRange;

    final _defference = _newDateTimeRang != null
        ? _newDateTimeRang!.duration.inDays
        : _dateTimeRange.duration.inDays;

    ///
    return Scaffold(
        appBar: AppBar(title: const Text('Date Time Range Picker')),

        ///
        body: SizedBox(
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  /// Defference
                  Text('Defference : ' + _defference.toString() + ' Days',
                      style: _style),

                  ///
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        /// Start Date
                        Text(
                            DateFormat('yyyy/MM/dd')
                                .format(_newDateTimeRang!.start),
                            style: _style),

                        ///
                        Text('To', style: _style),

                        /// End
                        Text(
                            DateFormat('yyyy/MM/dd')
                                .format(_newDateTimeRang!.end),
                            style: _style)
                      ]),

                  /// Date Time Picker Button
                  OutlinedButton(
                      onPressed: () async {
                        final _pickedDateTimeRange = await showDateRangePicker(
                            context: context,
                            initialDateRange: _dateTimeRange,
                            currentDate: DateTime.now(),
                            firstDate:
                                DateTime.now().add(const Duration(days: 1)),
                            lastDate: DateTime(2050));
                        if (_pickedDateTimeRange == null) {
                          return;
                        }

                        setState(() => _newDateTimeRang = _pickedDateTimeRange);

                        ///
                        print('Start Date : ' +
                            DateFormat('yyyy/MM/dd')
                                .format(_newDateTimeRang!.start) +
                            ' End Date : ' +
                            DateFormat('yyyy/MM/dd')
                                .format(_newDateTimeRang!.end));
                      },
                      child: const Text('Pick Date & Time'))
                ])));
  }

  final _style = const TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      letterSpacing: .5);
}
