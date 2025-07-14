import 'package:common/di/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:laprea/feature/appointment/presentation/main/cubit/appointment_cubit.dart';
import 'package:laprea/generated/localization/l10n.dart';
import 'package:laprea/navigation/router/router.dart';
import 'package:laprea/ui_kit/theme/theme.dart';
import 'package:laprea/ui_kit/theme/theme_provider.dart';
import 'package:laprea/utilites/log/l.dart';
import 'package:talker_flutter/talker_flutter.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final AppointmentCubit _appointmentCubit = AppointmentCubit();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    _appointmentCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = context.watch<ThemeNotifier>();
    return BlocProvider(
      create: (context) => _appointmentCubit,
      child: MaterialApp.router(
        theme: ThemeConfiguration.light,
        darkTheme: ThemeConfiguration.dark,
        themeMode: themeNotifier.themeMode,
        locale: const Locale('ru'),
        supportedLocales: const [Locale('en'), Locale('ru')],
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        builder: (context, child) {
          if (child != null) {
            return MediaQuery(
              data: MediaQuery.of(
                context,
              ).copyWith(textScaler: TextScaler.noScaling),
              child: child,
            );
          }

          return const SizedBox.shrink();
        },
        debugShowCheckedModeBanner: false,
        routerConfig: getIt<AppRouter>().config(
          navigatorObservers: () => [TalkerRouteObserver(L.talker)],
        ),
      ),
    );
  }
}
