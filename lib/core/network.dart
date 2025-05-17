//step-0
import 'package:dio/dio.dart';

class DioFactory {
  static Dio createDio() {
    final BaseOptions options = BaseOptions(
      baseUrl: "https://exam.elevateegy.com/api/v1",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );

    final dio = Dio(options);


    return dio;
  }
}
