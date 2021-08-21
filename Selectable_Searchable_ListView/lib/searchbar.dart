import 'package:flutter/material.dart';

class SearchWidgets extends StatelessWidget {
  final String text, hintText;
  final ValueChanged<String> onChangedCallBack;

  const SearchWidgets(
      {Key? key,
      required this.text,
      required this.hintText,
      required this.onChangedCallBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: TextField(
            onChanged: (value) => onChangedCallBack(value),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                hintText: hintText)));
  }
}
