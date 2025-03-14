import 'dart:convert';
import 'package:islamic_will/utils/logger.util.dart';
import 'package:dio/dio.dart';

class LoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final data = options.data != null
        ? (options.data is FormData)
            ? "${[...options.data.fields, ...options.data.files]} "
            : jsonEncode(options.data)
        : null;
    AppLogger.w(
      "${options.method} ${data == null ? '' : "with $data"}",
      functionName: "Requesting ${options.path}",
    );
    return handler.next(options);
  }

  @override
  void onResponse(response, ResponseInterceptorHandler handler) {
    // Do something with response data.
    // If you want to reject the request with a error message,
    // you can reject a `DioException` object using `handler.reject(dioError)`.
    AppLogger.w(
      "${response.statusCode} ${jsonEncode(response.data)}",
      functionName: "Response ${response.requestOptions.path}",
    );
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Do something with response error.
    // If you want to resolve the request with some custom data,
    // you can resolve a `Response` object using `handler.resolve(response)`.
    AppLogger.e(
      "${err.response?.data} ${err.message}",
      functionName: "Error ${err.requestOptions.path}",
      error: err.error,
      stackTrace: err.stackTrace,
    );
    // if (error.response?.data?.containsKey("error") ?? false)
    //   CommonFunction.toastMessage(error.response?.data["error"]);
    return handler.next(err);
  }
}
