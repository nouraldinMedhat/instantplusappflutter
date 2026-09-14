import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:instantplus/resources/constants.dart';
import 'package:instantplus/resources/loading_overlay.dart';
import 'package:instantplus/resources/services_resources.dart';
import 'package:instantplus/resources/shared_pref.dart';
import 'package:instantplus/reusable_components/toast.dart';

class LogColor {
  static const reset = '\x1B[0m';
  static const cyan = '\x1B[36m';
  static const yellow = '\x1B[33m';
  static const green = '\x1B[32m';
  static const red = '\x1B[31m';
  static const magenta = '\x1B[35m';
}

class DioErrorHandler {
  static Future<String> handle(DioException error) async {
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.sendTimeout) {
      return 'انتهت مهلة الاتصال. تحقق من الإنترنت.';
    }

    if (error.type == DioExceptionType.cancel) {
      return 'تم إلغاء الطلب.';
    }

    if (error.type == DioExceptionType.badResponse) {
      final statusCode = error.response?.statusCode ?? 0;
      final data = error.response?.data;

      final message = data is Map && data.containsKey('message')
          ? data['message'].toString()
          : data is Map && data.containsKey('error')
              ? data['error'].toString()
              : 'الخدمة قيد الصيانة، حاول لاحقاً';

      switch (statusCode) {
        case 401:
          await ServicesResources.removeToken();
          return message;
        case 400:
        case 403:
        case 404:
        case 422:
          return message;
        case 500:
          return 'خطأ في الخادم. حاول لاحقاً.';
        default:
          return 'حدث خطأ غير متوقع';
      }
    }

    if (error.type == DioExceptionType.unknown) {
      return 'حدث خطأ غير متوقع. حاول مرة أخرى.';
    }

    return 'حدث خطأ في الشبكة.';
  }
}

class DioClient {
  static final DioClient _instance = DioClient._internal();

  factory DioClient() => _instance;

  late final Dio _dio;

  Dio get dio => _dio;

  DioClient._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: kApiBaseUrl,
        connectTimeout: const Duration(minutes: 1),
        receiveTimeout: const Duration(minutes: 1),
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await SharedPrefUtils.readToken();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          options.headers['Accept'] = 'application/json';

          debugPrint(
            '${LogColor.cyan}⬆️ REQUEST [${options.method}] ${options.uri}${LogColor.reset}',
          );
          handler.next(options);
        },
        onResponse: (response, handler) {
          debugPrint(
            '${LogColor.green}⬇️ RESPONSE [${response.statusCode}] ${response.requestOptions.uri}${LogColor.reset}',
          );
          handler.next(response);
        },
        onError: (error, handler) async {
          final message = await DioErrorHandler.handle(error);
          await LoadingOverlay.hide();
          showToast(message);
          debugPrint('${LogColor.red}❌ $message${LogColor.reset}');
          handler.next(error);
        },
      ),
    );
  }

  Future<Response?> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    bool showLoading = true,
  }) async {
    try {
      if (showLoading) LoadingOverlay.show();
      final response = await _dio.get(path, queryParameters: queryParameters);
      return response;
    } on DioException {
      return null;
    } finally {
      if (showLoading) await LoadingOverlay.hide();
    }
  }

  Future<Response?> post(
    String path, {
    dynamic data,
    bool showLoading = true,
  }) async {
    try {
      if (showLoading) LoadingOverlay.show();
      final response = await _dio.post(path, data: data);
      return response;
    } on DioException {
      return null;
    } finally {
      if (showLoading) await LoadingOverlay.hide();
    }
  }
}
