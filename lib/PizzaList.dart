import 'package:flutter/material.dart';

import 'constants/SlideLeftRoute.dart';

import './OrderInterface.dart';

import 'objects/PizzaOrder.dart';

class PizzaList extends StatefulWidget {
  @override
  _PizzaListState createState() => _PizzaListState();
}

class _PizzaListState extends State<PizzaList> {
  List<String> _sizes = PizzaOrder.getSizes;
  Map<String, bool> _toppings = PizzaOrder.getToppings;
  String _size;

  @override
  void initState() {
    _size = _sizes[0];
    super.initState();
  }

  void _onSizesCliked(String size) {
    setState(() {
      _size = size;
    });
  }

  bool _checkToppings() {
    int _a = 0;
    for (int i = 0; i < _toppings.length; i++) {
      bool _val = _toppings.values.elementAt(i);
      if (_val == false) {
        _a += 1;
      }
    }
    if (_a == _toppings.length) {
      return false;
    }
    return true;
  }

  void _onOrderClick(BuildContext tempContext) {
    if (!(_checkToppings())) {
      showDialog(
        context: tempContext,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("EMPTY"),
            content: new Text("Fields are Empty!\nPlease fill the order!"),
            backgroundColor: Color.fromARGB(210, 255, 255, 255),
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(15)),
            actions: <Widget>[
              new FlatButton(
                child: new Text("OK"),
                textColor: Colors.black87,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    
    } else {
      Navigator.push(
        tempContext,
        SlideLeftRoute(
          page: OrderInterface(size: _size,toppings: _toppings,),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: new Image(
          image: AssetImage("assets/images/pizzaFont.png"),
        ),
        actions: <Widget>[
          new Container(
            padding: EdgeInsets.only(right: _width / 20),
            child: new IconButton(
              icon: new Icon(Icons.home),
              iconSize: _height / 22,
              tooltip: "Home",
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: _height / 30),
        child: new Column(
          children: <Widget>[
            new DropdownButton(
              isExpanded: false,
              style: new TextStyle(
                fontSize: _height / 30,
                color: Colors.black,
                letterSpacing: 2,
              ),
              hint: new Text("Pizza Size"),
              value: _size,
              items: _sizes.map((String size) {
                return new DropdownMenuItem(
                  value: size,
                  child: new Row(
                    children: <Widget>[
                      new Icon(
                        Icons.local_pizza,
                        size: _height / 20,
                      ),
                      new Container(
                        child: new Text("  " + size + " "),
                      ),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (String size) {
                _onSizesCliked(size);
              },
            ),
            new Expanded(
              child: new Scrollbar(
                child: ListView.builder(
                  itemCount: _toppings.length,
                  itemBuilder: (BuildContext tempContext, int index) {
                    bool _val = _toppings.values.elementAt(index);
                    String _key = _toppings.keys.elementAt(index);
                    return new Container(
                      child: new CheckboxListTile(
                        activeColor: Colors.black87,
                        value: _val,
                        title: new Container(
                          padding: EdgeInsets.only(left: _width / 20),
                          child: new Text(
                            _key,
                            style: new TextStyle(fontSize: _height / 35),
                          ),
                        ),
                        onChanged: (bool value1) {
                          setState(() {
                            _toppings.update(_key, (value) => value1);
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            new Container(
              padding: EdgeInsets.only(
                  top: _height / 50,
                  bottom: _height / 50,
                  left: _width / 25,
                  right: _width / 25),
              width: double.infinity,
              child: new RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: new Text(
                  "Order",
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: _height / 50,
                      fontFamily: "OrderPizza"),
                ),
                color: Colors.black,
                onPressed: () {
                  _onOrderClick(context);
                },
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}
