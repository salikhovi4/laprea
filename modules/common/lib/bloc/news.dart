import 'package:common/exception/error_handler.dart';
import 'package:flutter/foundation.dart';

abstract class BlocNews {}

class ErrorBlocNews extends BlocNews {
  final ErrorMessage errorMessage;

  ErrorBlocNews(this.errorMessage);
}

/// [retry] - колбэк, который будет вызван при нажатии на кнопку "Повторить"
class RetryErrorBlocNews extends BlocNews {
  final VoidCallback retry;
  final ErrorMessage errorMessage;

  RetryErrorBlocNews(this.retry, this.errorMessage);
}
