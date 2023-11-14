import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'dio_exceptions.dart';

class DioInterceptors extends Interceptor {
  final Dio dio;

  DioInterceptors({required this.dio});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint("API Request --> ${options.method} ${options.path}");
    debugPrint("Content type: ${options.contentType}");
    debugPrint("<-- END HTTP");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    int maxCharactersPerLine = 200;

    debugPrint(
        "API Response <-- ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.path}");
    String responseAsString = response.data.toString();
    if (responseAsString.length > maxCharactersPerLine) {
      int iterations = (responseAsString.length / maxCharactersPerLine).floor();
      for (int i = 0; i <= iterations; i++) {
        int endingIndex = i * maxCharactersPerLine + maxCharactersPerLine;
        if (endingIndex > responseAsString.length) {
          endingIndex = responseAsString.length;
        }
        debugPrint(
            responseAsString.substring(i * maxCharactersPerLine, endingIndex));
      }
    } else {
      debugPrint(response.data);
    }
    debugPrint("<-- END HTTP");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint("API Error <-- ${err.error} ${err.message}");
    debugPrint("request: ${err.requestOptions}");
    debugPrint("response: ${err.response}");
    debugPrint("<-- END HTTP");

    DioExceptions exceptions = DioExceptions.fromDioError(err);
    debugPrint('=====>> $exceptions <<=====');
    throw exceptions;
  }
}