import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:urun_katalog_projesi/features/home/presentation/riverpod/product_state.dart';

import '../../data/repositories/product_repository.dart';

class ProductProvider extends AutoDisposeNotifier<ProductState> {
  final ProductRepository _repository2;
  ProductProvider({required ProductRepository repository2})
      : _repository2 = repository2;
  @override
  build() {
    getAllProducts();

    return state;
  }

  Future<void> getAllProducts() async {
    state = ProductState.initial();
    state = state.copyWith(
        products: await _repository2.getCategories(), isLoading: false);
  }
}
