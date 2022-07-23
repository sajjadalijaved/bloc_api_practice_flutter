import 'dart:convert';

import 'package:http/http.dart';

import '../model/user.dart';

extension Success on Response {
  bool get isSuccessful => statusCode == 200;
}

class UserAPIService {
  final baseURL = 'https://jsonplaceholder.typicode.com';
  final baseURI = '/users';

  Future<List<Users>> fetchUsers() async {
    var response = await get(Uri.parse(baseURL + baseURI));
    List list = jsonDecode(response.body);
    return list.map((e) => Users.fromJson(e)).toList();
  }
}
