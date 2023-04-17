import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';


import '../../../../core/network_manager/network_manager.dart';
import '../models/category_model.dart';



abstract class HomeRepository {
  Future<List<CategoryModel>> getCategories();
}

@LazySingleton(as: HomeRepository)
class HomeRepositoryImp implements HomeRepository {
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
