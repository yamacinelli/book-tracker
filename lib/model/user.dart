class User {
  User(
      {this.id,
      required this.name,
      required this.lastName,
      required this.email,
      required this.password});

  int? id;
  String name;
  String lastName;
  String email;
  String password;

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'password': password,
        'people': {'name': name, 'lastName': lastName}
      };
}
