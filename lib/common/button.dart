import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Function onPressed;
  final String text;

  const AppButton({Key key, this.onPressed, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: this.onPressed,
      textColor: Colors.black,
      padding: const EdgeInsets.all(0.0),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Text(this.text),
      ),
    );
  }
}
