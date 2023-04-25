import 'package:dio/dio.dart';
import 'package:urun_katalog_projesi/core/network_manager/network_manager.dart';
import 'package:urun_katalog_projesi/features/login/data/models/login_model.dart';

abstract class LoginRepository {
  final api = 'https://assign-api.piton.com.tr/api/rest/login';

  Future<String> getLogin(String email, String password);
}

class LoginRepositoryImp implements LoginRepository {
  LoginRepositoryImp({required this.service}) : super();

  final NetworkManager service;

  @override
  Future<String> getLogin(String email, String password) async {
    dynamic doesntReturn() {
      'hata';
    }

    try {
      Response response;

      final data = {'email': email, "password": password};
      response = await dio.post(api, data: data);
      final body = response.data;
      if (body != null && body["action_login"]["token"] != null) {
        service.setToken(token: body['action_login']['token']);
        return body['action_login']['token'];
      } else {
        return doesntReturn();
      }
    } on DioError catch (e) {
      final errorMesage = e.response!.data['message'] ?? 'Bir Hata Var';
      return doesntReturn();
    }
  }

  @override
  // TODO: implement api
  String get api => throw UnimplementedError();

  @override
  // TODO: implement dio
  Dio get dio => throw UnimplementedError();
}
