import 'package:common/exception/common_exceptions.dart';
import 'package:common/exception/error_handler.dart';

class DefaultErrorHandler extends ErrorHandler {
  final _handlers = <Type, Function>{};

  /// В теле конструктора добавляем обработчики для каждого типа ошибки
  DefaultErrorHandler() {
    addBasicHandlers();
  }

  /// Добавляет/обновляет обработчик ошибки определенного типа в [_handlers].
  void addHandler<T extends Exception>(void Function(T, [MessageListener?]) handler) {
    _handlers[T] = handler;
  }

  /// Добавляет обработчики для всех базовых типов ошибок
  void addBasicHandlers() {
  }

  /// Удаляет обработчик для указанного типа ошибки
  void removeHandler(Type type) {
    _handlers.remove(type);
  }

  /// Метод для обработки ошибок. Ищет тип ошибки в [_handlers], после чего
  /// вызывает соответствующий обработчик. Если нужного обработчика нет, вызывается [onOtherException].
  @override
  void proceed(Exception error, [MessageListener? listener]) {
    final type = error.runtimeType;
    final handler = _handlers[type] ?? onOtherException;
    handler(error, listener);
  }

  void onCancelationException(ParsingException error, [MessageListener? listener]) {
    const message = ErrorTexts.serviceCodeExceptionErrorText;
    listener?.call(ErrorMessage(id: error.id, message: message));
  }

  void onParsingException(ParsingException error, [MessageListener? listener]) {
    const message = ErrorTexts.serviceCodeExceptionErrorText;
    listener?.call(ErrorMessage(id: error.id, message: message));
  }

  void onHttpResponseBodyIsEmptyException(HttpResponseBodyIsEmptyException error, [MessageListener? listener]) {
    const message = ErrorTexts.serviceCodeExceptionErrorText;
    listener?.call(ErrorMessage(id: error.id, message: message));
  }

  void onConnectionException(ConnectionException error, [MessageListener? listener]) {
    const message = ErrorTexts.connectionExceptionErrorText;
    listener?.call(ErrorMessage(id: error.id, message: message));
  }

  void onServerConnectionException(ServerConnectionException error, [MessageListener? listener]) {
    const message = ErrorTexts.serverConnectionExceptionErrorText;
    listener?.call(ErrorMessage(id: error.id, message: message));
  }

  void onTimeoutException(TimeoutException error, [MessageListener? listener]) {
    const message = ErrorTexts.timeoutExceptionErrorText;
    listener?.call(ErrorMessage(id: error.id, message: message));
  }

  void onSessionExpiredException(SessionExpiredException error, [MessageListener? listener]) {
    const message = ErrorTexts.sessionExpiredExceptionErrorText;
    listener?.call(ErrorMessage(id: error.id, message: message));
  }

  void onValidationException(ValidationException error, [MessageListener? listener]) {
    final message = error.message ?? ErrorTexts.serviceCodeExceptionErrorText;
    listener?.call(ErrorMessage(id: error.id, message: message));
  }

  void onServerErrorException(ServerErrorException error, [MessageListener? listener]) {
    const message = ErrorTexts.serverErrorExceptionErrorText;
    listener?.call(ErrorMessage(id: error.id, message: message));
  }

  /// В [listener] передается [error.message]
  void onServiceCodeException(ServiceCodeException error, [MessageListener? listener]) {
    final message = error.message ?? ErrorTexts.serviceCodeExceptionErrorText;
    listener?.call(ErrorMessage(id: error.id, message: message));
  }

  /// В [listener] передается [error.message]
  void onResponseException(ResponseException error, [MessageListener? listener]) {
    final message = error.message ?? ErrorTexts.serviceCodeExceptionErrorText;
    listener?.call(ErrorMessage(id: error.id, message: message));
  }

  void onInterruptedPullingException(InterruptedPullingException error, [MessageListener? listener]) {
    const message = ErrorTexts.serviceCodeExceptionErrorText;
    listener?.call(const ErrorMessage(message: message));
  }

  void onUnknownException(UnknownException error, [MessageListener? listener]) {
    const message = ErrorTexts.unknownExceptionErrorText;
    listener?.call(ErrorMessage(id: error.id, message: message));
  }

  /// Вызывается, когда тип ошибки не найден в [_handlers]
  void onOtherException(Exception error, [MessageListener? listener]) {
    const message = ErrorTexts.unknownExceptionErrorText;
    listener?.call(const ErrorMessage(message: message));
  }
}


/// TODO локализовать Тексты ошибок в зависимости от типа ошибки
abstract class ErrorTexts {
  static const connectionExceptionErrorText = 'Проверьте интернет соединение';
  static const serverConnectionExceptionErrorText = 'Ошибка сервера.\nПовторите попытку позже';
  static const timeoutExceptionErrorText = 'Ошибка выполнения запроса.\nПовторите попытку позже';
  static const sessionExpiredExceptionErrorText = 'Время сессии истекло.\nПовторите попытку позже';
  static const serviceCodeExceptionErrorText = 'Ошибка выполнения запроса.\nПовторите попытку позже';
  static const serverErrorExceptionErrorText = 'Ошибка сервера.\nПовторите попытку позже';
  static const unknownExceptionErrorText = 'Ошибка выполнения запроса.\nПовторите попытку позже';
  static const parsingExceptionErrorText = 'Ошибка парсинга данных';
}
