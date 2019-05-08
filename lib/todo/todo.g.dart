// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Todo _$TodoFromJson(Map<String, dynamic> json) {
  return Todo()
    ..id = json['id'] as int
    ..text = json['text'] as String
    ..completed = json['completed'] as bool;
}

Map<String, dynamic> _$TodoToJson(Todo instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'completed': instance.completed
    };
