import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:urun_katalog_projesi/features/home/data/repositories/home_repository.dart';
import 'package:urun_katalog_projesi/product/components/color_manager.dart';
import 'package:urun_katalog_projesi/product/navigation/app_router.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../main.dart';
import '../../../../product/components/font_manager.dart';
import '../../../../product/locator/locator.dart';
import '../../data/repositories/product_repository.dart';
import '../riverpod/home_provider.dart';
import '../riverpod/home_state.dart';
import '../riverpod/product_provider.dart';
import '../riverpod/product_state.dart';

final homeProvider = NotifierProvider.autoDispose<HomeProvider, HomeState>(
  () => HomeProvider(repository: getIt<HomeRepository>()),
);
final productProvider =
    NotifierProvider.autoDispose<ProductProvider, ProductState>(
  () => ProductProvider(repository2: getIt<ProductRepository>()),
);

@RoutePage()
class HomaPage extends ConsumerWidget {
  HomaPage({super.key});
  late TabController tabController;

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
          leading: Padding(
            padding: EdgeInsets.only(left: 20.0.h),
            child: Image.asset(Assets.images.logo.path),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Catalog',
                style: TextStyle(color: ColorManager.textColor),
              ),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              height: 60.h,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: state2.products.length,
                  itemBuilder: ((context, index) {
                    return Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: ColorManager.textAndButtonPurple),
                        margin: const EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            state2.products[index].name,
                            style: TextStyle(
                              color: ColorManager.white,
                            ),
                          ),
                        ));
                  })),
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
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: state.categories.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.categories[index].name,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: FontSize.s20),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4)),
                        height: 180.h,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: state2.products.length,
                          itemBuilder: (context, subIndex) {
                            return Padding(
                              padding: EdgeInsets.all(15),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                color: ColorManager.textFieldGreyBackround,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 80.w,
                                      height: 180.h,
                                      padding: EdgeInsets.all(10),
                                      child: Image(
                                          image: NetworkImage(
                                        state2.products[index].cover,
                                      )),
                                    ),
                                    Column(
                                      children: [
                                        Center(
                                          child: Text(
                                            state2.products[subIndex].author,
                                            style: TextStyle(
                                                color: ColorManager.textColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
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
