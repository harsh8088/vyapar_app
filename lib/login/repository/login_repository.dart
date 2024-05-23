// import 'package:http/http.dart' as http;
import 'dart:io';

import '../../networking/ApiProvider.dart';

class LoginRepository {
  final ApiProvider _provider = ApiProvider();
  static final LoginRepository _loginRepository = LoginRepository._();

  LoginRepository._();

  factory LoginRepository() {
    return _loginRepository;
  }

  Future<dynamic> findByMobile(
      {required String mobile, required String country}) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
      };
      var body = {'mobile': mobile};
      final response = await _provider.post("", headers, body);
      return response;
    } on SocketException {
      rethrow;
    } catch (e) {
      return e.toString();
    }
  }
}
