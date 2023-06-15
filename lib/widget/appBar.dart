import 'package:aula/constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

AppBar appBarBookTracker(bool showBackBottom, bool showMenuBottom, String title,
    BuildContext context) {
  List pages = [
    Constants.ROUTE_ACCOUNT,
    Constants.ROUTE_SETTINGS,
    Constants.ROUTE_LOGIN,
  ];

  void changePage(context, index) {
    Navigator.pushNamed(context, pages[index]);
  }

  PopupMenuItem<int> buildPopupMenuItem(
      {required int value, required Widget icon}) {
    return PopupMenuItem<int>(
      value: value,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [icon],
      ),
    );
  }

  Widget buildPopupMenuButton(BuildContext context) {
    return PopupMenuButton<int>(
      onSelected: (value) {
        changePage(context, value);
      },
      surfaceTintColor: Theme.of(context).colorScheme.background,
      itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
        buildPopupMenuItem(
          value: 0,
          icon: const Icon(
            Ionicons.person_circle_outline
          ),
        ),
        buildPopupMenuItem(
          value: 1,
          icon: const Icon(
            Ionicons.cog_outline
          ),
        ),
        buildPopupMenuItem(
          value: 2,
          icon: const Icon(
            Ionicons.log_out_outline
          ),
        ),
      ],
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      icon: const Icon(
        Ionicons.menu_outline,
        size: 20,
      ),
    );
  }

  return AppBar(
    title: Text(title),
    actions: showMenuBottom
        ? <Widget>[
            buildPopupMenuButton(context),
          ]
        : null,
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    automaticallyImplyLeading: showBackBottom,
    centerTitle: true,
  );
}
