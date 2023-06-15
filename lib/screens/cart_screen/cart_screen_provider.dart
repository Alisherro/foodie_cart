import 'package:flutter/cupertino.dart';

import '../../models/dishes.dart';

class CartScreenProvider extends ChangeNotifier {
  Map<Dishes, int> cartList = {};
  int sum = 0;

  void addItem(Dishes dishes) {
    if (cartList.containsKey(dishes)) {
      cartList.update(dishes, (value) => value + 1);
    } else {
      cartList.addAll({dishes: 1});
    }
    calculateSum();
    notifyListeners();
  }

  void removeItem(Dishes dishes) {
    if (cartList[dishes] == 1) {
      cartList.remove(dishes);
    } else {
      cartList.update(dishes, (value) => value - 1);
    }
    if (cartList.isNotEmpty) calculateSum();

    notifyListeners();
  }

  void calculateSum() {
    final batt = cartList.entries
        .map((e) => (e.key.price! * e.value))
        .toList()
        .reduce((a, b) => a + b);
    sum = batt;
  }

  void clearState() {
    cartList = {};
    notifyListeners();
  }
}
