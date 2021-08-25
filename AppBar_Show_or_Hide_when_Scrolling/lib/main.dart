import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'list.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlinedButton(
                onPressed: () => Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => ScreenOne())),
                child: Text('ScreenOne')),
            OutlinedButton(
                onPressed: () => Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => TabScreen())),
                child: Text('TabScreen')),
            OutlinedButton(
                onPressed: () => Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => AppBarShadows())),
                child: Text('AppBarShadows')),
          ],
        ),
      ),
    );
  }
}

class AppBarShadows extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// AppBar shadow whene scrolling
    return Scaffold(
        body: NestedScrollView(

            /// floatHeaderSlivers & floating both will be true
            floatHeaderSlivers: true,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) => [
                      SliverAppBar(

                          /// AppBar background will be white
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,

                          /// force to elevet whene scrolling. so don't need
                          // forceElevated: innerBoxIsScrolled,

                          /// floatHeaderSlivers & floating both will be true
                          floating: true,
                          snap: true,

                          /// TabBar will be pinned. whene Scrolling down
                          pinned: true,

                          /// for animation. snap: true & floating: true both
                          title: Text(
                            'AppBar',
                            style: TextStyle(color: Colors.black),
                          ))
                    ],
            body: ListOfDatas()));
  }
}

class TabScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// TabBar
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            body: NestedScrollView(

                /// floatHeaderSlivers & floating both will be true
                floatHeaderSlivers: true,
                headerSliverBuilder: (BuildContext context,
                        bool innerBoxIsScrolled) =>
                    [
                      SliverOverlapAbsorber(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context),
                          sliver: SliverSafeArea(
                              top: false,
                              sliver: SliverAppBar(

                                  /// TabBar will be pinned. whene Scrolling down
                                  pinned: true,

                                  /// floatHeaderSlivers & floating both will be true
                                  floating: true,
                                  snap: true,

                                  /// for animation. snap: true & floating: true both
                                  title: Text('AppBar'),
                                  bottom: TabBar(
                                      tabs: [Tab(text: 'A'), Tab(text: 'B')]))))
                    ],
                body: TabBarView(children: [
                  /// we should use CustomScrollView > SliverPadding > SliverList for perfect scroll controlling
                  SafeArea(
                      top: false,
                      bottom: false,
                      child: Builder(
                          builder: (context) => CustomScrollView(slivers: [
                                SliverOverlapInjector(
                                    handle: NestedScrollView
                                        .sliverOverlapAbsorberHandleFor(
                                            context)),
                                SliverPadding(
                                    padding: EdgeInsets.all(10),
                                    sliver: SliverListOfDatas())
                              ]))),
                  SafeArea(
                      top: false,
                      bottom: false,
                      child: Builder(
                          builder: (context) => CustomScrollView(slivers: [
                                SliverOverlapInjector(
                                    handle: NestedScrollView
                                        .sliverOverlapAbsorberHandleFor(
                                            context)),
                                SliverPadding(
                                    padding: EdgeInsets.all(10),
                                    sliver: SliverListOfDatas())
                              ])))
                ]))));
  }
}

class ScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// only AppBar
    return Scaffold(
        body: NestedScrollView(

            /// floatHeaderSlivers & floating both will be true
            floatHeaderSlivers: true,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) => [
                      SliverAppBar(

                          /// floatHeaderSlivers & floating both will be true
                          floating: true,
                          snap: true,

                          /// for animation. snap: true & floating: true both
                          title: Text('AppBar'))
                    ],
            body: ListOfDatas()));
  }
}
