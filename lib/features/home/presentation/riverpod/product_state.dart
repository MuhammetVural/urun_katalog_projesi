import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/category_model.dart';
import '../../data/models/product_model.dart';

part 'product_state.freezed.dart';

@freezed
class ProductState with _$ProductState {
  factory ProductState({
    @Default([]) List<ProductModel> products,
    @Default(false) bool isLoading,
  }) = _ProductState;

  ProductState._();

  factory ProductState.initial() {
    return ProductState(products: [], isLoading: true);
  }
}