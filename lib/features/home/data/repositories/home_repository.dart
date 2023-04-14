import 'package:dio/dio.dart';

import '../../../../core/network_manager/network_manager.dart';
import '../models/category_model.dart';

abstract class IHomeRepository {
  Future<List<CategoryModel>> getCategories();
}

class HomeRepositoryImp implements IHomeRepository {
  final NetworkManager _networkManager;

  HomeRepositoryImp({required NetworkManager networkManager})
      : _networkManager = networkManager;
  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      Response response = await _networkManager.get(path: "categories");
      return response.data["category"]
          .map<CategoryModel>((e) => CategoryModel.fromJson(e))
          .toList();
    } on DioError catch (e) {
      print(e);
      return [];
    } catch (e) {
      return [];
    }
  }
}

class HomeRepositorys {
  NetworkManagerImp _networkManager = NetworkManagerImp();

  Future<List<CategoryModel>> getCategories() async {
    try {
      Response response = await _networkManager.get(path: "categories");
      return response.data["category"]
          .map<CategoryModel>((e) => CategoryModel.fromJson(e))
          .toList();
    } on DioError catch (e) {
      print(e);
      return [];
    } catch (e) {
      return [];
    }
  }
}
