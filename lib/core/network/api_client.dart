import 'package:dio/dio.dart';

class ApiException implements Exception {
  const ApiException(this.message);
  final String message;

  @override
  String toString() => 'ApiException: $message';
}

class ApiClient {
  ApiClient(this._dio);

  final Dio _dio;

  Future<T> get<T>({
    required String path,
    required T Function(Map<String, dynamic> json) fromJson,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get<dynamic>(
        path,
        queryParameters: queryParameters,
      );

      final data = response.data;
      if (data is! Map<String, dynamic>) {
        throw const ApiException('Unexpected response format');
      }
      return fromJson(data);
    } on ApiException {
      rethrow;
    } on DioException catch (e) {
      throw ApiException(_messageFor(e));
    } catch (e) {
      throw ApiException('$e');
    }
  }

  Future<T> post<T>({
    required String path,
    required T Function(Map<String, dynamic> json) fromJson,
    Object? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.post<dynamic>(
        path,
        data: body,
        queryParameters: queryParameters,
      );

      final data = response.data;
      if (data is! Map<String, dynamic>) {
        throw const ApiException('Unexpected response format');
      }
      return fromJson(data);
    } on ApiException {
      rethrow;
    } on DioException catch (e) {
      throw ApiException(_messageFor(e));
    } catch (e) {
      throw ApiException('$e');
    }
  }
}

String _messageFor(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return 'Connection timed out. Please try again.';
    case DioExceptionType.connectionError:
      return 'No internet connection.';
    case DioExceptionType.badResponse:
      return 'Server error (${e.response?.statusCode}).';
    case DioExceptionType.cancel:
      return 'Request was cancelled.';
    case DioExceptionType.badCertificate:
      return 'Certificate error.';
    case DioExceptionType.unknown:
      return 'Something went wrong.';
    case DioExceptionType.transformTimeout:
      return 'Request timed out. Please try again.';
  }
}
