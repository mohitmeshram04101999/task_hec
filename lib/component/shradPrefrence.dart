
import 'dart:convert';

import 'package:hecker_task/component/product%20Model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefrence{


  Future<void> saveCart(List<Product> data) async
  {
    var sp = await SharedPreferences.getInstance();
    List listData  = [];
    data.forEach((element){
      listData.add(element.toJson());
    },);
    sp.setString('cart', jsonEncode(listData));
  }



  Future<void> saveUser(String toke)async
  {
    var sp = await SharedPreferences.getInstance();
    sp.setString("user", toke);

  }

  Future<String?> getUser() async
  {
    var sp = await SharedPreferences.getInstance();
    var d = sp.getString('user');
    return d;
  }

  Future<void> clear() async
  {
    var sp = await SharedPreferences.getInstance();
    sp.clear();
  }


  Future<List<Product>?> getCart() async
  {
    var sp = await SharedPreferences.getInstance();
    List<Product> listData  = [];
    var data  = sp.getString('cart');
    if(data!=null)
      {
        List dataList = jsonDecode(data);
        dataList.forEach((element) {
          listData.add(Product.fromJson(element));
        },);

        return listData;
      }
    else
      {
        null;
      }
  }

}