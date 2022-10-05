import 'package:dio/dio.dart';
import 'package:flutter_module/core/services/http_config.dart';

class HttpRequest {
  static final Dio dio = Dio()
    ..options.baseUrl = HttpConfig.baseUrl
    ..options.connectTimeout = HttpConfig.connectTimeout;

  static Future<T> request<T>(String path,
      {String method = "get", Map<String, dynamic>? params}) async {

    params ??= {};
    params["key"] = HttpConfig.key;

    try {
      Response response = await dio.request(path,
          options: Options(method: method), queryParameters: params);
      return response.data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }
}
