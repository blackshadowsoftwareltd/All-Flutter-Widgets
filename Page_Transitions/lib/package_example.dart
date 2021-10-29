
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue,
//       appBar: AppBar(
//         title: Text('Page Transition'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               child: Text('Fade Second Page - Default'),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   PageTransition(
//                     type: PageTransitionType.fade,
//                     child: SecondPage(),
//                   ),
//                 );
//               },
//             ),
//             ElevatedButton(
//               child: Text('Left To Right Transition Second Page'),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   PageTransition(
//                     type: PageTransitionType.leftToRight,
//                     child: SecondPage(),
//                   ),
//                 );
//               },
//             ),
//             ElevatedButton(
//               child: Text('Left To Right with Fade Transition Second Page'),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   PageTransition(
//                     type: PageTransitionType.leftToRightWithFade,
//                     alignment: Alignment.topCenter,
//                     child: SecondPage(),
//                   ),
//                 );
//               },
//             ),
//             ElevatedButton(
//               child: Text('Right To Left Transition Second Page'),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   PageTransition(
//                     type: PageTransitionType.rightToLeft,
//                     child: SecondPage(),
//                   ),
//                 );
//               },
//             ),
//             ElevatedButton(
//               child: Text('Right To Left with Fade Transition Second Page'),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   PageTransition(
//                     type: PageTransitionType.rightToLeftWithFade,
//                     child: SecondPage(),
//                   ),
//                 );
//               },
//             ),
//             ElevatedButton(
//               child: Text('Top to Bottom Second Page'),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   PageTransition(
//                     curve: Curves.linear,
//                     type: PageTransitionType.topToBottom,
//                     child: SecondPage(),
//                   ),
//                 );
//               },
//             ),
//             ElevatedButton(
//               child: Text('Bottom to Top Second Page'),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   PageTransition(
//                     curve: Curves.linear,
//                     type: PageTransitionType.bottomToTop,
//                     child: SecondPage(),
//                   ),
//                 );
//               },
//             ),
//             ElevatedButton(
//               child: Text('Scale Transition Second Page'),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   PageTransition(
//                     curve: Curves.linear,
//                     type: PageTransitionType.scale,
//                     alignment: Alignment.topCenter,
//                     child: SecondPage(),
//                   ),
//                 );
//               },
//             ),
//             ElevatedButton(
//               child: Text('Rotate Transition Second Page'),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   PageTransition(
//                     curve: Curves.bounceOut,
//                     type: PageTransitionType.rotate,
//                     alignment: Alignment.topCenter,
//                     child: SecondPage(),
//                   ),
//                 );
//               },
//             ),
//             ElevatedButton(
//               child: Text('Size Transition Second Page'),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   PageTransition(
//                     alignment: Alignment.bottomCenter,
//                     curve: Curves.bounceOut,
//                     type: PageTransitionType.size,
//                     child: SecondPage(),
//                   ),
//                 );
//               },
//             ),
//             ElevatedButton(
//               child: Text('Right to Left Joined'),
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     PageTransition(
//                         alignment: Alignment.bottomCenter,
//                         curve: Curves.easeInOut,
//                         duration: Duration(milliseconds: 600),
//                         reverseDuration: Duration(milliseconds: 600),
//                         type: PageTransitionType.rightToLeftJoined,
//                         child: SecondPage(),
//                         childCurrent: this));
//               },
//             ),
//             ElevatedButton(
//               child: Text('Left to Right Joined'),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   PageTransition(
//                       alignment: Alignment.bottomCenter,
//                       curve: Curves.easeInOut,
//                       duration: Duration(milliseconds: 600),
//                       reverseDuration: Duration(milliseconds: 600),
//                       type: PageTransitionType.leftToRightJoined,
//                       child: SecondPage(),
//                       childCurrent: this),
//                 );
//               },
//             ),
//             ElevatedButton(
//               child: Text('PushNamed With arguments'),
//               onPressed: () {
//                 Navigator.pushNamed(
//                   context,
//                   "/second",
//                   arguments: "with Arguments",
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// ///Example second page
// class SecondPage extends StatelessWidget {
//   /// Page Title
//   final String? title;

//   /// second page constructor
//   const SecondPage({this.title});
//   @override
//   Widget build(BuildContext context) {
//     final args = ModalRoute.of(context)!.settings.arguments;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Page Transition Plugin"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text('Second Page'),
//             SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   PageTransition(
//                     duration: Duration(milliseconds: 300),
//                     reverseDuration: Duration(milliseconds: 300),
//                     type: PageTransitionType.topToBottom,
//                     child: ThirdPage(),
//                   ),
//                 );
//               },
//               child: Text('Go Third Page'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// /// third page
// class ThirdPage extends StatelessWidget {
//   /// Page Title
//   final String? title;

//   const ThirdPage({Key? key, this.title}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Page Transition Plugin"),
//       ),
//       body: Center(
//         child: Text('ThirdPage Page'),
//       ),
//     );
//   }
// }
