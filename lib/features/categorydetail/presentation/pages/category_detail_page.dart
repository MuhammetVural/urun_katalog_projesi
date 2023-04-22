import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:urun_katalog_projesi/features/home/data/models/category_model.dart';
import 'package:urun_katalog_projesi/features/home/data/repositories/home_repository.dart';
import 'package:urun_katalog_projesi/product/components/color_manager.dart';
import 'package:urun_katalog_projesi/product/controller/simple_ui_controller.dart';
import 'package:urun_katalog_projesi/product/navigation/app_router.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../main.dart';
import '../../../../product/components/font_manager.dart';
import '../../../../product/locator/locator.dart';
import '../../../home/data/repositories/product_repository.dart';
import '../../../home/presentation/riverpod/home_provider.dart';
import '../../../home/presentation/riverpod/home_state.dart';
import '../../../home/presentation/riverpod/product_provider.dart';
import '../../../home/presentation/riverpod/product_state.dart';

final homeProvider = NotifierProvider.autoDispose<HomeProvider, HomeState>(
  () => HomeProvider(repository: getIt<HomeRepository>()),
);
final productProvider =
    NotifierProvider.autoDispose<ProductProvider, ProductState>(
  () => ProductProvider(repository2: getIt<ProductRepository>()),
);

@RoutePage()
class CategoryDetailPage extends ConsumerWidget {
  CategoryDetailPage({
    super.key,
  });
  SimpleUiController simpleUiController = Get.put(SimpleUiController());

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);
    final provider = ref.watch(homeProvider.notifier);

    final state2 = ref.watch(productProvider);
    final provider2 = ref.watch(productProvider.notifier);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          elevation: 0.3,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Best Seller",
                //category.name,
                style: TextStyle(color: ColorManager.textColor),
              ),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: TextField(
                cursorColor: Colors.grey,
                style: TextStyle(color: Colors.black54.withOpacity(0.8)),
                decoration: InputDecoration(
                  labelText: 'Search',
                  labelStyle: TextStyle(color: Colors.grey.withOpacity(0.7)),
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: ColorManager.textFieldGreyBackround,
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.analytics_outlined),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide:
                          const BorderSide(width: 0, style: BorderStyle.none)),
                ),
                controller: _searchController,
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Expanded(
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(4)),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      childAspectRatio: 2.1 / 3.4),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: state2.products.length,
                  itemBuilder: (context, subIndex) {
                    return Padding(
                      padding: EdgeInsets.all(15),
                      child: Container(
                        height: 250.h,
                        padding: EdgeInsets.all(10),
                        color: ColorManager.textFieldGreyBackround,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 225.w,
                              width: 150.w,
                              child: Image(
                                  image: NetworkImage(
                                state2.products[subIndex].cover,
                              )),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state2.products[subIndex].name,
                                  style: TextStyle(
                                      color: ColorManager.textColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      state2.products[subIndex].author,
                                      style: TextStyle(
                                          color: ColorManager.grey2
                                              .withOpacity(0.8),
                                          fontSize: 8,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      '${state2.products[subIndex].price.toString()} \$',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              ColorManager.textAndButtonPurple),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: const Text(
                    'Best Seller',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: FontSize.s20),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: TextButton(
                    onPressed: () {
                      router.push(HomaRoute());
                    },
                    child: Text(
                      'View All',
                      style: TextStyle(
                          color: ColorManager.orangeButtonColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ));
  }
}
