// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    CategoryDetailRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CategoryDetailPage(
          key: args.key,
          getIndex: args.getIndex,
        ),
      );
    },
    HomaRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomaRouteArgs>(orElse: () => const HomaRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomaPage(key: args.key),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    RegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegisterPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    BookDetailRoute.name: (routeData) {
      final args = routeData.argsAs<BookDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BookDetailPage(
          key: args.key,
          getIndex1: args.getIndex1,
        ),
      );
    },
  };
}

/// generated route for
/// [CategoryDetailPage]
class CategoryDetailRoute extends PageRouteInfo<CategoryDetailRouteArgs> {
  CategoryDetailRoute({
    Key? key,
    required int getIndex,
    List<PageRouteInfo>? children,
  }) : super(
          CategoryDetailRoute.name,
          args: CategoryDetailRouteArgs(
            key: key,
            getIndex: getIndex,
          ),
          initialChildren: children,
        );

  static const String name = 'CategoryDetailRoute';

  static const PageInfo<CategoryDetailRouteArgs> page =
      PageInfo<CategoryDetailRouteArgs>(name);
}

class CategoryDetailRouteArgs {
  const CategoryDetailRouteArgs({
    this.key,
    required this.getIndex,
  });

  final Key? key;

  final int getIndex;

  @override
  String toString() {
    return 'CategoryDetailRouteArgs{key: $key, getIndex: $getIndex}';
  }
}

/// generated route for
/// [HomaPage]
class HomaRoute extends PageRouteInfo<HomaRouteArgs> {
  HomaRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          HomaRoute.name,
          args: HomaRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomaRoute';

  static const PageInfo<HomaRouteArgs> page = PageInfo<HomaRouteArgs>(name);
}

class HomaRouteArgs {
  const HomaRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'HomaRouteArgs{key: $key}';
  }
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterPage]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BookDetailPage]
class BookDetailRoute extends PageRouteInfo<BookDetailRouteArgs> {
  BookDetailRoute({
    Key? key,
    required int getIndex1,
    List<PageRouteInfo>? children,
  }) : super(
          BookDetailRoute.name,
          args: BookDetailRouteArgs(
            key: key,
            getIndex1: getIndex1,
          ),
          initialChildren: children,
        );

  static const String name = 'BookDetailRoute';

  static const PageInfo<BookDetailRouteArgs> page =
      PageInfo<BookDetailRouteArgs>(name);
}

class BookDetailRouteArgs {
  const BookDetailRouteArgs({
    this.key,
    required this.getIndex1,
  });

  final Key? key;

  final int getIndex1;

  @override
  String toString() {
    return 'BookDetailRouteArgs{key: $key, getIndex1: $getIndex1}';
  }
}
