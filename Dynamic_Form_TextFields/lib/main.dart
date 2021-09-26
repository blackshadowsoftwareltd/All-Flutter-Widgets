import 'package:dynamic_forms/model.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  UserModel userModel = UserModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userModel.emails = List<String>.empty(growable: true);
    userModel.emails!.add('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Dynamic Form Field')),
        body: Container(
            width: double.infinity,
            child: Form(
                key: globalKey,
                child: SingleChildScrollView(
                    child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          decoration: InputDecoration(hintText: 'User name'),
                          validator: (text) {
                            if (text!.isEmpty) {
                              return 'Usernam can\'t be empty';
                            } else
                              return null;
                          },
                          onSaved: (text) {
                            this.userModel.userName = text;
                          },
                          initialValue: userModel.userName ?? '')),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          decoration: InputDecoration(hintText: 'Age'),
                          validator: (text) {
                            if (text!.isEmpty) {
                              return 'Age can\'t be empty';
                            } else
                              return null;
                          },
                          onSaved: (text) {
                            this.userModel.age = int.tryParse(text!);
                          },
                          initialValue: userModel.age.toString())),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Emails')),
                  ListView.separated(
                      shrinkWrap: true,
                      itemCount: userModel.emails!.length,
                      separatorBuilder: (context, index) => Divider(height: 5),
                      itemBuilder: (context, index) =>
                          Column(children: [zEmail(index)])),
                  ElevatedButton(
                      onPressed: () {
                        if (isValidate()) print(userModel.toJson());
                      },
                      child: Text('Save'))
                ])))));
  }

  ///
  Widget zEmail(index) => Container(
      width: double.infinity,
      padding: EdgeInsets.all(5),
      child: Row(children: [
        Flexible(
            child: TextFormField(
                decoration: InputDecoration(hintText: 'Email'),
                validator: (text) {
                  if (text!.isEmpty) {
                    return 'Email ${index + 1} can\'t be empty';
                  } else
                    return null;
                },
                onSaved: (text) {
                  userModel.emails![index] = text!;
                },
                initialValue: userModel.emails![index])),
        if (index == userModel.emails!.length - 1)
          IconButton(onPressed: addEmail, icon: Icon(Icons.add)),
        if (index > 0)
          IconButton(
              onPressed: () => deleteEmail(index), icon: Icon(Icons.delete))
      ]));

  ///
  void addEmail() => setState(() => userModel.emails!.add(''));
  void deleteEmail(index) => setState(() {
        if (userModel.emails!.length > 1) {
          userModel.emails!.removeAt(index);
        }
      });

  ///
  bool isValidate() {
    final form = globalKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else
      return false;
  }
}
