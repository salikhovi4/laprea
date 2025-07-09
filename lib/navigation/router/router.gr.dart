// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;
import 'package:laprea/feature/appointment/di/appointment_views.dart' as _i1;
import 'package:laprea/feature/appointment/presentation/select_date/select_date_page.dart'
    as _i8;
import 'package:laprea/feature/appointment/presentation/select_favor/select_favor_page.dart'
    as _i10;
import 'package:laprea/feature/appointment/presentation/select_favor_category/select_favor_category_page.dart'
    as _i9;
import 'package:laprea/feature/appointment/presentation/select_specialist/select_specialist_page.dart'
    as _i12;
import 'package:laprea/feature/appointment/presentation/select_specialist_category/select_specialist_category_page.dart'
    as _i11;
import 'package:laprea/feature/favors/di/favors_views.dart' as _i5;
import 'package:laprea/feature/favors/presentation/favor_list/favor_list_page.dart'
    as _i4;
import 'package:laprea/feature/home/di/home_views.dart' as _i6;
import 'package:laprea/feature/profile/di/profile_views.dart' as _i7;
import 'package:laprea/feature/splash/di/splash_views.dart' as _i13;
import 'package:laprea/navigation/bottom_bar/bottom_bar.dart' as _i2;
import 'package:laprea/navigation/router/empty_router.dart' as _i3;

/// generated route for
/// [_i1.AppointmentMainScreen]
class AppointmentMainRoute extends _i14.PageRouteInfo<void> {
  const AppointmentMainRoute({List<_i14.PageRouteInfo>? children})
    : super(AppointmentMainRoute.name, initialChildren: children);

  static const String name = 'AppointmentMainRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i1.AppointmentMainScreen();
    },
  );
}

/// generated route for
/// [_i1.AppointmentRoute]
class AppointmentRouteRoot extends _i14.PageRouteInfo<void> {
  const AppointmentRouteRoot({List<_i14.PageRouteInfo>? children})
    : super(AppointmentRouteRoot.name, initialChildren: children);

  static const String name = 'AppointmentRouteRoot';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i1.AppointmentRoute();
    },
  );
}

/// generated route for
/// [_i2.BottomBar]
class BottomBar extends _i14.PageRouteInfo<void> {
  const BottomBar({List<_i14.PageRouteInfo>? children})
    : super(BottomBar.name, initialChildren: children);

  static const String name = 'BottomBar';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i2.BottomBar();
    },
  );
}

/// generated route for
/// [_i3.EmptyRouter]
class EmptyRoute extends _i14.PageRouteInfo<void> {
  const EmptyRoute({List<_i14.PageRouteInfo>? children})
    : super(EmptyRoute.name, initialChildren: children);

  static const String name = 'EmptyRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i3.EmptyRouter();
    },
  );
}

/// generated route for
/// [_i4.FavorListPage]
class FavorListRoute extends _i14.PageRouteInfo<FavorListRouteArgs> {
  FavorListRoute({
    _i15.Key? key,
    required String title,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         FavorListRoute.name,
         args: FavorListRouteArgs(key: key, title: title),
         initialChildren: children,
       );

  static const String name = 'FavorListRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FavorListRouteArgs>();
      return _i4.FavorListPage(key: args.key, title: args.title);
    },
  );
}

class FavorListRouteArgs {
  const FavorListRouteArgs({this.key, required this.title});

  final _i15.Key? key;

  final String title;

  @override
  String toString() {
    return 'FavorListRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i5.FavorsMainScreen]
class FavorsMainRoute extends _i14.PageRouteInfo<void> {
  const FavorsMainRoute({List<_i14.PageRouteInfo>? children})
    : super(FavorsMainRoute.name, initialChildren: children);

  static const String name = 'FavorsMainRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i5.FavorsMainScreen();
    },
  );
}

/// generated route for
/// [_i5.FavorsRoute]
class FavorsRouteRoot extends _i14.PageRouteInfo<void> {
  const FavorsRouteRoot({List<_i14.PageRouteInfo>? children})
    : super(FavorsRouteRoot.name, initialChildren: children);

  static const String name = 'FavorsRouteRoot';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i5.FavorsRoute();
    },
  );
}

/// generated route for
/// [_i6.HomeMainScreen]
class HomeMainRoute extends _i14.PageRouteInfo<void> {
  const HomeMainRoute({List<_i14.PageRouteInfo>? children})
    : super(HomeMainRoute.name, initialChildren: children);

  static const String name = 'HomeMainRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i6.HomeMainScreen();
    },
  );
}

/// generated route for
/// [_i6.HomeRoute]
class HomeRouteRoot extends _i14.PageRouteInfo<void> {
  const HomeRouteRoot({List<_i14.PageRouteInfo>? children})
    : super(HomeRouteRoot.name, initialChildren: children);

  static const String name = 'HomeRouteRoot';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i6.HomeRoute();
    },
  );
}

/// generated route for
/// [_i7.ProfileMainScreen]
class ProfileMainRoute extends _i14.PageRouteInfo<void> {
  const ProfileMainRoute({List<_i14.PageRouteInfo>? children})
    : super(ProfileMainRoute.name, initialChildren: children);

  static const String name = 'ProfileMainRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i7.ProfileMainScreen();
    },
  );
}

/// generated route for
/// [_i7.ProfileRoute]
class ProfileRouteRoot extends _i14.PageRouteInfo<void> {
  const ProfileRouteRoot({List<_i14.PageRouteInfo>? children})
    : super(ProfileRouteRoot.name, initialChildren: children);

  static const String name = 'ProfileRouteRoot';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i7.ProfileRoute();
    },
  );
}

/// generated route for
/// [_i7.ProfileVisitsScreen]
class ProfileVisitsRoute extends _i14.PageRouteInfo<void> {
  const ProfileVisitsRoute({List<_i14.PageRouteInfo>? children})
    : super(ProfileVisitsRoute.name, initialChildren: children);

  static const String name = 'ProfileVisitsRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i7.ProfileVisitsScreen();
    },
  );
}

/// generated route for
/// [_i8.SelectDatePage]
class SelectDateRoute extends _i14.PageRouteInfo<void> {
  const SelectDateRoute({List<_i14.PageRouteInfo>? children})
    : super(SelectDateRoute.name, initialChildren: children);

  static const String name = 'SelectDateRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i8.SelectDatePage();
    },
  );
}

/// generated route for
/// [_i9.SelectFavorCategoryPage]
class SelectFavorCategoryRoute extends _i14.PageRouteInfo<void> {
  const SelectFavorCategoryRoute({List<_i14.PageRouteInfo>? children})
    : super(SelectFavorCategoryRoute.name, initialChildren: children);

  static const String name = 'SelectFavorCategoryRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i9.SelectFavorCategoryPage();
    },
  );
}

/// generated route for
/// [_i10.SelectFavorPage]
class SelectFavorRoute extends _i14.PageRouteInfo<SelectFavorRouteArgs> {
  SelectFavorRoute({
    _i15.Key? key,
    required String title,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         SelectFavorRoute.name,
         args: SelectFavorRouteArgs(key: key, title: title),
         initialChildren: children,
       );

  static const String name = 'SelectFavorRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SelectFavorRouteArgs>();
      return _i10.SelectFavorPage(key: args.key, title: args.title);
    },
  );
}

class SelectFavorRouteArgs {
  const SelectFavorRouteArgs({this.key, required this.title});

  final _i15.Key? key;

  final String title;

  @override
  String toString() {
    return 'SelectFavorRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i11.SelectSpecialistCategoryPage]
class SelectSpecialistCategoryRoute extends _i14.PageRouteInfo<void> {
  const SelectSpecialistCategoryRoute({List<_i14.PageRouteInfo>? children})
    : super(SelectSpecialistCategoryRoute.name, initialChildren: children);

  static const String name = 'SelectSpecialistCategoryRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i11.SelectSpecialistCategoryPage();
    },
  );
}

/// generated route for
/// [_i12.SelectSpecialistPage]
class SelectSpecialistRoute
    extends _i14.PageRouteInfo<SelectSpecialistRouteArgs> {
  SelectSpecialistRoute({
    _i15.Key? key,
    required String title,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         SelectSpecialistRoute.name,
         args: SelectSpecialistRouteArgs(key: key, title: title),
         initialChildren: children,
       );

  static const String name = 'SelectSpecialistRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SelectSpecialistRouteArgs>();
      return _i12.SelectSpecialistPage(key: args.key, title: args.title);
    },
  );
}

class SelectSpecialistRouteArgs {
  const SelectSpecialistRouteArgs({this.key, required this.title});

  final _i15.Key? key;

  final String title;

  @override
  String toString() {
    return 'SelectSpecialistRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i13.SplashScreen]
class SplashRoute extends _i14.PageRouteInfo<void> {
  const SplashRoute({List<_i14.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i13.SplashScreen();
    },
  );
}
