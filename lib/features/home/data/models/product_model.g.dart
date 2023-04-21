// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$$_ProductModelFromJson(Map<String, dynamic> json) =>
    _$_ProductModel(
      price: json['price'] as int? ?? 0,
      name: json['name'] as String? ?? "",
      author: json['author'] as String? ?? "",
      image: json['image'] as String? ?? "",
    );

Map<String, dynamic> _$$_ProductModelToJson(_$_ProductModel instance) =>
    <String, dynamic>{
      'price': instance.price,
      'name': instance.name,
      'author': instance.author,
      'image': instance.image,
    };
