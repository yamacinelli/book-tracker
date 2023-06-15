import 'package:aula/dao/database/sqlite/connection.dart';
import 'package:aula/dao/genericDao.dart';
import 'package:aula/model/user.dart';
import 'package:sqflite/sqflite.dart';

class UserDao implements GenericDao<User> {

  @override
  delete(User model) async {
    Database database = await createDatabase();
    await database.delete('user WHERE id = ?', whereArgs: [model.id]);
  }

  @override
  Future<List<User>> findAll() async {
    Database database = await createDatabase();
    List<User> users = (await database.query('user')).map<User>(convertToDao).toList();
    return Future.value(users);
  }

  @override
  Future<User> findById(int id) async {
    Database database = await createDatabase();
    List<Map> user = await database.query('user', where: 'id = ?', whereArgs: [id]);

    if (user.isEmpty) throw Exception('Element not found with this id.');

    Map<dynamic, dynamic> result  = user.first;
    return Future.value(convertToDao(result));
  }

  @override
  Future<User> save(User model) async {
    Database database = await createDatabase();
    String insert = 'INSERT INTO user(name, lastName, email, password) VALUES (?, ?, ?, ?)';
    int idResult = await database.rawInsert(insert, [model.name, model.lastName, model.email, model.password]);
    return Future.value(User(id: idResult, name: model.name, lastName: model.lastName, email: model.email, password: model.password));
  }

  @override
  Future<User> update(User model) async {
    Database database = await createDatabase();
    String update = 'UPDATE user SET name = ?, lastName = ?, email = ?, password = ?';
    await database.rawUpdate(update, [model.name, model.lastName, model.email, model.password]);
    return model;
  }

  Future<User> findByCredentials(String email, String password) async {
    Database database = await createDatabase();
    List<Map> user = await database.query('user', where: 'email = ? AND password = ?', whereArgs: [email, password]);

    if (user.isEmpty) throw Exception('Element not found with this credentials.');

    Map<dynamic, dynamic> result  = user.first;
    return convertToDao(result);
  }

  User convertToDao(Map<dynamic, dynamic> user) {
    return User(
        id: user['id'],
        name: user['name'],
        lastName: user['lastName'],
        email: user['email'],
        password: user['password']
    );
  }

  Future<Database> createDatabase() async {
    return await Connection.create();
  }
}