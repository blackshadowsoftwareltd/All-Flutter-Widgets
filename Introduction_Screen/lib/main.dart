import 'package:Introduction_Screen/homePage.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MaterialApp(home: Home()));
bool isSplash;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Preferenced();
  }

  void Preferenced() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    SplashPage = preferences.getBool('isSplash') ?? true;
  }

  bool SplashPage = true;

  @override
  Widget build(BuildContext context) {
    return SplashPage ? Splash() : HomePage();
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
            title: 'First Page',
            body: 'This is The First Pages',
            image: Image.asset(
              'images/demo1.png',
              fit: BoxFit.cover,
              // width: MediaQuery.of(context).size.width - 20,
              // height: MediaQuery.of(context).size.height - 50,
            ),
            decoration: const PageDecoration(pageColor: Colors.white)),
        PageViewModel(
            title: 'Second Page',
            body: 'This is The Second Pages',
            image: Image.asset(
              'images/demo6.png',
              fit: BoxFit.cover,
              // width: MediaQuery.of(context).size.width - 20,
              // height: MediaQuery.of(context).size.height - 50,
            ),
            decoration: const PageDecoration(pageColor: Colors.white)),
        PageViewModel(
            title: 'Third Page',
            body: 'This is The Third Pages',
            image: Image.asset(
              'images/demo7.png',
              fit: BoxFit.cover,
              // width: MediaQuery.of(context).size.width - 20,
              // height: MediaQuery.of(context).size.height - 50,
            ),
            decoration: const PageDecoration(pageColor: Colors.white))
      ],
      onDone: () {
        NavigatDataSplash();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      },
      dotsDecorator: DotsDecorator(
          activeSize: Size(25, 15),
          size: Size(15, 15),
          activeColor: Colors.deepOrange,
          color: Colors.grey,
          spacing: EdgeInsets.symmetric(horizontal: 2),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)))),
      done: Text('Done'),
      skip: Text('Skip'),
      showSkipButton: true,
      showNextButton: true,
    );
  }

  NavigatDataSplash() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool data = await preferences.setBool('isSplash', false);
    isSplash = preferences.getBool('isSplash');
    print(isSplash);
  }
}
