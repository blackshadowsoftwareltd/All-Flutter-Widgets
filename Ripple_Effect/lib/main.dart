import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  String url =
      'https://images.unsplash.com/photo-1582882055950-4e7b76d9ce84?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDEwfHJuU0tESHd3WVVrfHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ripple Effect')),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(

                /// highlightColor must ve transparent. so we should use withOpacity
                highlightColor: Colors.red.withOpacity(.5),
                splashColor: Colors.green[100],

                /// InkWell also hase borderRadius and customBorder:StatiumBorder property
                borderRadius: BorderRadius.circular(10),
                onTap: () {},
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text('This is Button'))),
            InkResponse(
              /// highlightColor must ve transparent. so we should use withOpacity
              highlightColor: Colors.red.withOpacity(.5),
              splashColor: Colors.green[100],
              child:
                  Container(padding: EdgeInsets.all(5), child: Icon(Icons.add)),
              onTap: () {},
            ),
            Ink.image(
              image: NetworkImage(url),
              fit: BoxFit.cover,
              height: 100,
              width: 100,
              child: InkWell(
                /// highlightColor must ve transparent. so we should use withOpacity
                highlightColor: Colors.red.withOpacity(.5),
                splashColor: Colors.green.withOpacity(.5),

          
                onTap: () {},
              ),
            ),

            /// if Container has color. splashColor not working. so wrap the InkWell with the Material Widget and then wrap with a Container give it a color
            Container(
              color: Colors.green,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  /// highlightColor must ve transparent. so we should use withOpacity
                  highlightColor: Colors.red.withOpacity(.5),
                  splashColor: Colors.blue,
                        /// InkWell also hase borderRadius and customBorder:StatiumBorder property
                customBorder: StadiumBorder(),
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        'Material Wieget Button',
                        style: TextStyle(color: Colors.white),
                      )),
                  onTap: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
