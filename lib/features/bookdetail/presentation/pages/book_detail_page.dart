import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:urun_katalog_projesi/features/home/data/models/category_model.dart';
import 'package:urun_katalog_projesi/features/home/data/models/product_model.dart';
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
class BookDetailPage extends ConsumerWidget {
  BookDetailPage( {super.key,required this.book});
  final ProductModel book;

  SimpleUiController simpleUiController = Get.put(SimpleUiController());

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state2 = ref.watch(productProvider);
    final provider2 = ref.watch(productProvider.notifier);

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: ColorManager.textColor,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: ColorManager.white,
          elevation: 0.3,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Book Details',
                style: TextStyle(color: ColorManager.textColor),
              ),
            ],
          ),
        ),
        body: state2.isLoading == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 30.h,
                        ),
                        Container(
                          height: 225.h,
                          width: 150.h,
                          child: Image(
                            image:
                                NetworkImage(book.cover),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                         book.name,
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                         book.author,
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: ColorManager.grey1.withOpacity(0.7)),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      'Summary',
                      style: TextStyle(
                          color: ColorManager.textColor,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                     book.description,
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: ColorManager.grey1.withOpacity(0.7),
                          height: 1.5),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: Container(
                      width: 390.w,
                      height: 60.h,
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: ElevatedButton(
                          onPressed: () {
                            router.push(HomaRoute());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${book.price} \$',
                                style: TextStyle(
                                    color: ColorManager.white,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16.sp),
                              ),
                              Text(
                                'Buy Now',
                                style: TextStyle(
                                  color: ColorManager.white,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                ],
              ));
  }
}
