import 'package:common/di/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:laprea/generated/localization/l10n.dart';
import 'package:laprea/navigation/router/router.dart';
import 'package:laprea/ui_kit/theme/theme.dart';
import 'package:laprea/ui_kit/theme/theme_provider.dart';
import 'package:laprea/utilites/log/l.dart';
import 'package:talker_flutter/talker_flutter.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    final themeNotifier = context.watch<ThemeNotifier>();
    return MaterialApp.router(
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
            data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
            child: child,
          );
        }

        return const SizedBox.shrink();
      },
      debugShowCheckedModeBanner: false,
      routerConfig: getIt<AppRouter>().config(
        navigatorObservers: () => [
          TalkerRouteObserver(L.talker),
        ],
      ),
    );
  }
}
