import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            child: Form(
                key: formKey,
                child: Column(children: [
                  Container(
                      padding: EdgeInsets.all(10),
                      child: CupertinoTextFormFieldRow(
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: Colors.black45),
                        placeholder: 'Email',
                        placeholderStyle:
                            TextStyle(color: Colors.grey, fontSize: 15),
                        cursorColor: CupertinoColors.systemGrey2,
                        textInputAction: TextInputAction
                            .next, // this property will work whene the user press on keyboard's done button
                        /// suffix or preffix is not usefull. cause there height and width

                        ///
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            border: Border.all(
                                color: CupertinoColors.systemGrey4, width: .5),
                            borderRadius: BorderRadius.circular(5)),

                        ///
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (email) =>
                            email != null && !EmailValidator.validate(email)
                                ? 'Enter a valid email'
                                : null,
                      )),

                  ///
                  Container(
                      padding: EdgeInsets.all(10),
                      child: CupertinoTextFormFieldRow(
                        style: TextStyle(color: Colors.black45),
                        placeholder: 'Password',
                        placeholderStyle:
                            TextStyle(color: Colors.grey, fontSize: 15),
                        cursorColor: CupertinoColors.systemGrey2,
                        obscureText: true,
                        obscuringCharacter: '*',

                        ///
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            border: Border.all(
                                color: CupertinoColors.systemGrey4, width: .5),
                            borderRadius: BorderRadius.circular(5)),

                        ///
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (password) {
                          if (password == null || password.isEmpty)
                            return 'Enter a valid password';
                          else if (password.length <6)
                            return 'Must be at least 6 characters long';
                          else
                            return null;
                        },
                      )),

                  ///
                  CupertinoButton(
                      child: Text('Check validate'),
                      onPressed: () {
                        final form = formKey.currentState!;
                        if (form.validate())
                          print('Validate');
                        else
                          print('Not Validate');
                      })
                ]))));
  }
}
