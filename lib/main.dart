import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:urun_katalog_projesi/features/categorydetail/presentation/pages/category_detail_page.dart';
import 'package:urun_katalog_projesi/features/home/presentation/pages/home_page.dart';
import 'package:urun_katalog_projesi/features/login/presentation/pages/login_page.dart';
import 'package:urun_katalog_projesi/features/splash/presentation/pages/splash_page.dart';
import 'package:urun_katalog_projesi/gen/assets.gen.dart';
import 'package:urun_katalog_projesi/product/components/color_manager.dart';
import 'package:urun_katalog_projesi/product/locator/locator.dart';
import 'package:urun_katalog_projesi/product/navigation/app_router.dart';

import 'features/bookdetail/presentation/pages/book_detail_page.dart';

final router = AppRouter();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          routerDelegate: router.delegate(),
          routeInformationParser: router.defaultRouteParser(),

          debugShowCheckedModeBanner: false,
          title: 'First Method',

          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.orangeButtonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018
                .apply(fontSizeFactor: 1.sp, bodyColor: ColorManager.textColor),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),

            // useMaterial3: true,
          ),
        );
      },
      
    );
  }
}
