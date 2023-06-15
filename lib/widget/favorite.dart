import 'package:aula/dao/favoriteDao.dart';
import 'package:aula/widget/bottomNavigationBarState.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../model/book.dart';
import 'appBar.dart';

class Favorite extends StatefulWidget {

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {

  Widget _buildCard(Book book, int index) {
    return SizedBox(
      width: 90,
      height: 130,
      child: Card(
        elevation: 5.0,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              child: Image.network(book.imageUrl, fit: BoxFit.fill),
            ),
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Container(
                height: 30,
                width: 30,
                padding: const EdgeInsets.only(top: 5, right: 5),
                child: FloatingActionButton(
                  heroTag: 'btn$index',
                  onPressed: () {
                    // Remove item of list Favorites
                    setState(() {
                      FavoriteDao().delete(book);
                    });
                  },
                  backgroundColor: const Color(0xfff1eee3),
                  child: const Icon(Ionicons.bookmark_outline, size: 17),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildChildrenList(BuildContext context, List<Book> books) {
    return List<Widget>.generate(books.length, (index) {
      return _buildCard(books.elementAt(index), index);
    });
  }

  Container _buildBody(BuildContext context, List<Book> books) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildChildrenList(context, books),
        ),
      ),
    );
  }

  Future<List<Book>> _getAllFavorites() async {
    setState(() {});
    return await FavoriteDao().findAll();
  }

  Widget _buildListBooks(BuildContext context) {
    return FutureBuilder(
      future: _getAllFavorites(),
      builder: (context, AsyncSnapshot<List<Book>> books) {
        if (!books.hasData) return const CircularProgressIndicator();
        return _buildBody(context, books.data!);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBookTracker(false, true, 'Favoritos', context),
      bottomNavigationBar:
          BottomNavigationBarBookTracker(bottomNavigationIndex: 3),
      body: _buildListBooks(context),
    );
  }
}
