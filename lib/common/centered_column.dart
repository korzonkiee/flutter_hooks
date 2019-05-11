import 'package:flutter/material.dart';

class CenteredColumn extends StatelessWidget {
  final List<Widget> children;

  const CenteredColumn({Key key, @required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: this.children,
      ),
    );
  }
}
