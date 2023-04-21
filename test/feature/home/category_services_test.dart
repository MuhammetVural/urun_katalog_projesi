import 'package:flutter_test/flutter_test.dart';
import 'package:urun_katalog_projesi/features/home/data/models/category_model.dart';
import 'package:urun_katalog_projesi/features/home/data/models/product_model.dart';
import 'package:urun_katalog_projesi/features/home/data/repositories/home_repository.dart';
import 'package:urun_katalog_projesi/features/home/data/repositories/product_repository.dart';
import 'package:urun_katalog_projesi/product/locator/locator.dart';

void main() {
  late ProductRepository _repository2;
  late HomeRepository _repository;
  setUp(() {
    configureDependencies();
    _repository = getIt();
    _repository2 = getIt();
  });

  test('GetProducts', () async {
    List<ProductModel> products = await _repository2.getCategories();
    expect(products, isNotEmpty);
  });
  // test('Getcategories', () async {
  //   List<CategoryModel> category = await _repository.getCategories();
  //   expect(category, isNotEmpty);
  // });
}
