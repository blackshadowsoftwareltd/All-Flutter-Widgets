import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

void main() => runApp(MaterialApp(home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Responsive Text UI')),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _NormalText(),
            _ContainerText(),
            _MaxLineText(),
            _OverFlowText(),
            _FittedBoxText(),
            _AutoSizeText(),
            _OverFlowReplacement(),
            _RichText()
          ],
        ),
      ),
    );
  }

  Widget _NormalText() => Text(
        'This is The Normal Text, This is The Normal Text, This is The Normal Text, This is The Normal Text',
        style: TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
      );

  Widget _ContainerText() => Container(
      height: 20,
      width: 250,
      color: Colors.orange,
      child: Text(
        'This is The Container Text, This is The Container Text, This is The Container Text, This is The Container Text,',
        style: TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
      ));
  Widget _MaxLineText() => Text(
      'This text has Max line 1, This text has Max line 1, This text has Max line 1, This text has Max line 1',

      /// Max Line is 1
      maxLines: 1,
      style: TextStyle(
          fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500));
  Widget _OverFlowText() => Text(
      'This text has TextOverflow.ellipsis, This text has TextOverflow.ellipsis, This text has TextOverflow.ellipsis, This text has TextOverflow.ellipsis',

      /// TextOverflow.ellipsis
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500));
  Widget _FittedBoxText() => Container(
      color: Colors.green,
      height: 50,
      width: MediaQuery.of(context).size.width - 50,
      child: FittedBox(
          child: Text('(rotation)Widgets tree is Container>FittedBox>Text()',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w500))));

  Widget _AutoSizeText() => Container(
      height: 100,
      color: Colors.green,
      child: AutoSizeText(
        '(max line 3)(minFontSize 15)(maxFontSize40). Auto Size Text Package has a lot of proparty, This is a nice package right now Auto Size Text Package has a lot of proparty, This is a nice package right now',
        style: TextStyle(
            fontSize: 30, color: Colors.black, fontWeight: FontWeight.w500),
        minFontSize: 15,
        maxFontSize: 30,
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
      ));
  Widget _OverFlowReplacement() => Container(
      height: 35,
      color: Colors.orange,
      alignment: Alignment.center,
      child: AutoSizeText(
          'Over Flow Replacement, Over Flow Replacement, Over Flow Replacement,',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          minFontSize: 20,
          overflowReplacement: Text('OverFlowReplacement',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500))));
  Widget _RichText() => AutoSizeText.rich(
      TextSpan(
        text: 'Rich ',
        children: [
          TextSpan(text: 'Text ', style: TextStyle(fontSize: 20)),
          TextSpan(
              text:
                  'This is The RichText, This is The RichText, This is The RichText, This is The RichText, This is The RichText, This is The RichText,')
        ],
        style: TextStyle(fontSize: 30),
      ),
      minFontSize: 15,
      maxFontSize: 30,
      maxLines: 1);
}
