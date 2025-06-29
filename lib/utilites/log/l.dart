import 'package:laprea/utilites/log/log_specific/log_specific.dart';
import 'package:talker_flutter/talker_flutter.dart';

class L {
  static Talker talker = Talker(
    logger: TalkerLogger(),
    settings: TalkerSettings(
      maxHistoryItems: 3000,
    ),
    filter: BaseTalkerFilter(),
  );

  L();

  static void init() {
    talker = TalkerFlutter.init(
      logger: TalkerLogger(),
      settings: TalkerSettings(
        maxHistoryItems: 3000,
      ),
      filter: BaseTalkerFilter(),
    );


    LogSpecific.init();
  }

  static void d(
      Object msg, [
        Object? exception,
        StackTrace? stackTrace,
      ]) {

    talker.debug(
      msg,
      exception,
      stackTrace,
    );
  }
}
