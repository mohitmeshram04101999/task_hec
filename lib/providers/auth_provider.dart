

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hecker_task/component/shradPrefrence.dart';
import 'package:hecker_task/screens/home%20page.dart';
import 'package:hecker_task/screens/loginScreen.dart';

class AuthProvider with ChangeNotifier{

  final Prefrence _prefrence = Prefrence();
  TextEditingController _emailController =TextEditingController();
  TextEditingController _passwordController =TextEditingController();
  bool _showPassword  =true;



  TextEditingController get emailController =>_emailController;
  TextEditingController get passwordController =>_passwordController;
  bool get showPassword  =>_showPassword;


  void hidePassword()
  {
    _showPassword = !_showPassword;
    notifyListeners();
  }


  void getUser(BuildContext context) async
  {
    var user = await _prefrence.getUser();
    if(user!=null)
      {
        Navigator.pushReplacement(context,MaterialPageRoute(builder:(context) => HomePage(),));
      }
    else
      {
        Navigator.pushReplacement(context,MaterialPageRoute(builder:(context) => LoginScreen(),));
      }

  }





}