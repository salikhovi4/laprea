import 'package:dio/dio.dart';

class ClientException implements Exception {
  ClientException({
    this.errorCode,
    this.isError,
    this.errorText = 'Unknown error',
    this.requestOptions,
    this.dioExceptionType,
  });

  factory ClientException.unknown() => ClientException(
    errorText: 'Unknown error',
    dioExceptionType: DioExceptionType.unknown,
  );

  factory ClientException.fromResponse({
    required dynamic data,
    RequestOptions? requestOptions,
    DioExceptionType? dioExceptionType,
  }) {
    final json = data is Map ? data : {};
    return ClientException(
      errorCode: json['ErrorCode'],
      errorText: json['ErrorText'] ?? 'Unknown error',
      isError: json['IsError'] ?? false,
      requestOptions: requestOptions,
    );
  }

  final int? errorCode;
  final String? errorText;
  final bool? isError;
  final RequestOptions? requestOptions;
  final DioExceptionType? dioExceptionType;

  @override
  String toString() => '$errorText ${errorCode ?? ''}';
}

class DioClient {
  DioClient({
    String baseUrl = 'https://hit-test.b-office.ru:44343/api/',
  }) {
    _dio = Dio(
      BaseOptions(
        receiveTimeout: const Duration(minutes: 5),
        baseUrl: baseUrl,
        headers: {
          "Content-Type": "application/json",
        },
      ),
    )
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            return handler.next(options);
          },
          onError: (e, handler) {
            handler.next(e);
          },
        ),
      );
  }

  late final Dio _dio;

  Dio get dio => _dio;

  Future<T> get<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    Options? options,
    void Function(int, int)? onReceiveProgress,
  }) async {
    try {
      final result = await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
        onReceiveProgress: onReceiveProgress,
      );
      if (result.data is Map) {
        final errorText = (result.data as Map)['ErrorText'] as String?;
        if (errorText?.isNotEmpty ?? false) {
          throw ClientException(errorText: errorText);
        }
      }
      return result.data!;
    } on DioException catch (e, t) {
      Error.throwWithStackTrace(
        ClientException(
          errorText: e.message,
          requestOptions: e.requestOptions,
          dioExceptionType: e.type,
        ),
        t,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<T> post<T>({
    required String path,
    dynamic data,
    Options? options,
    void Function(int count, int total)? onSendProgress,
  }) async {
    try {
      final result = await _dio.post<T>(
        path,
        data: data,
        options: options,
        onSendProgress: onSendProgress,
      );
      if (result.data is Map) {
        final errorText = (result.data as Map)['ErrorText'] as String?;
        if (errorText?.isNotEmpty ?? false) {
          throw ClientException(errorText: errorText);
        }
      }
      return result.data!;
    } on DioException catch (e, t) {
      Error.throwWithStackTrace(
        ClientException(
          errorText: e.message,
          requestOptions: e.requestOptions,
          dioExceptionType: e.type,
        ),
        t,
      );
    } catch (e) {
      rethrow;
    }
  }
}
