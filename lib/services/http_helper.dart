import 'dart:convert';

import 'package:foodie_cart/models/category.dart';
import 'package:foodie_cart/models/dishes.dart';
import 'package:http/http.dart' as http;

class HttpService{

  static Future<Categories?> fetchCategories() async {
    const url = 'https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54';
    final uri = Uri.parse(url);
    final response =
    await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) ;
      final result = Categories.fromJson(json);
      return result;
    } else {
      print('something went wrong');
      return null;
    }
  }

  static Future<DishesList?> fetchDishes() async {
    const url = 'https://run.mocky.io/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b';
    final uri = Uri.parse(url);
    final response =
    await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) ;
      final result = DishesList.fromJson(json);
      return result;
    } else {
      print('something went wrong');
      return null;
    }
  }


}