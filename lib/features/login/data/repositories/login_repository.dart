import 'package:dio/dio.dart';
import 'package:urun_katalog_projesi/core/network_manager/network_manager.dart';
import 'package:urun_katalog_projesi/features/login/data/models/login_model.dart';

abstract class LoginRepository {
    final api = 'https://assign-api.piton.com.tr/api/rest/login';
    final dio = Dio();

  Future<LoginModel> getLogin(String email, String password) async {

    
    Response response;
    dynamic doesntReturn() {}
    final data = {'email': email, "password": password};
    response = await dio.post(api, data: data);
    if (response.statusCode == 200) {
      final body = response.data;
      return LoginModel(email: email, token: body['token']);
    } else {
      return doesntReturn();
    }
  }
}

class LoginRepositoryImp implements LoginRepository {
  LoginRepositoryImp();

  @override
  Future<LoginModel> getLogin(String email, String password) async {
    final api = 'https://assign-api.piton.com.tr/api/rest/login';
    final data = {'email': email, "password": password};
    final dio = Dio();
    dynamic doesntReturn() {}
    Response response;
    response = await dio.post(api, data: data);
    if (response.statusCode == 200) {
      final body = response.data;
      return LoginModel(email: email, token: body['token']);
    } else {
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
