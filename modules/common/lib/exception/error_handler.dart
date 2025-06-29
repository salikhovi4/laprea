typedef MessageListener = void Function(ErrorMessage message);

abstract class ErrorHandler {
  void proceed(Exception error, [MessageListener? listener]);
}

class ErrorMessage {
  /// Сообщение об ошибке, обрабатываемое внутри Блока с помощью [ErrorHandler]
  const ErrorMessage({
    required this.message,
    this.id,
  });

  /// Текстовое сообщение, которое раньше передавалось напрямую в [MessageListener]
  final String message;
  final String? id;
}
