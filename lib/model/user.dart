import 'package:aula/model/people.dart';

class User {
  User(
      {this.id,
      required this.people,
      required this.email,
      required this.password});

  int? id;
  People? people;
  String email;
  String password;

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'password': password,
        'people': people
      };
}
