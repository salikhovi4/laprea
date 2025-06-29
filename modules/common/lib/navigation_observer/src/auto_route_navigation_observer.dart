import 'package:auto_route/auto_route.dart';
import 'package:common/navigation_observer/src/observer.dart';
import 'package:common/navigation_observer/src/route_data.dart';
import 'package:flutter/material.dart';

/// Адаптер над [NavigationObserver], позволяющий использовать его в routeConfig
/// с использованием библиотеки auto_route.
/// Адаптер позволяет регестрировать как события [Navigator] ([didPush], [didPop]),
/// так и события, характерные только для auto_route - [didInitTabRoute], [didChangeTabRoute].
/// Оба последних события вызывают [NavigationObserver.didPush]
class AutoRouteNavigationObserver extends AutoRouterObserver {
  final NavigationObserver observer;

  AutoRouteNavigationObserver(this.observer);

  @override
  void didPush(Route route, Route? previousRoute) {
    final previousRouteData = previousRoute == null ? null : NavigationRouteData.fromRoute(previousRoute);
    observer.didPush(NavigationRouteData.fromRoute(route), previousRouteData);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    final previousRouteData = previousRoute == null ? null : NavigationRouteData.fromRoute(previousRoute);
    observer.didPop(NavigationRouteData.fromRoute(route), previousRouteData);
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    final previousRouteData = previousRoute == null ? null : NavigationRouteData.fromTabRoute(previousRoute);
    observer.didPush(NavigationRouteData.fromTabRoute(route), previousRouteData);
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    observer.didPush(
      NavigationRouteData.fromTabRoute(route),
      NavigationRouteData.fromTabRoute(previousRoute),
    );
  }
}
