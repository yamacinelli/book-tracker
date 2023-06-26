import 'package:aula/model/book.dart';
import 'package:aula/widget/appBar.dart';
import 'package:flutter/material.dart';

class BookView extends StatefulWidget {
  const BookView({super.key});

  @override
  State<BookView> createState() => _BookViewState();
}

class _BookViewState extends State<BookView> {
  SizedBox _buildCard(String url) {
    return SizedBox(
      width: 140.0,
      height: 190.0,
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

  Text _bookAuthor(String author) {
    return Text(
      author,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildMainInformationBook(Book book) {
    return SizedBox(
      width: 200.0,
      height: 190.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _bookName(book.name),
          _bookAuthor(book.author),
        ],
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

    return Scaffold(
      appBar: appBarBookTracker(true, false, '', context),
      body: _buildBody(book),
    );
  }
}
