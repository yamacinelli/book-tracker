import 'dart:convert';

import 'package:aula/constant/enviroment.dart';
import 'package:aula/dao/favoriteDao.dart';
import 'package:aula/model/book.dart';
import 'package:aula/utils/JsonPretty.dart';
import 'package:http/http.dart';

class FavoriteService {

  final path = Enviroment.DEVELOPER;
  final headers = {
    "Content-type": "application/json"
  };

  Future<Book> save(Book book) async {
    final url = Uri.parse('$path/favorite');
    Response response = await post(url, headers: headers, body: jsonPretty(book));
    return FavoriteDao().convertToDao(jsonDecode(response.body));
  }
}