import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Bottom Sheet Demo',
      home: BottomSheetDemo(),
    ));

class BottomSheetDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BottomSheetDemoState();
  }
}

class BottomSheetDemoState extends State<BottomSheetDemo> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Model Bottom Sheet')),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            OutlinedButton(
                onPressed: () => showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    context: context,
                    builder: (context) => _bottomSheet()),
                child: Text('Simple Bottom Sheet')),
            OutlinedButton(
                onPressed: () => showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    // enableDrag: true,
                    context: context,
                    builder: (context) =>
                        draggalbleScrollableBottomSheet(context)),
                child: Text('Draggable Scrollable Bottom Sheet'))
          ],
        )));
  }

  Widget _bottomSheet() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.grey[900]),

        // height: 200,
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('Bottom Sheet',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center)),
              ListTile(
                  title:
                      Text('Get Action', style: TextStyle(color: Colors.white)),
                  subtitle: Text('Click here!',
                      style: TextStyle(color: Colors.white)),
                  focusColor: Colors.orange,
                  hoverColor: Colors.amber,
                  trailing: Icon(Icons.call_missed_outgoing,
                      color: Colors.white, size: 25),
                  onTap: () {
                    print('Get Action is clicked');
                  }),
              ListTile(
                  title:
                      Text('Get Action', style: TextStyle(color: Colors.white)),
                  subtitle: Text('Click here!',
                      style: TextStyle(color: Colors.white)),
                  focusColor: Colors.orange,
                  hoverColor: Colors.amber,
                  trailing: Icon(Icons.call_missed_outgoing,
                      color: Colors.white, size: 25),
                  onTap: () {
                    print('Get Action is clicked');
                  }),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                        child: Text('Yes',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        color: Colors.grey[900],
                        elevation: 0,
                        highlightElevation: 0,
                        onPressed: () {}),
                    SizedBox(width: 20),
                    RaisedButton(
                        child: Text('No',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        elevation: 0,
                        highlightElevation: 0,
                        color: Colors.grey[900],
                        onPressed: () {})
                  ])
            ]));
  }

  Widget draggalbleScrollableBottomSheet(BuildContext context) =>
      DraggableScrollableSheet(
        initialChildSize: .4,
        maxChildSize: 1,
        minChildSize: .2,
        builder: (context, controller) => Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.all(5),
          child: ListView(
            controller: controller,
            children: [txt(), txt(), txt(), txt()],
          ),
        ),
      );

  Widget txt() => Text(
      'a;lsidfjl;asmdcvl;asdjfklasdjl;vjasdo;fjasdkl;jflasdjkfklasdjfl asdjkfasdil;fjasdklfjlasdkfjlasdifjasdlkfasdfnjasdl ;ifjlasdkmcvlaksjdf lkajsdvlkcsdjfklasdjfklmasdl cvkasdfjdiojfalskf nmlksnvsdklvnslkdfjlasdjklkanmvclksdnfvl;ksjdfklasdnmklcvasnml;vknksdjfg klasdjf;klasjdfl;masdl;kv nasdkl;fjoaisdjfo;ia dsjfklmasdl;kfjasdl;kf jasdl;fjkal;mcvl;aijds fioljsdlfknmasldkvnasd l;kfjo asdljflasdknmvlkasdnjflkjasdklfjaskl;dj fl;kasjdfl;kasdmcvl;kajdsfo;kjasd;fasdf a;sdfasl;dfjka;soldkfj;asdfj;sdoic vnmalsdkmncvl;sm,nl;d kjxcfl;sdifjl;jasdklfjlm,caslkfj sdikjfoailsejflksdjfcvklasnmfl kjsdlkfjla;sdkfjlaksdnmcvla');
}
