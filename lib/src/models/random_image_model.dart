import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'random_image_model.g.dart';

@JsonSerializable()
class RandomImage {
  final String id;
  final String url;
  final int width;
  final int height;

  RandomImage({
    @required this.id,
    @required this.url,
    @required this.width,
    @required this.height,
  });

  factory RandomImage.fromJson(Map<String, dynamic> json) => _$RandomImageFromJson(json);

  Map<String, dynamic> toJson() => _$RandomImageToJson(this); 
}
