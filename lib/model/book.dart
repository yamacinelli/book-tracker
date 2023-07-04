class Book {
  Book({this.id, required this.author, required this.name, required this.imageUrl});

  int? id;
  String author;
  String name;
  String imageUrl;

  Map<String, dynamic> toJson() => {
    'id': id,
    'author': author,
    'name': name,
    'imageUrl': imageUrl,
  };
}