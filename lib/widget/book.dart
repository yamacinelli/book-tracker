import 'package:aula/model/book.dart';
import 'package:aula/widget/appBar.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../dao/favoriteDao.dart';

class BookView extends StatefulWidget {
  const BookView({super.key});

  @override
  State<BookView> createState() => _BookViewState();
}

class _BookViewState extends State<BookView> {

  bool _isFavorite = false;

  Container _buildCard(String url) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: [
          SizedBox(
            width: 120,
            height: 170,
            child: Card(
              elevation: 5.0,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    child: Image.network(url, fit: BoxFit.fill),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Text _bookName(String name) {
    return Text(
      name,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      softWrap: false,
    );
  }

  Padding _bookAuthor(String author) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text(
        author,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  FloatingActionButton _buttonFavorite() {
    return FloatingActionButton.small(
      heroTag: 'btnFavorite',
      onPressed: () {
        //TODO
      },
      child: _isFavorite ?
      const Icon(Ionicons.bookmark_outline, size: 17) :
      const Icon(Ionicons.bookmark_sharp, size: 17),
    );
  }

  FloatingActionButton _buttonShare() {
    return FloatingActionButton.small(
      heroTag: 'btnShare',
      onPressed: () {
        //TODO
      },
      child: const Icon(Ionicons.share_social_outline, size: 17),
    );
  }

  ElevatedButton _buttonStartRead() {
    return ElevatedButton(
      onPressed: () {
        //TODO
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        fixedSize: const Size.fromWidth(100),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
      ),
      child: const Text(
        'Começar',
        style: TextStyle(color: Colors.white, fontSize: 13),
      ),
    );
  }

  Container _buildActionButtons() {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buttonStartRead(),
            _buttonFavorite(),
            _buttonShare(),
          ]
      ),
    );
  }

  Expanded _buildMainInformationBook(Book book) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _bookName(book.name),
            _bookAuthor(book.author),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Row _buildTopPage(Book book) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [_buildCard(book.imageUrl), _buildMainInformationBook(book)],
    );
  }

  Widget _buildBody(Book book) {
    return Column(
      children: [
        _buildTopPage(book),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final Book book = ModalRoute.of(context)!.settings.arguments as Book;
    FavoriteDao().findById(book.id as int).then((value) {
      if (value.id != null) _isFavorite = true;
    });

    return Scaffold(
      appBar: appBarBookTracker(true, false, '', context),
      body: _buildBody(book),
    );
  }
}
