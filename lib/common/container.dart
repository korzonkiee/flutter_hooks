import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  final Widget child;

  const AppContainer({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: this.child),
    );
  }
}
