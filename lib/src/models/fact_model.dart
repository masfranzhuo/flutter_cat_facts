import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fact_model.g.dart';

@JsonSerializable()
class Fact {
  final String id;
  final String text;
  final String type;

  Fact({
    @required this.id,
    @required this.text,
    @required this.type
  });

  factory Fact.fromJson(Map<String, dynamic> json) => _$FactFromJson(json);

  Map<String, dynamic> toJson() => _$FactToJson(this);
}
