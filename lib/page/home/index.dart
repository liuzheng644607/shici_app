import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'const.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter(BuildContext context) {
    setState(() {
      _counter++;
    });
  }

  _renderTable() {
    return Expanded(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: lightSpellList.map((row) {
              List res = (row as List).map((item) {
                return Container(
                    child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      item['char'],
                      style: TextStyle(
                        fontSize: 16,
                        // color: Color(0xFFffffff)
                      ),
                    ),
                    Text(
                      item['spell'],
                      style: TextStyle(color: Color(0xFF7ecfc0)),
                    )
                  ],
                ));
              }).toList();
              return Row(
                children: res,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              );
            }).toList()));
  }

  _renderHead() {
    return Container(
      decoration: new BoxDecoration(
        // color: Color(0xffec8f6a),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: lightSpellHead.map((item) {
          return Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            height: 70,
            child: Column(
              children: <Widget>[
                Text(item['text'],
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffec8f6a)
                    )),
                Icon(Icons.volume_up, size: 16, color: Color(0xff7ecfc0),),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  _renderLeft() {
    return Container(
        decoration: new BoxDecoration(
          // color: Color(0xffec8f6a),
        ),
        child: Column(children: [
          Container(
            height: 70,
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text(
              '行\\段',
              style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w500,
                color: Color(0xffec8f6a),
              ),
            ),
          ),
          Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: lightSpellLeft.map((item) {
                    return MaterialButton(
                      onPressed: () {},
                      child: Column(
                        children: <Widget>[
                          Text(
                            item['text'],
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500,
                                color: Color(0xffec8f6a)
                              ),
                          ),
                          Icon(Icons.volume_up, size: 16, color: Color(0xff7ecfc0),),
                        ],
                      ),
                    );
                  }).toList())),
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 6,
        initialIndex: 0,
        child: Scaffold(
          // backgroundColor: Color(0xFFf2e3c9),
          appBar: AppBar(
            backgroundColor: Color(0xff7ecfc0),
            title: Text(widget.title),
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: Colors.white,
              tabs: <Widget>[
                Tab(text: '清音'),
                Tab(text: '拨音(鼻音)'),
                Tab(text: '浊音、半浊'),
                Tab(text: '拗音'),
                Tab(text: '促音'),
                Tab(text: '说明'),
              ],
            ),
          ),
          body: TabBarView(children: <Widget>[
            Container(
              // decoration: new BoxDecoration(color: Color(0xFFf2e3c9)),
              child: Row(
                children: <Widget>[
                  Container(width: 90, child: _renderLeft()),
                  Expanded(
                    child: Column(children: <Widget>[
                      _renderHead(),
                      _renderTable(),
                    ]),
                  )
                ],
              ),
            ),
            Center(
              child: Text('1'),
            ),
            Center(
              child: Text('1'),
            ),
            Center(
              child: Text('1'),
            ),
            Center(
              child: Text('1'),
            ),
            Center(
              child: Text('1'),
            ),
          ]), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}
