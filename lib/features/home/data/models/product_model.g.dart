// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$$_ProductModelFromJson(Map<String, dynamic> json) =>
    _$_ProductModel(
      author: json['author'] as String? ?? ' ',
      name: json['name'] as String? ?? ' ',
      price: json['price'] as int? ?? 0,
      image: json['image'] as String? ?? '',
    );

Map<String, dynamic> _$$_ProductModelToJson(_$_ProductModel instance) =>
    <String, dynamic>{
      'author': instance.author,
      'name': instance.name,
      'price': instance.price,
      'image': instance.image,
    };
