
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final bool hideText;
  final Widget? icon;
  final String? hintText;
  final Widget? suffix;
  final TextEditingController? controller;
  const AuthField({
    this.icon,
    this.hintText,
    this.controller,
    this.suffix,
    this.hideText = false,
    super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: hideText,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: icon,
          prefixIconColor: Colors.grey.shade400,
          iconColor: Colors.grey.shade500,
          hintText: hintText,
          suffixIcon: suffix,
        suffixIconColor: Colors.grey.shade400,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.grey.shade500
        )
      ),
    );
  }
}
