import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../features/login/presentation/pages/login_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';


part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route',)
class AppRouter extends _$AppRouter {
  
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, path: '/', usesPathAsKey: true, ),
    AutoRoute(page: LoginRoute.page, path: '/login'),
    
  
    /// routes go here
  ];
}
