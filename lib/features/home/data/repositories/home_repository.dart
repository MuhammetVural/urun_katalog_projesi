import 'package:urun_katalog_projesi/features/home/data/models/category_model.dart';
import 'package:vexana/vexana.dart';

abstract class IHomeRepository {
  final INetworkManager networkManager;

  IHomeRepository(this.networkManager);

  Future<BaseCategoryModel?> getAllItems();
}

class HomeRepository extends IHomeRepository {
  HomeRepository(super.networkManager);

  @override
  Future<BaseCategoryModel?> getAllItems() async {
    final response = await networkManager
        .send<BaseCategoryModel, BaseCategoryModel>('categories',
            parseModel: BaseCategoryModel(), method: RequestType.GET);
    return response.data;
  }
}
