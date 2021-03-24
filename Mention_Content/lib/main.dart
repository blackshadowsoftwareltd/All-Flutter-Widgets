import 'package:flutter/material.dart';
import 'package:instagram_mention/instagram_mention.dart';

void main() => runApp(MaterialApp(home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Mention Content')),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InstagramMention(

                /// height & width for the triangle shap. not for overall shap
                triangleHeight: 15,
                triangleWidth: 10,
                // margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(10),
                color: Colors.grey[900],
                shadow: 5,
                radius: 15,
                triangleRadius: 2,

                /// must need text
                text: 'Mention Widgets',
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400)),
            InstagramMentionWithAvatar(
              color: Colors.grey[900],
              // margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              radius: 10,
              triangleRadius: 2,
              triangleHeight: 15,
              triangleWidth: 10,
              shadow: 5,
              image: Image.network(
                  'https://scontent.fdac8-1.fna.fbcdn.net/v/t1.0-9/95451688_2600716343539333_5218454512397713408_o.jpg?_nc_cat=109&ccb=1-3&_nc_sid=e3f864&_nc_eui2=AeECaKcNMUeibcriXy2DWCMY8C5yaVVrsK_wLnJpVWuwrxfQ0WrqGCT3uzvbhQyUMJU6A8PinOmr_kcVZDddbHeM&_nc_ohc=p-G2SScn1BgAX976s6q&_nc_ht=scontent.fdac8-1.fna&oh=6a461fb469539f4466532ef78a19945c&oe=606E4755'),
              imageRadius: 30,
              spaceBetween: 5,

              text: 'Remon Ahammad',
              textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
