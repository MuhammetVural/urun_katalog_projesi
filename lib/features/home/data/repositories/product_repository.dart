import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network_manager/network_manager.dart';
import '../models/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> getCategories();
}

@LazySingleton(as: ProductRepository)
class HomeRepositoryImp implements ProductRepository {
  final NetworkManager _networkManager;

  HomeRepositoryImp({required NetworkManager networkManager})
      : _networkManager = networkManager;
  @override
  Future<List<ProductModel>> getCategories() async {
    try {
      Response response = await _networkManager.get(path: "products/1");
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
