import 'package:Gmail_OTP/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:email_auth/email_auth.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  TextEditingController mailController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('E-Mail OTP verification')),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(
                flex: 2,
              ),
              TextField(
                  controller: mailController,
                  decoration: InputDecoration(
                      hintText: 'G-Mail',
                      labelText: 'Enter your G-Mail address')),
              FlatButton(
                child: Text('Send OTP to this Mail'),
                onPressed: () => sendOTP(),
              ),
              Spacer(
                flex: 1,
              ),
              TextField(
                  controller: otpController,
                  decoration: InputDecoration(
                      hintText: 'OTP', labelText: 'Enter your OTP')),
              FlatButton(
                child: Text('Check OTP'),
                onPressed: () => verifiOTP(),
              ),
              Spacer(
                flex: 2,
              )
            ],
          ),
        ));
  }

  void sendOTP() async {
    EmailAuth.sessionName = 'Test OTP';
    var response = await EmailAuth.sendOtp(receiverMail: mailController.text);
    if (response)
      print('OTP Success\n$response');
    else
      print('OTP sending failed');
  }

  void verifiOTP() async {
    var response = EmailAuth.validate(
        receiverMail: mailController.text, userOTP: otpController.text);
    if (response) {
      print('Success to Verifi OTP\nNavigateing');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else
      print('Oops!\nFailed verification try again letter');
  }
}
