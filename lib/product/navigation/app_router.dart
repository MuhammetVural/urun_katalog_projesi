import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../features/categorydetail/presentation/pages/category_detail_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/login/presentation/pages/login_page.dart';
import '../../features/register/features/register/presentation/pages/register_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: SplashRoute.page,
      path: '/sp',
    ),
    AutoRoute(page: LoginRoute.page, path: '/login'),
    AutoRoute(page: RegisterRoute.page, path: '/register'),
    AutoRoute(
      page: HomaRoute.page,
      path: '/',
    ),
    AutoRoute(page: CategoryDetailRoute.page, path: '/category')
  ];
}
