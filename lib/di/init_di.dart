import 'package:common/di/get_it.dart';
import 'package:get_it/get_it.dart';
import 'package:laprea/di/core_di_module.dart';
import 'package:laprea/di/navigation_module.dart';
import 'package:laprea/di/service_module.dart';

void initDi() {
  final instance = GetIt.instance;

  instance.installModule(CoreDIModule());
  instance.installModule(ServiceDIModule());
  // instance.installModule(NetDIModule(apiConfig: apiConfig));
  instance.installModule(NavigationDiModule());
}
