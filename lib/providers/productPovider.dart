
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hecker_task/component/product%20Model.dart';
import 'package:http/http.dart' as http;

class ProductProvider with ChangeNotifier
{

  bool _loading = true;
  List<Product> _product = [];
  List<Product> _filterList = [];
  TextEditingController _searchController =TextEditingController();


  List<Product> get product => _product;
  List<Product> get filterList => _filterList;
  bool get loading =>_loading;
  TextEditingController get searchController =>_searchController;

  void loadAllProduct() async{
    _loading = true;
    notifyListeners();
    String uri = 'https://fakestoreapi.com/products';
    var resp =  await http.get(Uri.parse(uri));

    if(resp.statusCode==200)
      {
        var decode = jsonDecode(resp.body);
        print(decode);
        var _p = productFromJson(resp.body);
        _product = _p;

      }

    _loading= false;
    notifyListeners();
  }

  void filter()
  {
   var s =  _searchController.text.trim();
   _filterList = [];

   _product.forEach((element) {
     if(element.title!.toLowerCase().contains(s.toLowerCase()))
       {
         _filterList.add(element);
       }

     },);

   notifyListeners();
  }



}