import 'package:dio/dio.dart';

class DioSetting {
  final Dio dio;

  DioSetting()
      : dio = Dio(
          BaseOptions(
            baseUrl: 'https://icanhazdadjoke.com/',
            connectTimeout: const Duration(milliseconds: 10000),
            sendTimeout: const Duration(milliseconds: 10000),
            receiveTimeout: const Duration(milliseconds: 10000),
          ),
        ) {
    _addInterceptors();
  }

  void _addInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
         
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
        
          return handler.next(response);
        },
        onError: (DioException error, ErrorInterceptorHandler handler) {
         
          return handler.next(error);
        },
      ),
    );
  }
}
