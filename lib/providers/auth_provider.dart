

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hecker_task/component/shradPrefrence.dart';
import 'package:hecker_task/component/snakeBar.dart';
import 'package:hecker_task/screens/home%20page.dart';
import 'package:hecker_task/screens/loginScreen.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier{

  final Prefrence _prefrence = Prefrence();
  TextEditingController _emailController =TextEditingController();
  TextEditingController _passwordController =TextEditingController();
  bool _showPassword  =true;
  bool _loading  = false;



  TextEditingController get emailController =>_emailController;
  TextEditingController get passwordController =>_passwordController;
  bool get showPassword  =>_showPassword;
  bool get loading => _loading;


  void hidePassword()
  {
    _showPassword = !_showPassword;
    notifyListeners();
  }


  void getUser(BuildContext context) async
  {
    var user = await _prefrence.getUser();
    await Future.delayed(Duration(seconds: 1));
    if(user!=null)
      {
        Navigator.pushReplacement(context,MaterialPageRoute(builder:(context) => HomePage(),));
      }
    else
      {
        Navigator.pushReplacement(context,MaterialPageRoute(builder:(context) => LoginScreen(),));
      }

  }
  
  
  void logIn(BuildContext context)async
  {

    showDialog(context: context, builder: (context) => Center(child: CircularProgressIndicator(),),);

    var resp =  await http.post(
        Uri.parse("https://reqres.in/api/login"),
        body: {
          "email":_emailController.text.trim(),
          "password":passwordController.text.trim()
        }
    );


    print('${resp.statusCode}\n${resp.body}');


    switch(resp.statusCode)
    {
      case 200:
        var data = jsonDecode(resp.body);
        String tocken = data['token'];
        _prefrence.saveUser(tocken);
        Navigator.pop(context);
        snakeBar(context,message: 'Login Successfully');

        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage(),),(route) => false,);
        print("asd");

        break;

      case 400:
        Navigator.pop(context);
        snakeBar(context,message: 'invalid crendiationls');
        break;

      case 500:
        Navigator.pop(context);
        snakeBar(context,message: 'server Error');
        break;

      default:
        Navigator.pop(context);
        snakeBar(context,message: 'Something went wrong');

    }

    _loading=false;
    notifyListeners();
  }



  logOut(BuildContext context)async
  {
    await _prefrence.clear();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen(),), (route) => false,);
  }





}