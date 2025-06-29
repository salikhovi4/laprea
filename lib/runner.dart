import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:laprea/app.dart';
import 'package:laprea/di/init_di.dart';
import 'package:laprea/ui_kit/theme/theme_provider.dart';
import 'package:laprea/utilites/bloc_observer/bloc_observer.dart';
import 'package:provider/provider.dart';

class Runner {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = BlocCustomObserver();
    // initDi(_createApiConfig());
    initDi();
  }

  static void run() async {
    // final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    runApp(ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: const App(),
    ));
  }

  // static ApiConfig _createApiConfig() => ApiConfig(
  //       baseConfig: UrlConfig(
  //         url: "https://magnum-dev.magnumestate.co/api/v1/",
  //         isLoggingEnable: true,
  //         timeout: const Duration(seconds: 30),
  //       ),
  //       jwtConfig: UrlConfig(url: "https://magnum-dev.magnumestate.co/api/v1/", isLoggingEnable: true),
  //       unauthorizedConfig: UrlConfig(
  //         url: "https://magnum-dev.magnumestate.co/api/v1/",
  //         isLoggingEnable: true,
  //         timeout: const Duration(seconds: 30),
  //       ),
  //     );
}
