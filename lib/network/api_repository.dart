import 'dart:async';

import '../data/models/request/login_request.dart';
import '../data/models/request/register_request.dart';
import '../data/models/response/login_response.dart';
import '../data/models/response/register_response.dart';
import '../data/models/response/users_response.dart';
import 'api.dart';

class ApiRepository {
  ApiRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<LoginResponse?> login(LoginRequest data) async {
    final res = await apiProvider.login('/api/login', data);
    if (res.statusCode == 200) {
      return LoginResponse.fromJson(res.body);
    }
  }

  Future<RegisterResponse?> register(RegisterRequest data) async {
    final res = await apiProvider.register('/api/register', data);
    if (res.statusCode == 200) {
      return RegisterResponse.fromJson(res.body);
    }
  }

  Future<UsersResponse?> getUsers() async {
    final res = await apiProvider.getUsers('/api/users?page=1&per_page=12');
    if (res.statusCode == 200) {
      return UsersResponse.fromJson(res.body);
    }
  }
}
