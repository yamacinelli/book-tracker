import 'package:aula/dao/database/sqlite/connection.dart';
import 'package:aula/dao/genericDao.dart';
import 'package:aula/model/book.dart';
import 'package:sqflite/sqflite.dart';

class FavoriteDao implements GenericDao<Book> {

  @override
  delete(Book model) async {
    Database database = await createDatabase();
    await database.delete('favorite WHERE id = ?', whereArgs: [model.id]);
  }

  @override
  Future<List<Book>> findAll() async {
    Database database = await createDatabase();
    List<Book> favorites = (await database.query('favorite')).map<Book>(convertToDao).toList();
    return Future.value(favorites);
  }

  @override
  Future<Book> save(Book model) async {
    Database database = await createDatabase();
    String insert = 'INSERT INTO favorite(name, author, imageUrl) VALUES (?, ?, ?)';
    int idResult = await database.rawInsert(insert, [model.name, model.author, model.imageUrl]);
    return Future.value(Book(id: idResult, author: model.author, name: model.name, imageUrl: model.imageUrl));
  }

  @override
  Future<Book> update(Book model) async {
    Database database = await createDatabase();
    String update = 'UPDATE favorite SET name = ?, author = ?, imageUrl = ?';
    await database.rawUpdate(update, [model.name, model.author, model.imageUrl]);
    return model;
  }

  @override
  Future<Book> findById(int id) async {
    Database database = await createDatabase();
    List<Map> favorite = await database.query('favorite', where: 'id = ?', whereArgs: [id]);

    if (favorite.isEmpty) throw Exception('Element not found with this id.');

    Map<dynamic, dynamic> result  = favorite.first;
    return Future.value(convertToDao(result));
  }

  Book convertToDao(Map<dynamic, dynamic> book) {
    return Book(
        id: book['id'],
        author: book['author'],
        name: book['name'],
        imageUrl: book['imageUrl']
    );
  }

  Future<Database> createDatabase() async {
    return await Connection.create();
  }
}