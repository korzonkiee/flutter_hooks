import 'package:flutter/widgets.dart';

mixin A {
  String value = "A";
}

mixin B {
  String value = "B";
}

class Value with A, B {
  String get() => value;
}
