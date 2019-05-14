import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle style;

  const AppText(this.text, {Key key, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: this.style ?? TextStyle(fontSize: 20),
    );
  }
}
