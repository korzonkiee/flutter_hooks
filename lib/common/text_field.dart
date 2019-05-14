import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Function(String) onChanged;
  final bool obscureText;

  const AppTextField({
    Key key,
    this.hintText,
    this.controller,
    this.onChanged,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontSize: 20),
      decoration: InputDecoration(
        hintText: this.hintText,
      ),
      controller: this.controller,
      obscureText: this.obscureText,
      onChanged: this.onChanged,
    );
  }
}
