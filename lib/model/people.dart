class People {
  People({this.id,
        required this.name,
        required this.lastName});

  int? id;
  String name;
  String lastName;

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'lastName': lastName
  };
}
