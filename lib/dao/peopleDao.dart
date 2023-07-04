import 'package:aula/model/people.dart';

class PeopleDao {
  People convertToDao(Map<dynamic, dynamic> people) {
    return People(
        id: people['id'],
        name: people['name'],
        lastName: people['lastName']
    );
  }
}