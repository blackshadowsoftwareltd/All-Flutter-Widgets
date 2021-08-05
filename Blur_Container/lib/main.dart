import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String img1 =
        'https://images.unsplash.com/photo-1627656755357-b4650cc527c2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=80';
    String img2 =
        'https://images.unsplash.com/photo-1627631243787-c08a0a68cf5b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80';
    return Scaffold(
        appBar: AppBar(),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.grey[50],
            child: Stack(children: [
              Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Image.network(img2, fit: BoxFit.cover)),
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 150, horizontal: 50),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: Colors.white.withOpacity(.5), width: .5)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(color: Colors.transparent)))))
            ])));
  }
}
