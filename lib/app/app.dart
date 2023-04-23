import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urun_katalog_projesi/features/home/presentation/pages/home_page.dart';
import 'package:urun_katalog_projesi/features/login/presentation/pages/login_page.dart';

class MyApp extends StatefulWidget {
  MyApp._internal(); // private named constractor

  static final MyApp instance =
      MyApp._internal(); // single instance ya da singleton

  int appState = 0;

  factory MyApp() => instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'First Method',
            // You can use the library anywhere in the app even in theme
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),
            home: child,
          );
        },
        //child:  HomaPage()
        );
  }
}
