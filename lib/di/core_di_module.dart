import 'package:common/bloc/bloc_news_handler.dart';
import 'package:common/di/get_it.dart';
import 'package:common/exception/exception.dart';
import 'package:get_it/get_it.dart';
import 'package:laprea/common/bloc/presentation_error_handler_impl.dart';
import 'package:laprea/common/exception/default_error_handler.dart';

class CoreDIModule extends BaseDIModule {
  @override
  void updateInjections(GetIt instance) {
    instance.registerLazySingleton<BlocNewsHandler>(() => BlocNewsHandlerImpl());
    instance.registerFactory<ErrorHandler>(() => DefaultErrorHandler());
  }
}
