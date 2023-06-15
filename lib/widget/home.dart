import 'package:aula/model/book.dart';
import 'package:aula/widget/appBar.dart';
import 'package:aula/widget/bottomNavigationBarState.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  List<Book> mapBook = [
    Book(author: '', name: 'O nome do vento (A Crônica do Matador do Rei – Livro 1)', imageUrl: 'https://m.media-amazon.com/images/I/51bRkcp1sLL.jpg'),
    Book(author: '', name: "Neon Genesis Evangelion Collector's Edition Vol. 02", imageUrl: 'https://m.media-amazon.com/images/I/51xJXGttg8L._SX355_BO1,204,203,200_.jpg'),
    Book(author: '', name: 'O morro dos ventos uivantes', imageUrl: 'https://m.media-amazon.com/images/I/51sz0nn7u9L._SX331_BO1,204,203,200_.jpg'),
    Book(author: '', name: 'O Hobbit + pôster', imageUrl: 'https://m.media-amazon.com/images/P/B07S5FDTVK.01._SCLZZZZZZZ_SX500_.jpg'),
    Book(author: '', name: 'Tokyo Revengers - Vol. 01', imageUrl: 'https://m.media-amazon.com/images/I/51agJBMZyQL._SX328_BO1,204,203,200_.jpg'),
  ];

  Widget buildCard(Book book) {
    return Container(
      width: 90,
      height: 150,
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          SizedBox(
            width: 90,
            height: 130,
            child: Card(
              elevation: 5.0,
              child: ClipRRect(
                child: Image.network(book.imageUrl, fit: BoxFit.fill),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Text(
              book.name,
              textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 10),
              softWrap: false,
              overflow: TextOverflow.fade,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Boa leitura, Yago',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              'Recomendações',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildCard(mapBook[0]),
                  buildCard(mapBook[1]),
                  buildCard(mapBook[2]),
                  buildCard(mapBook[3]),
                  buildCard(mapBook[4]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBookTracker(false, true, 'Inicio', context),
      bottomNavigationBar:
          BottomNavigationBarBookTracker(bottomNavigationIndex: 0),
      body: buildBody(context),
    );
  }
}
