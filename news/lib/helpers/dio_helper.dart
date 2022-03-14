import 'package:dio/dio.dart';
import 'package:news/utilities/constants/network_end_points.dart';

class DioHelper {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: BASE_URL,
      receiveDataWhenStatusError: true,
    ),
  );
  static Future<Response> getHttp({
    required url,
    required query,
  }) async {
    return await dio.get(url, queryParameters: query);
  }
}
