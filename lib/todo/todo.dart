import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'todo.g.dart';

@JsonSerializable(nullable: false)
class Todo {
  int id;
  String text;
  bool completed;

  Todo() {
    id = DateTime.now().millisecondsSinceEpoch;
    text = "";
    completed = false;
  }

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
  Map<String, dynamic> toJson() => _$TodoToJson(this);

  static List<Todo> listFromJson(String data) {
    return (json.decode(data) as List).map((d) => Todo.fromJson(d)).toList();
  }
}
