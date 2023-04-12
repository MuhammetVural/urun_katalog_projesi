import 'package:flutter_test/flutter_test.dart';
import 'package:urun_katalog_projesi/features/home/data/models/category_model.dart';
import 'package:urun_katalog_projesi/features/home/data/repositories/home_repository.dart';
import 'package:vexana/vexana.dart';

void main() {
  late INetworkManager networkManager;
  late IHomeRepository homeRepository;

  setUp(() {
    networkManager = NetworkManager<CategoryModel>(
      options:
          BaseOptions(baseUrl: 'https://assign-api.piton.com.tr/api/rest/'),
      isEnableLogger: true,
    );
    homeRepository = HomeRepository(networkManager);
  });

  test('Get list all data', () async {
    final listDatas = await networkManager
        .send<BaseCategoryModel, BaseCategoryModel>('categories',
            parseModel: BaseCategoryModel(), method: RequestType.GET);

    expect(listDatas.data, isNotNull);
  });

  test('Get list all manager', () async {
    final listDatas = await homeRepository.getAllItems();

    expect(listDatas?.category, isNotNull);
  });
}
