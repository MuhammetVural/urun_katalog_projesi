import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network_manager/network_manager.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> getProducts();
}

@LazySingleton(as: ProductRepository)
class ProductRepositoryImp implements ProductRepository {
  final NetworkManager _networkManager;

  ProductRepositoryImp({required NetworkManager networkManager})
      : _networkManager = networkManager;
  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      Response response = await _networkManager.get(path: "products");
      return response.data["product"]
          .map<ProductModel>((e) => ProductModel.fromJson(e))
          .toList();
    } on DioError catch (e) {
      print(e);
      return [];
    } catch (e) {
      return [];
    }
  }
}
