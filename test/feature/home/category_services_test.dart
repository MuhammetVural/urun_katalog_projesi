import 'package:flutter_test/flutter_test.dart';
import 'package:urun_katalog_projesi/features/home/data/models/category_model.dart';
import 'package:vexana/vexana.dart';

void main() {
  late INetworkManager networkManager;

  setUp(() {
    networkManager = NetworkManager<CategoryModel>(
      options:
          BaseOptions(baseUrl: 'https://assign-api.piton.com.tr/api/rest/'),
      isEnableLogger: true,
    );
  });

  test('Get list all data', () async {
    final listDatas = await networkManager
        .send<CategoryModel, List<CategoryModel>>('/categories',
            parseModel: CategoryModel(), method: RequestType.GET);
    expect(listDatas.data, isNotNull);
  });
}
