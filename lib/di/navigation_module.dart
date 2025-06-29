import 'package:common/di/get_it.dart';
import 'package:get_it/get_it.dart';
import 'package:laprea/navigation/router/router.dart';

final class NavigationDiModule extends BaseDIModule{
  @override
  void updateInjections(GetIt instance) {
    final router = AppRouter();
    instance.registerSingleton<AppRouter>(router);
  }

}