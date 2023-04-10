import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urun_katalog_projesi/product/components/color_manager.dart';
import 'package:urun_katalog_projesi/product/components/reuseable_widgets.dart';
import 'package:urun_katalog_projesi/product/navigation/app_router.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../main.dart';
import '../../../../product/components/font_manager.dart';

@RoutePage()
class HomaPage extends StatefulWidget {
  const HomaPage({super.key});

  @override
  State<HomaPage> createState() => _HomaPageState();
}

class _HomaPageState extends State<HomaPage> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
              width: 50.w,
              height: 50.h,
              child: Text('dsfg'),
            ),
            // Expanded(
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: 3,
            //     itemBuilder: ((context, index) {}),
            //   ),
            // ),
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
                      router.push(const HomaRoute());
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