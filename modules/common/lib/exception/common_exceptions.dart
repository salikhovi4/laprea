abstract class ExceptionWithId {
  final String? id;

  const ExceptionWithId({required this.id});
}

/// Ошибка соединения (например, остуствие интернета)
class ConnectionException extends MagnumHttpException implements Exception {
  const ConnectionException({super.id});
}

/// Ошибка соединения (проблема с сервером)
class ServerConnectionException extends MagnumHttpException implements Exception {
  const ServerConnectionException({super.id});
}

/// Ошибка при истечении времени ожидания
class TimeoutException extends MagnumHttpException implements Exception {
  const TimeoutException({super.id});
}

/// Ошибка при завершении срока действия токена сессии
class SessionExpiredException extends MagnumHttpException implements Exception {
  const SessionExpiredException({super.id});
}

/// Ошибка валидации формы
class ValidationException extends MagnumHttpException implements Exception {
  const ValidationException({
    super.id,
    super.customCode,
    super.message,
    required this.fieldErrors,
  });

  final List<FieldError> fieldErrors;
}

/// Ошибка со статус-кодом и сообщением от бэка (4XX)
class ServiceCodeException extends MagnumHttpException implements Exception {
  const ServiceCodeException({
    super.id,
    super.code,
    super.statusMessage,
    super.customCode,
    super.message,
    this.data,
  });

  final CustomServerError? data;
}

/// Серверная ошибка, когда код = 5ХХ
class ServerErrorException extends MagnumHttpException implements Exception {
  const ServerErrorException({
    super.id,
    super.code,
    super.statusMessage,
    super.customCode,
    super.message,
  });
}

/// Ошибка когда статус-код = 200, но при этом что-то не так (бизнес-ошибка)
class ResponseException extends MagnumHttpException implements Exception {
  const ResponseException({super.id, required super.message});
}

/// Неизвестная ошибка, содержащая оригинальный объект исключения
class UnknownException extends MagnumHttpException implements Exception {
  final Object? originalException;

  const UnknownException({
    this.originalException,
    super.id,
  });
}

/// Ошибка когда статус-код = 200, если клиент пришел с повторным запросом слишком быстро
class TooManyRequestsException implements Exception {
  final String? message;

  const TooManyRequestsException({required this.message});
}

/// Ошибка прерывания запроса
class CancelationException extends MagnumHttpException implements Exception {
  const CancelationException({super.id});
}

/// Ошибка когда в процессе пуллинга был запущен новый пуллинг с тем же id
class InterruptedPullingException implements Exception {
  const InterruptedPullingException();
}

class ParsingException extends ExceptionWithId implements Exception {
  ParsingException({super.id});
}

class HttpResponseBodyIsEmptyException extends ExceptionWithId implements Exception {
  HttpResponseBodyIsEmptyException({super.id});
}

abstract class MagnumHttpException extends ExceptionWithId {
  /// Класс, содержащий поля, приходящие с бэка в общем случае при возникновении ошибки
  const MagnumHttpException({
    super.id,
    this.code,
    this.statusMessage,
    this.customCode,
    this.message,
  });

  /// HTTP-код ошибки
  final int? code;

  /// Сообщение, сопровождающее HTTP-код ошибки. Может быть технического характера
  final String? statusMessage;

  /// code из объекта error в теле ответа
  final String? customCode;

  /// Текстовое сообщение из объекта error в теле ответа
  final String? message;

  @override
  String toString() {
    return message ?? runtimeType.toString();
  }
}

class FieldError {
  /// Объект ошибки для одного поля. Используется в списке [ValidationException.fieldErrors]
  const FieldError({
    required this.field,
    required this.message,
  });

  /// Название поля
  final String field;

  /// Сообщение об ошибки для поля [field]
  final String message;
}

/// Кастомная ошибка с бэка
class CustomServerError {
  final ServerErrorTypes? type;
  final String? details;
  final String? attribute;
  final int? errorCode;

  CustomServerError({this.type, this.attribute, this.details, this.errorCode});

  factory CustomServerError.fromJson(Map<String, dynamic> json) {
    String? details;
    String? attribute;
    int? errorCode;
    ServerErrorTypes? errorType;
    if (json.containsKey('type')) {
      final typeName = json['type'];
      if (typeName is String) {
        errorType = _parseErrorType(typeName);
      }
    }

    if (json.containsKey('errors')) {
      final errors = json['errors'];
      if (errors is List<dynamic>) {
        for (final error in errors) {
          if (error is Map<String, dynamic>) {
            if (error.containsKey('detail')) {
              details = error['detail'];
            }
            if (error.containsKey('attr')) {
              attribute = error['attr'];
            }
            if (error.containsKey('e_code')) {
              errorCode = error['e_code'];
            }
          }
        }
      }
    }

    return CustomServerError(
      type: errorType,
      details: details,
      attribute: attribute,
      errorCode: errorCode,
    );
  }
}

enum ServerErrorTypes {
  validation, // ошибка валидации
  client, //
  unknown, // неизвестный
}

ServerErrorTypes _parseErrorType(String type) {
  if (type == 'validation_error') {
    return ServerErrorTypes.validation;
  } else if (type == 'client_error') {
    return ServerErrorTypes.client;
  } else {
    return ServerErrorTypes.unknown;
  }
}
