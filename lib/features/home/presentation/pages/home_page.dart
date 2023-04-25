import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:urun_katalog_projesi/features/categorydetail/presentation/pages/category_detail_page.dart';
import 'package:urun_katalog_projesi/features/home/data/repositories/home_repository.dart';
import 'package:urun_katalog_projesi/features/login/data/models/login_model.dart';
import 'package:urun_katalog_projesi/product/components/color_manager.dart';
import 'package:urun_katalog_projesi/product/controller/simple_ui_controller.dart';
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
class HomePage extends ConsumerWidget {
  //HomePage({super.key,});
  HomePage({super.key, required this.token});
  String token;
  //SimpleUiController simpleUiController = Get.put(SimpleUiController());

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
            //   child: ListView.builder(
            //       scrollDirection: Axis.horizontal,
            //       shrinkWrap: true,
            //       itemCount: state.categories.length,
            //       itemBuilder: ((context, index) {
            //         return Obx(
            //           () => GestureDetector(
            //             onTap: () {
            //               simpleUiController.selectedIndex.value = index;
            //             },
            //             child: Container(
            //                 padding: const EdgeInsets.all(10),
            //                 decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(4),
            //                     color: index ==
            //                             simpleUiController.selectedIndex.value
            //                         ? ColorManager.textAndButtonPurple
            //                         : ColorManager.textFieldGreyBackround),
            //                 margin: const EdgeInsets.all(10),
            //                 child: Center(
            //                   child: Text(
            //                     state.categories[index].name,
            //                     style: TextStyle(
            //                       color: index ==
            //                               simpleUiController.selectedIndex.value
            //                           ? ColorManager.white
            //                           : Colors.grey.withOpacity(0.7),
            //                     ),
            //                   ),
            //                 )),
            //           ),
            //         );
            //       })),
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
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoryDetailPage(
                                    getIndex: index,
                                  )));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20.w),
                              child: Text(
                                state.categories[index].name,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: FontSize.s20),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 10.w),
                              child: TextButton(
                                onPressed: () {
                                  //  router.push(HomeRoute(loginModel: null));
                                },
                                child: Text(
                                  'View All',
                                  style: TextStyle(
                                      color: ColorManager.orangeButtonColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: FontSize.s12),
                                ),
                              ),
                            ),
                          ],
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                state2.products[subIndex].name,
                                                style: TextStyle(
                                                    color:
                                                        ColorManager.textColor,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Text(
                                                state2
                                                    .products[subIndex].author,
                                                style: TextStyle(
                                                    color:
                                                        ColorManager.textColor,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            state2.products[index].price
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
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
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Text(
                    '',
                    // loginModel.email,
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: FontSize.s20),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: TextButton(
                    onPressed: () {
                      // router.push(HomeRoute(loginModel: null));
                    },
                    child: Text(
                      '',
                      //  loginModel.token,
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
