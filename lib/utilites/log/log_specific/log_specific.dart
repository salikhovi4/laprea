import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laprea/utilites/log/l.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_settings.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

class LogSpecific {
  const LogSpecific();

  static void init() {
    _setBlocObserver();
  }

  static void _setBlocObserver() {
    Bloc.observer = TalkerBlocObserver(
      talker: L.talker,
      settings: const TalkerBlocLoggerSettings(
        printChanges: true,
        printClosings: true,
        printCreations: true,
      ),
    );
  }

  static TalkerDioLogger get dioInterceptor => TalkerDioLogger(
    talker: L.talker,
    settings: const TalkerDioLoggerSettings(
      printRequestHeaders: true,
      printResponseHeaders: true,
    ),
  );
}
