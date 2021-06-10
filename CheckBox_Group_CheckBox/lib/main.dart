import 'package:flutter/material.dart';
import 'package:check/model/checkBoxState.dart';

void main() => runApp(MaterialApp(
      home: Home(),
      theme:
          ThemeData.dark().copyWith(unselectedWidgetColor: Colors.green[300]),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final selectAll = CheckBoxState(title: 'Select All');
  final notification = [
    CheckBoxState(title: 'School'),
    CheckBoxState(title: 'College'),
    CheckBoxState(title: 'University'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('')),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          groupCheckBox(selectAll),
          Divider(height: 5, color: Colors.white),
          ...notification.map(singleCheckBox).toList()
        ],
      ),
    );
  }

  Widget singleCheckBox(CheckBoxState checkBoxState) => CheckboxListTile(
      activeColor: Colors.purple,

      /// If we want to change the unchecked box color. we need some change to Material widget ThemeDataf property.

      value: checkBoxState.value,

      /// this controlAffinity will change the position each other. left to right
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(
        checkBoxState.title,
        style: TextStyle(color: Colors.white),
      ),
      onChanged: (value) {
        checkBoxState.value = value;

        /// if every notification is selected or not selected parent check box will be change
        selectAll.value =
            notification.every((notification) => notification.value);

        /// must need setState((){})
        setState(() {});
      });

  Widget groupCheckBox(CheckBoxState checkBoxState) => CheckboxListTile(
      activeColor: Colors.purple,

      /// If we want to change the unchecked box color. we need some change to Material widget ThemeDataf property.

      value: checkBoxState.value,

      /// this controlAffinity will change the position each other. left to right
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(checkBoxState.title, style: TextStyle(color: Colors.white)),
      onChanged: toggleGroupCheckBox);
  void toggleGroupCheckBox(bool value) {
    if (value == null) return;
    selectAll.value = value;

    /// if parent check box is selected? all notification checkbox will be selected
    notification.forEach((notification) => notification.value = value);

    /// must need setState((){})
    setState(() {});
  }
}
