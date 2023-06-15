import '../../../model/book.dart';

const createFavorite = '''
  CREATE TABLE favorite(
    id INTEGER NOT NULL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    author VARCHAR(200) NOT NULL,
    imageUrl VARCHAR(250) NOT NULL
  )
''';

const insertFavorite = [
  '''INSERT INTO favorite(name, author, imageUrl)
     VALUES ("Corte de asas e ruína (Vol. 3 Corte de espinhos e rosas – Edição especial)", "Sarah J. Maas", "https://m.media-amazon.com/images/I/71yuikaNMhL.jpg")''',
  '''INSERT INTO favorite(name, author, imageUrl)
     VALUES ("Neon Genesis Evangelion Collector's Edition Vol. 02", "", "https://m.media-amazon.com/images/I/51xJXGttg8L._SX355_BO1,204,203,200_.jpg")''',
  '''INSERT INTO favorite(name, author, imageUrl)
     VALUES ("Admirável mundo novo", "Aldous Leonard Huxley", "https://m.media-amazon.com/images/P/B00ITZ9XR4.01._SCLZZZZZZZ_SX500_.jpg")''',
  '''INSERT INTO favorite(name, author, imageUrl)
     VALUES ("As Chamas do Paraíso - Série A Roda do Tempo – Vol. 5", "Robert Jordan", "https://m.media-amazon.com/images/P/B01J90K6KA.01._SCLZZZZZZZ_SX500_.jpg")''',
  '''INSERT INTO favorite(name, author, imageUrl)
     VALUES ("Bórgia (Graphic Novel Volume Único)", "Alejandro Jodorowsky", "https://m.media-amazon.com/images/P/B0C2FYWDLB.01._SCLZZZZZZZ_SX500_.jpg")''',
];

const createUser = '''
  CREATE TABLE user(
    id INTEGER NOT NULL PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    lastName VARCHAR(40) NOT NULL,
    email VARCHAR(200) NOT NULL,
    password VARCHAR(200) NOT NULL
  )
''';