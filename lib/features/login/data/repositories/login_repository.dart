import 'package:dio/dio.dart';
import 'package:urun_katalog_projesi/core/network_manager/network_manager.dart';
import 'package:urun_katalog_projesi/features/login/data/models/login_model.dart';

abstract class LoginRepository {
  Future<LoginModel?> getLogin(String email, String password) async{
    final api = '';
    final data = {'email': email, "password": password};
    final dio = Dio();
    Response response;
    response = await dio.post(api, data: data);
    if(response.statusCode == 200){
         final body = response.data;
         return LoginModel(email: email, token: body['token']);
    }
    else {return null;}
  };
}

class LoginRepositoryImp implements LoginRepository {
  final NetworkManager _networkManager;

  LoginRepositoryImp({required NetworkManager networkManager}): _networkManager = networkManager;
  
  @override
  Future<List<LoginModel>> getLogin() async {
    Response response = await _networkManager.
  } 
}
