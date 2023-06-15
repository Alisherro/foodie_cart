import 'package:flutter/foundation.dart';
import 'package:foodie_cart/models/dishes.dart';
import 'package:foodie_cart/services/http_helper.dart';

class CategoryScreenProvider extends ChangeNotifier {
  CategoryScreenProvider() {
    initProvider();
  }

  void initProvider() async {
    dishesList = (await HttpService.fetchDishes())!.dishes!;
    notifyListeners();
  }

  late List<Dishes> dishesList = [];
  int selectedIndex = 0;
  List<String> filters = [
    'Все меню',
    'Салаты',
    'С рисом',
    'С рыбой',
  ];

  void onCategoryTap(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
