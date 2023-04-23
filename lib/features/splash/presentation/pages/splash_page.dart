import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urun_katalog_projesi/product/components/color_manager.dart';
import 'package:urun_katalog_projesi/product/navigation/app_router.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../main.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.splash,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 200.w,
              height: 130.h,
              child: Image.asset(Assets.images.logo2x.path),
            ),
            Column(
              children: [
                Container(
                  width: 350.w,
                  height: 60.h,
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: ElevatedButton(
                      onPressed: () {
                        router.push( const LoginRoute());
                      },
                      child: const Text('Login')),
                ),
                Container(
                  width: 350.w,
                  height: 60.h,
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: TextButton(onPressed: () {}, child: Text('Skip')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
