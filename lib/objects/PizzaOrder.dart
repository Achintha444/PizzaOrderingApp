class PizzaOrder {
  static List<String> _sizes = [
    "Small",
    "Medium",
    "Large",
  ];

  static Map<String, bool> _toppings = {
    "Pepperoni": false,
    "Mushrooms": false,
    "Onions": false,
    "Sausage": false,
    "Bacon": false,
    "Extra cheese": false,
    "Black olives": false,
    "Green peppers": false,
    "Pineapple": false,
    "Spinach": false,
  };
  String _size;
  String _topping;

  PizzaOrder({String size, String topping}) {
    this._size = size;
    this._topping = topping;
  }

  String get getSize {
    return _size;
  }

  String get getTopping {
    return _topping;
  }

  static List<String> get getSizes {
    return _sizes;
  }

  static Map<String, bool> get getToppings {
    return _toppings;
  }

  static void reset() {
    _toppings = {
      "Pepperoni": false,
      "Mushrooms": false,
      "Onions": false,
      "Sausage": false,
      "Bacon": false,
      "Extra cheese": false,
      "Black olives": false,
      "Green peppers": false,
      "Pineapple": false,
      "Spinach": false,
    };
  }
}
