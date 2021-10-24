import 'package:flutter/material.dart';
import 'package:sms_advanced/sms_advanced.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ///
  List<SmsMessage> messages = [];

  ///
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reciveSms();
    getAllExistingSms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: Column(children: [
          ...messages.map((SmsMessage e) {
            final x = e.state.index;
            return Container(
                margin: const EdgeInsets.all(3),
                padding: const EdgeInsets.all(5),
                width: double.infinity,
                color: Colors.green.shade50,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Index : ' + messages.indexOf(e).toString()),
                      Text('Sender : ' + e.sender.toString()),
                      Text('body : ' + e.body.toString()),
                      Text('address : ' + e.address.toString()),
                      Text('Date : ' + e.date.toString()),
                      Text(
                          'Kind : ${e.kind!.index == 0 ? 'Sent' : e.kind!.index == 1 ? 'Received' : 'Draft'}'),
                      Text(
                          'MessageState : ${x == 0 ? 'Sending' : x == 1 ? 'Sent' : x == 2 ? 'Delivered' : x == 3 ? 'Fail' : 'None'}'),
                    ]));
          }).toList()
        ])));
  }

  reciveSms() {
    ///Receiving SMS
    // SmsReceiver receiver = new SmsReceiver();
    // receiver.onSmsReceived?.listen((SmsMessage msg) => print(msg.body));
  }

  Future<void> getAllExistingSms() async {
    SmsQuery query = new SmsQuery();
    messages.clear();
    messages = await query.getAllSms;
    print(messages.length);
    setState(() {});
  }
}
