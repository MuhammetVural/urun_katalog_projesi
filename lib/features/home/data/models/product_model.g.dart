// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$$_ProductModelFromJson(Map<String, dynamic> json) =>
    _$_ProductModel(
      author: json['author'] as String? ?? "",
      cover: json['cover'] as String? ?? "",
      id: json['id'] as int? ?? 0,
      price: (json['price'] as num?)?.toDouble() ?? 0,
      name: json['name'] as String? ?? "",
    );

Map<String, dynamic> _$$_ProductModelToJson(_$_ProductModel instance) =>
    <String, dynamic>{
      'author': instance.author,
      'cover': instance.cover,
      'id': instance.id,
      'price': instance.price,
      'name': instance.name,
    };
