import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _state = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Stack(
            children: [
              _appBar(),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerRight,
                child: _animatedContainer(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _animatedContainer() {
    return AnimatedContainer(
      height: _state
          ? MediaQuery.of(context).size.height /3
          : MediaQuery.of(context).size.height,
      width: _state
          ? MediaQuery.of(context).size.width / 3
          : MediaQuery.of(context).size.width,
      color: _state ? Colors.blueGrey[800] : Colors.blueGrey,
      alignment: _state ? Alignment.centerRight : Alignment.center,
      duration: Duration(milliseconds: 300),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: _state ? 200 / 6 : MediaQuery.of(context).size.height / 12,
            width: MediaQuery.of(context).size.width,
            color: _state ? Colors.grey[300] : Colors.white,
            child: _menuButton(),
          ),
        ],
      ),
    );
  }

  Widget _appBar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  icon: Icon(
                    Icons.home_outlined,
                    color: Colors.black45,
                    size: 25,
                  ),
                  onPressed: () {
                    setState(() {
                      _state = !_state;
                    });
                  })
            ],
          ),
        )
      ],
    );
  }

  Widget _menuButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _state = !_state;
            });
          },
          child: Container(
            padding: _state ? EdgeInsets.all(5) : EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Icon(
              Icons.menu,
              color: Colors.blueGrey,
              size: _state ? 15 : 25,
            ),
          ),
        )
      ],
    );
  }
}
