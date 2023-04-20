import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:urun_katalog_projesi/features/home/presentation/riverpod/product_state.dart';

import '../../data/repositories/product_repository.dart';

class ProductProvider extends AutoDisposeNotifier<ProductState> {
  final ProductRepository _repository;
  ProductProvider({required ProductRepository repository})
      : _repository = repository;
  @override
  build() {
    getAllProducts();

    return state;
  }

  Future<void> getAllProducts() async {
    state = ProductState.initial();
    state = state.copyWith(
        products: await _repository.getProducts(), isLoading: false);
  }
}
