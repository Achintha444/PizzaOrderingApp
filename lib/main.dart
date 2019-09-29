import 'package:flutter/material.dart';

import 'constants/SlideRightRote.dart';
import './PizzaList.dart';

void main() => runApp(
      new MaterialApp(
        home: MyApp(),
        routes: {
          "/pizzaList": (_) => new PizzaList(),
        },
      ),
    );

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void _onClickOrder(BuildContext tempContext) {
    Navigator.push(
      tempContext,
      SlideRightRoute(
        page: PizzaList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return new Scaffold(
      body: new Container(
        color: Colors.black,
        padding: EdgeInsets.only(top: _height / 20),
        child: new Column(
          children: <Widget>[
            new Image(
              image: AssetImage("assets/images/pizzaFont.png"),
            ),
            new Container(
              padding: EdgeInsets.only(top: _height / 20),
              child: new ClipRRect(
                borderRadius: new BorderRadius.circular(50),
                child: new Image(
                  image: AssetImage("assets/images/pizzaMan.jpeg"),
                  alignment: Alignment.center,
                  color: Colors.redAccent,
                  colorBlendMode: BlendMode.colorBurn,
                ),
              ),
            ),
            new Container(
              width: double.infinity,
              child: new Card(
                borderOnForeground: true,
                color: Color.fromARGB(100, 138, 138, 138),
                margin: EdgeInsets.only(
                  top: _height / 20,
                  bottom: _height / 40,
                ),
                child: new Container(
                  padding: EdgeInsets.only(top: _height/90, bottom: _height/90),
                  child: new Text(
                    "WE TAKE PIZZA ORDERS!",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      wordSpacing: 3,
                      letterSpacing: 3,
                      fontSize: _height / 40,
                      fontFamily: "OrderPizza",
                      fontWeight: FontWeight.w900,
                      color: Colors.white,

                    ),
                  ),
                ),
              ),
            ),
            new Container(
              padding: EdgeInsets.only(
                left: _width / 10,
                right: _width / 10,
              ),
              width: double.infinity,
              child: new RaisedButton(
                color: Colors.red,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                child: new Text(
                  "ORDER",
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: _height / 50,
                    fontFamily: "OrderPizza",
                    fontWeight: FontWeight.w300,
                    letterSpacing: 3,
                  ),
                ),
                onPressed: () {
                  _onClickOrder(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
