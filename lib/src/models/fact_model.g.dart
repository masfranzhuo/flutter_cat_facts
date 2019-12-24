// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fact _$FactFromJson(Map<String, dynamic> json) {
  return Fact(
    id: json['id'] as String,
    text: json['text'] as String,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$FactToJson(Fact instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'type': instance.type,
    };
