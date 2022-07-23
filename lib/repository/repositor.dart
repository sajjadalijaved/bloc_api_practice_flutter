import 'package:bloc_api_practice/repository/user_api.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

import '../model/user.dart';

class Repository {
  final _userAPIService = UserAPIService();

  Future<List<Users>> fetchUsersfromRepo() async {
    return await _userAPIService.fetchUsers();
  }
}
