import 'package:flutter/widgets.dart';

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> with MyMixin {
  @override
  Widget build(BuildContext context) {
    return Text(value);
  }
}

mixin MyMixin<T extends StatefulWidget> on State<T> {
  String value = "42";

  @override
  void initState() {
    // ...
  }

  @override
  void dispose() {
    // ...
  }
}
