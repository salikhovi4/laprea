// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;
import 'package:laprea/feature/appointment/di/appointment_views.dart' as _i1;
import 'package:laprea/feature/appointment/presentation/select_date/select_date_page.dart'
    as _i7;
import 'package:laprea/feature/appointment/presentation/select_favor_category/select_favor_category_page.dart'
    as _i8;
import 'package:laprea/feature/appointment/presentation/select_specialist/select_specialist_page.dart'
    as _i10;
import 'package:laprea/feature/appointment/presentation/select_specialist_category/select_specialist_category_page.dart'
    as _i9;
import 'package:laprea/feature/favors/data/models/service_data.dart' as _i15;
import 'package:laprea/feature/favors/di/favors_views.dart' as _i4;
import 'package:laprea/feature/favors/presentation/service_list/favor_list_page.dart'
    as _i11;
import 'package:laprea/feature/home/di/home_views.dart' as _i5;
import 'package:laprea/feature/profile/di/profile_views.dart' as _i6;
import 'package:laprea/feature/splash/di/splash_views.dart' as _i12;
import 'package:laprea/navigation/bottom_bar/bottom_bar.dart' as _i2;
import 'package:laprea/navigation/router/empty_router.dart' as _i3;

/// generated route for
/// [_i1.AppointmentMainScreen]
class AppointmentMainRoute extends _i13.PageRouteInfo<void> {
  const AppointmentMainRoute({List<_i13.PageRouteInfo>? children})
    : super(AppointmentMainRoute.name, initialChildren: children);

  static const String name = 'AppointmentMainRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i1.AppointmentMainScreen();
    },
  );
}

/// generated route for
/// [_i1.AppointmentRoute]
class AppointmentRouteRoot extends _i13.PageRouteInfo<void> {
  const AppointmentRouteRoot({List<_i13.PageRouteInfo>? children})
    : super(AppointmentRouteRoot.name, initialChildren: children);

  static const String name = 'AppointmentRouteRoot';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i1.AppointmentRoute();
    },
  );
}

/// generated route for
/// [_i2.BottomBar]
class BottomBar extends _i13.PageRouteInfo<void> {
  const BottomBar({List<_i13.PageRouteInfo>? children})
    : super(BottomBar.name, initialChildren: children);

  static const String name = 'BottomBar';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i2.BottomBar();
    },
  );
}

/// generated route for
/// [_i3.EmptyRouter]
class EmptyRoute extends _i13.PageRouteInfo<void> {
  const EmptyRoute({List<_i13.PageRouteInfo>? children})
    : super(EmptyRoute.name, initialChildren: children);

  static const String name = 'EmptyRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i3.EmptyRouter();
    },
  );
}

/// generated route for
/// [_i4.FavorsMainScreen]
class FavorsMainRoute extends _i13.PageRouteInfo<void> {
  const FavorsMainRoute({List<_i13.PageRouteInfo>? children})
    : super(FavorsMainRoute.name, initialChildren: children);

  static const String name = 'FavorsMainRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i4.FavorsMainScreen();
    },
  );
}

/// generated route for
/// [_i4.FavorsRoute]
class FavorsRouteRoot extends _i13.PageRouteInfo<void> {
  const FavorsRouteRoot({List<_i13.PageRouteInfo>? children})
    : super(FavorsRouteRoot.name, initialChildren: children);

  static const String name = 'FavorsRouteRoot';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i4.FavorsRoute();
    },
  );
}

/// generated route for
/// [_i5.HomeMainScreen]
class HomeMainRoute extends _i13.PageRouteInfo<void> {
  const HomeMainRoute({List<_i13.PageRouteInfo>? children})
    : super(HomeMainRoute.name, initialChildren: children);

  static const String name = 'HomeMainRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i5.HomeMainScreen();
    },
  );
}

/// generated route for
/// [_i5.HomeRoute]
class HomeRouteRoot extends _i13.PageRouteInfo<void> {
  const HomeRouteRoot({List<_i13.PageRouteInfo>? children})
    : super(HomeRouteRoot.name, initialChildren: children);

  static const String name = 'HomeRouteRoot';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i5.HomeRoute();
    },
  );
}

/// generated route for
/// [_i6.ProfileMainScreen]
class ProfileMainRoute extends _i13.PageRouteInfo<void> {
  const ProfileMainRoute({List<_i13.PageRouteInfo>? children})
    : super(ProfileMainRoute.name, initialChildren: children);

  static const String name = 'ProfileMainRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i6.ProfileMainScreen();
    },
  );
}

/// generated route for
/// [_i6.ProfileRoute]
class ProfileRouteRoot extends _i13.PageRouteInfo<void> {
  const ProfileRouteRoot({List<_i13.PageRouteInfo>? children})
    : super(ProfileRouteRoot.name, initialChildren: children);

  static const String name = 'ProfileRouteRoot';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i6.ProfileRoute();
    },
  );
}

/// generated route for
/// [_i6.ProfileVisitsScreen]
class ProfileVisitsRoute extends _i13.PageRouteInfo<void> {
  const ProfileVisitsRoute({List<_i13.PageRouteInfo>? children})
    : super(ProfileVisitsRoute.name, initialChildren: children);

  static const String name = 'ProfileVisitsRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i6.ProfileVisitsScreen();
    },
  );
}

/// generated route for
/// [_i7.SelectDatePage]
class SelectDateRoute extends _i13.PageRouteInfo<void> {
  const SelectDateRoute({List<_i13.PageRouteInfo>? children})
    : super(SelectDateRoute.name, initialChildren: children);

  static const String name = 'SelectDateRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i7.SelectDatePage();
    },
  );
}

/// generated route for
/// [_i8.SelectFavorCategoryPage]
class SelectFavorCategoryRoute extends _i13.PageRouteInfo<void> {
  const SelectFavorCategoryRoute({List<_i13.PageRouteInfo>? children})
    : super(SelectFavorCategoryRoute.name, initialChildren: children);

  static const String name = 'SelectFavorCategoryRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i8.SelectFavorCategoryPage();
    },
  );
}

/// generated route for
/// [_i9.SelectSpecialistCategoryPage]
class SelectSpecialistCategoryRoute extends _i13.PageRouteInfo<void> {
  const SelectSpecialistCategoryRoute({List<_i13.PageRouteInfo>? children})
    : super(SelectSpecialistCategoryRoute.name, initialChildren: children);

  static const String name = 'SelectSpecialistCategoryRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i9.SelectSpecialistCategoryPage();
    },
  );
}

/// generated route for
/// [_i10.SelectSpecialistPage]
class SelectSpecialistRoute
    extends _i13.PageRouteInfo<SelectSpecialistRouteArgs> {
  SelectSpecialistRoute({
    _i14.Key? key,
    required String title,
    List<_i13.PageRouteInfo>? children,
  }) : super(
         SelectSpecialistRoute.name,
         args: SelectSpecialistRouteArgs(key: key, title: title),
         initialChildren: children,
       );

  static const String name = 'SelectSpecialistRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SelectSpecialistRouteArgs>();
      return _i10.SelectSpecialistPage(key: args.key, title: args.title);
    },
  );
}

class SelectSpecialistRouteArgs {
  const SelectSpecialistRouteArgs({this.key, required this.title});

  final _i14.Key? key;

  final String title;

  @override
  String toString() {
    return 'SelectSpecialistRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i11.ServiceListPage]
class ServiceListRoute extends _i13.PageRouteInfo<ServiceListRouteArgs> {
  ServiceListRoute({
    _i14.Key? key,
    required String title,
    required List<_i15.ServiceData> list,
    List<_i13.PageRouteInfo>? children,
  }) : super(
         ServiceListRoute.name,
         args: ServiceListRouteArgs(key: key, title: title, list: list),
         initialChildren: children,
       );

  static const String name = 'ServiceListRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ServiceListRouteArgs>();
      return _i11.ServiceListPage(
        key: args.key,
        title: args.title,
        list: args.list,
      );
    },
  );
}

class ServiceListRouteArgs {
  const ServiceListRouteArgs({
    this.key,
    required this.title,
    required this.list,
  });

  final _i14.Key? key;

  final String title;

  final List<_i15.ServiceData> list;

  @override
  String toString() {
    return 'ServiceListRouteArgs{key: $key, title: $title, list: $list}';
  }
}

/// generated route for
/// [_i12.SplashScreen]
class SplashRoute extends _i13.PageRouteInfo<void> {
  const SplashRoute({List<_i13.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i12.SplashScreen();
    },
  );
}
