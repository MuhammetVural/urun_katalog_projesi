import 'package:vexana/vexana.dart';

class BaseCategoryModel extends INetworkModel<BaseCategoryModel> {
  List<CategoryModel>? category;

  @override
  BaseCategoryModel fromJson(Map<String, dynamic> json) {
    return BaseCategoryModel.fromJson(json);
  }

  BaseCategoryModel({this.category});

  BaseCategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['category'] != null) {
      category = <CategoryModel>[];
      json['category'].forEach((v) {
        category!.add(CategoryModel.fromJson(v));
      });
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (category != null) {
      data['category'] = category!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryModel extends INetworkModel<CategoryModel> {
  int? id;
  String? name;

  CategoryModel({
    this.id,
    this.name,
  });
  @override
  CategoryModel fromJson(Map<String, dynamic> json) {
    return CategoryModel.fromJson(json);
  }

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
