import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network_manager/network_manager.dart';
import '../models/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> getCategories(int id);
}

@LazySingleton(as: ProductRepository)
class HomeRepositoryImp implements ProductRepository {
  final NetworkManager _networkManager;

  HomeRepositoryImp({required NetworkManager networkManager})
      : _networkManager = networkManager;
  @override
  Future<List<ProductModel>> getCategories(int id) async {
    try {
      Response response = await _networkManager.get(path: "products/${id+1}");
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
