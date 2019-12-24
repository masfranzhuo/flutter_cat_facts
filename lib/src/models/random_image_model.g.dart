// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'random_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RandomImage _$RandomImageFromJson(Map<String, dynamic> json) {
  return RandomImage(
    id: json['id'] as String,
    url: json['url'] as String,
    width: json['width'] as int,
    height: json['height'] as int,
  );
}

Map<String, dynamic> _$RandomImageToJson(RandomImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };
