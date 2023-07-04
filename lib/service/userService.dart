import 'dart:convert';

import 'package:aula/dao/userDao.dart';
import 'package:aula/model/user.dart';
import 'package:http/http.dart';

import '../constant/enviroment.dart';
import '../utils/JsonPretty.dart';

class UserService {

  final path = '${Enviroment.DEVELOPER}/user';
  final headers = {
    "Content-type": "application/json"
  };

  Future<User> save(User user) async {
    Response response = await post(Uri.parse(path), headers: headers, body: jsonPretty(user));

    return UserDao().convertToDao(jsonDecode(response.body));
  }

  Future<User> findByCredentials(String email, String password) async {
    Response response = await post(Uri.parse('$path/login'), headers: headers, body: jsonPretty(User(people: null, email: email, password: password)));
    User body = UserDao().convertToDao(jsonDecode(response.body));

    if (response.body.isEmpty) throw Exception('Element not found with this credentials.');

    return body;
  }
}