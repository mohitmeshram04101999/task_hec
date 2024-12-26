
import 'package:flutter/cupertino.dart';
import 'package:hecker_task/component/product%20Model.dart';
import 'package:hecker_task/component/shradPrefrence.dart';
import 'package:hecker_task/component/snakeBar.dart';


class CartProvider with ChangeNotifier{

  bool _loading = true;
  final Prefrence _prefrence = Prefrence();
  List<Product> _product = [];
  List<Product> get product =>_product;
  bool get loading => _loading;


  void lodeCart() async
  {
    var data =  await _prefrence.getCart();
    if(data!=null)
      {
        _product = data;
      }
    _loading = false;
    notifyListeners();
  }

  void addProduct(BuildContext context,Product product)
  {
   var add =  _product.any((element) => element.id==product.id,);
   if(add)
     {
       snakeBar(context,message: 'Item is allredy in Your Cart');
     }
   else
     {
       _product.add(product);
       snakeBar(context,message: 'Item added');
       _prefrence.saveCart(_product);
       notifyListeners();
     }

  }

  void removeProduct(Product product)
  {
    _product.removeWhere((element) => element.id==product.id,);
    _prefrence.saveCart(_product);
    notifyListeners();
  }

}