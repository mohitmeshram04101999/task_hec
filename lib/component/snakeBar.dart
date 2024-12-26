

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void snakeBar(BuildContext context,{String message='',bool warning =false})
{
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8,horizontal: 8),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color:warning?Colors.red:Colors.green,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                offset: Offset(2,2 ),
                color: Colors.black.withOpacity(.7)
              )
            ]
          ),
          alignment:Alignment.center,
            child: Text(message)),
      ))
  );
}