import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../constants/app_constants.dart';

class ApiClient {
  final Dio _dio;

  ApiClient({String? baseUrl})
    : _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl ?? 'https://api.railgobd.com/v1/',
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'X-App-Country': AppConstants.countryCode,
            'X-App-Platform': defaultTargetPlatform.name,
          },
        ),
      ) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          debugPrint('API Request [${options.method}] => ${options.uri}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          debugPrint(
            'API Response [${response.statusCode}] => ${response.requestOptions.uri}',
          );
          return handler.next(response);
        },
        onError: (DioException error, handler) {
          debugPrint(
            'API Error [${error.response?.statusCode}] => ${error.message}',
          );
          return handler.next(error);
        },
      ),
    );
  }

  Dio get dio => _dio;

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _dio.get(path, queryParameters: queryParameters);
  }

  Future<Response> post(String path, {dynamic data}) async {
    return await _dio.post(path, data: data);
  }
}
