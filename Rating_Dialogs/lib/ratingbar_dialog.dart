import 'dart:math';

import 'package:flutter/material.dart';

class RatingBarDialog extends StatefulWidget {
  const RatingBarDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<RatingBarDialog> createState() => _RatingBarDialogState();
}

class _RatingBarDialogState extends State<RatingBarDialog> {
  final _pageController = PageController();
  int _rating = 0;
  bool _isDefault = true;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(children: [
          /// messages
          SizedBox(
              height: max(220, MediaQuery.of(context).size.height * .25),
              child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [const ThanksPage(), RatingPage(rating: _rating)])),

          /// skip button
          Positioned(
              top: 0,
              right: 2,
              child: TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  child: const Text('Skip'),
                  onPressed: () {
                    _pageController.animateToPage(1,
                        duration: const Duration(seconds: 1),
                        curve: Curves.fastOutSlowIn);
                  })),

          /// done button
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                  color: Colors.deepOrange,
                  width: double.infinity,
                  height: 40,
                  child: TextButton(
                      child: const Text('Done',
                          style: TextStyle(
                              fontSize: 17,
                              shadows: [
                                Shadow(
                                    color: Colors.white,
                                    blurRadius: 5,
                                    offset: Offset(0, 0))
                              ],
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      onPressed: () => Navigator.pop(context)))),

          /// star buttons row
          AnimatedPositioned(
              left: 0,
              top: _isDefault ? 120 : 20,
              right: 0,
              bottom: _isDefault ? 20 : 120,
              duration: const Duration(milliseconds: 500),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      5,
                      (index) => _starButton(
                          icon:
                              index < _rating ? Icons.star : Icons.star_border,
                          onPressed: () => setState(() {
                                _isDefault = false;
                                _rating = index + 1;
                                _pageController.animateToPage(1,
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.fastOutSlowIn);
                              })))))
        ]));
  }

  /// star button
  ClipRRect _starButton(
          {required IconData icon, required VoidCallback onPressed}) =>
      ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Material(
              color: Colors.transparent,
              child: InkWell(
                  splashColor: Colors.deepOrange.shade200,
                  onTap: onPressed,
                  child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Icon(icon, color: Colors.deepOrange, size: 30)))));
}

/// thanks page
class ThanksPage extends StatelessWidget {
  const ThanksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text('Thanks for using our services',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange)),
          Text('We\'d love to get your feedback',
              style: TextStyle(color: Colors.black54)),
          Text('How was your feeling today?',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.deepOrange))
        ]);
  }
}

/// rating page
class RatingPage extends StatelessWidget {
  final int rating;

  const RatingPage({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text('You Rated ', style: TextStyle(fontSize: 17)),
          const Icon(Icons.star, color: Colors.deepOrange, size: 30),
          Text(rating.toString() + ' ${rating == 1 ? 'Star' : 'Stars'}',
              style: const TextStyle(fontSize: 17)),
        ])));
  }
}
