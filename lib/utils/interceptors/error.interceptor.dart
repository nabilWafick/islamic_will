import 'package:dio/dio.dart';
import 'package:islamic_will/utils/helpers.util.dart';
import 'package:toastification/toastification.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onResponse(response, ResponseInterceptorHandler handler) {
    if (!"${response.statusCode}".startsWith('2')) {
      Helpers.showToast(
        style: ToastificationStyle.minimal,
        type: ToastificationType.error,
        title: "Error",
        description: "${response.statusCode} with ${response.data}",
      );
    }
    return handler.next(response);
  }
}
