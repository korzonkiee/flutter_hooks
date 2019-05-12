import 'package:flutter/widgets.dart';

mixin Bar<T extends StatefulWidget> on State<T> {
  int value = 42;
}

mixin Foo<T extends StatefulWidget> on State<T> {
  String value = "43";
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> with Foo {
  @override
  Widget build(BuildContext context) {
    return null;
  }
}
