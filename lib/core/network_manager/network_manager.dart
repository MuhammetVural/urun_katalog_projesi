import 'package:dio/dio.dart';

abstract class NetworkManager {
  Future get({
    required String path,
    Map<String, dynamic>? queryParameters,
  });
}

class NetworkManagerImp implements NetworkManager {
  late Dio dio;

  NetworkManagerImp() {
    dio =
        Dio(BaseOptions(baseUrl: "https://assign-api.piton.com.tr/api/rest/"));
  }

  @override
  Future<Response> get(
      {required String path, Map<String, dynamic>? queryParameters}) async {
    return await dio.get(path, queryParameters: queryParameters);
  }
}
