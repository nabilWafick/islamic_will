import 'package:islamic_will/utils/prefs.util.dart';
import 'package:dio/dio.dart';

class TokenInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Content-Type'] = 'application/json';
    final token = getAppToken;
    if (!options.path.contains('login') && token != null) {
      options.headers['Authorization'] = 'Bearer $getAppToken';
    }
    super.onRequest(options, handler);
  }

  // @override
  // void onError(DioException err, ErrorInterceptorHandler handler) async {
  //   if (err.response?.statusCode == 401 && !err.requestOptions.path.endsWith('login')) {
  //     if (getRefreshToken?.isNotEmpty ?? false) {
  //       final service = ApiService();
  //       final res = await service.getRefreshToken();
  //       if (res) return handler.resolve(await service.client.fetch(err.requestOptions));
  //     }
  //   }
  //   super.onError(err, handler);
  // }
}
