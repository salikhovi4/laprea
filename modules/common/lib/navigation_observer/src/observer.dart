
import 'package:common/navigation_observer/src/route_data.dart';
import 'package:common/navigation_observer/src/route_observer.dart';

typedef RouteHandler = void Function(NavigationRouteData, NavigationRouteData?);

/// Основной класс, который хранит обсерверы и применяет их на нужные роуты и события
///
/// Для регистрации обсервера необходимо вызывать [register]
class NavigationObserver {
  final List<MagnumRouteObserver> _observers = [];

  void register(MagnumRouteObserver observer) {
    _observers.add(observer);
  }

  void unregister(MagnumRouteObserver observer) {
    _observers.remove(observer);
  }

  void didPop(NavigationRouteData route, NavigationRouteData? previousRoute) => _applyObservers(
        route,
        previousRoute,
        (observer) => observer.didPop,
      );

  void didPush(NavigationRouteData route, NavigationRouteData? previousRoute) => _applyObservers(
        route,
        previousRoute,
        (observer) => observer.didPush,
      );

  void didRemove(NavigationRouteData route, NavigationRouteData? previousRoute) => _applyObservers(
        route,
        previousRoute,
        (observer) => observer.didRemove,
      );

  void _applyObservers(
    NavigationRouteData route,
    NavigationRouteData? previousRoute,
    RouteHandler Function(MagnumRouteObserver)? applyFn,
  ) {
    for (final observer in _observers) {
      if (observer.selectors.any((e) => e.triggered(route, previousRoute))) {
        applyFn?.call(observer)(route, previousRoute);
      }
    }
  }
}
