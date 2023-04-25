import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class NetworkManager {

  Future get({
    required String path,
    Map<String, dynamic>? queryParameters,
  });

  void setToken({required String token});
}

@Singleton(as: NetworkManager)
class NetworkManagerImp implements NetworkManager {
  late Dio _dio;

  NetworkManagerImp() {
    _dio =
        Dio(BaseOptions(baseUrl: "https://assign-api.piton.com.tr/api/rest/"));
  }

  @override
  Future<Response> get(
      {required String path, Map<String, dynamic>? queryParameters}) async {
    return await _dio.get(path, queryParameters: queryParameters);
  }

  @override
  void setToken({required String token}) {
    _dio.options.headers["Authorization"] = "Bearer $token";
  }
}
