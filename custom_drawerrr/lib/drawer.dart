import 'dart:ui';

import 'package:flutter/material.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _radius = 12.0;
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 1500),
      curve: Curves.easeInOutCirc,
      tween: Tween<double>(begin: 0, end: 10),
      onEnd: () {
        print('end');
      },
      builder: (_, double value, __) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: value, sigmaY: value),
          child: SafeArea(
            child: SizedBox(
              width: 250,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.lightGreen.shade100,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(_radius + 5))),
                    child: SizedBox(
                      width: double.infinity,
                      height: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://images.unsplash.com/photo-1653572656708-7a5f7e2c36a1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=724&q=80')),
                          Text('Remon Ahamamd',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(_radius),
                          child: Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Colors.white30,
                                  blurRadius: value + (value),
                                  spreadRadius: 0,
                                  offset: const Offset(0, 0))
                            ]),
                            child: ListView.builder(
                                padding: const EdgeInsets.all(8),
                                itemCount: 15,
                                itemBuilder: (_, i) => _button(i + 1)),
                          ),
                        )),
                  ),
                ]),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _button(int i) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              primary: Colors.white38,
              onPrimary: Colors.lightGreen.shade100,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Text('Button  $i',
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      );
}
