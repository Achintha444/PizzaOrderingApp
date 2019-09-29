import 'package:flutter/material.dart';
import 'package:pizza_app/constants/SlideRightRote.dart';
import 'package:pizza_app/objects/PizzaOrder.dart';
import './main.dart';

class OrderInterface extends StatefulWidget {
  String _size;
  Map<String, bool> _toppings;

  OrderInterface({String size, Map<String, bool> toppings}) {
    this._size = size;
    this._toppings = toppings;
  }

  @override
  _OrderInterfaceState createState() =>
      _OrderInterfaceState(size: _size, toppings: _toppings);
}

class _OrderInterfaceState extends State<OrderInterface> {
  String _size;
  Map<String, bool> _toppings;
  List<String> _tempToppings;

  _OrderInterfaceState({String size, Map<String, bool> toppings}) {
    this._size = size;
    this._toppings = toppings;
  }

  @override
  void initState() {
    _tempToppings = new List();
    _selectedToppings(_toppings);
    print(_toppings.toString());
    super.initState();
  }

  void _selectedToppings(Map<String, bool> toppings) {
    for (int i = 0; i < toppings.length; i++) {
      bool _val = toppings.values.elementAt(i);
      if (_val == true) {
        _tempToppings.add(toppings.keys.elementAt(i));
      }
    }
    //return toppings;
  }

  void _onOrderClick(BuildContext tempContext) {
    showDialog(
      context: tempContext,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Confirm Order!"),
          content: new Text("Are you want to confirm the order!"),
          backgroundColor: Color.fromARGB(210, 255, 255, 255),
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(15)),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Yes"),
              textColor: Colors.black45,
              onPressed: () {
                Navigator.pop(context);
                PizzaOrder.reset();
                Navigator.of(context).pushAndRemoveUntil(
                    SlideRightRoute(page: MyApp()),
                    (Route<dynamic> route) => false);
              },
            ),
            new FlatButton(
              child: new Text("No"),
              textColor: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black,
        title: new Image(
          image: AssetImage("assets/images/pizzaFont.png"),
        ),
      ),
      body: new Container(
        padding: EdgeInsets.only(top: _height / 20),
        alignment: Alignment.topCenter,
        child: new Column(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.only(bottom: _height / 40),
              child: new Text(
                "ORDER CONFIRMATION!",
                textAlign: TextAlign.center,
                style: new TextStyle(
                  wordSpacing: 3,
                  letterSpacing: 3,
                  fontSize: _height / 55,
                  fontFamily: "OrderPizza",
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
            ),
            new ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: new Image(
                image: AssetImage("assets/images/pizzaCustomer.jpg"),
                width: 2 * _width / 3,
                alignment: Alignment.topCenter,
                color: Colors.black26,
                colorBlendMode: BlendMode.dst,
              ),
            ),
            new Container(
              padding: EdgeInsets.only(top: _height / 40, bottom: _height / 40),
              alignment: Alignment.center,
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    "Size :",
                    style: new TextStyle(
                      letterSpacing: 2,
                      fontSize: _height / 65,
                      fontFamily: "OrderPizza",
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  new Icon(
                    Icons.local_pizza,
                  ),
                  new Text(
                    _size,
                    style: new TextStyle(
                      letterSpacing: 2,
                      fontSize: _height / 65,
                      fontFamily: "OrderPizza",
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            new Text(
              "Toppings :",
              style: new TextStyle(
                letterSpacing: 2,
                fontSize: _height / 65,
                fontFamily: "OrderPizza",
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
            new Expanded(
              child: new Scrollbar(
                child: ListView.builder(
                  itemCount: _tempToppings.length,
                  itemBuilder: (BuildContext context, int index) {
                    //_selectedToppings(_toppings);
                    String _key = _tempToppings[index];
                    return new Container(
                      child: new Card(
                        color: Colors.white70,
                        child: new Text(
                          _key,
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            letterSpacing: 2,
                            fontSize: _height / 65,
                            fontFamily: "OrderPizza",
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
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
