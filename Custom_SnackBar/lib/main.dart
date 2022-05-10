// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _title = 'Message Title';
    const _subtitle = 'This is Message Subtitle';
    return Scaffold(
        appBar: AppBar(title: const Text('Custom Snack bar')),
        body: Center(
            child: OutlinedButton(
                child: const Text('Show Message'),
                onPressed: () {
                  ///? Showing Snackbar
                  showSnackMessage(
                      context: context,
                      onPressed: () {
                        print('Pressed');
                      },
                      title: _title,
                      subTitle: _subtitle);
                })));
  }
}

showSnackMessage(
        {required context,
        required VoidCallback onPressed,
        required String title,
        required String? subTitle}) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 10),
        dismissDirection: DismissDirection.horizontal,
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: InkWell(
          onTap: onPressed,
          child: SizedBox(
            height: 60,
            width: MediaQuery.of(context).size.width,
            child: Stack(children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  margin: const EdgeInsets.only(right: 10),
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey.shade800,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            spreadRadius: 0,
                            offset: Offset(5, 8))
                      ]),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _text(title, 14),
                        if (subTitle != null) _text(subTitle, 12)
                      ])),
              Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                    child: Transform.rotate(
                        angle: 150,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey.shade800,
                                  borderRadius: BorderRadius.circular(6)),
                              child: Transform.rotate(
                                  angle: 150,
                                  child: const Icon(Icons.close,
                                      size: 22, color: Colors.red)),
                            ))),
                  )),
            ]),
          ),
        )));
Widget _text(String message, double size) => Flexible(
    child: Text(message,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: size)));
