import 'dart:ui';

import 'package:aula/widget/account.dart';
import 'package:aula/widget/book.dart';
import 'package:aula/widget/buy.dart';
import 'package:aula/widget/discover.dart';
import 'package:aula/widget/favorite.dart';
import 'package:aula/widget/home.dart';
import 'package:aula/widget/introduction.dart';
import 'package:aula/widget/login.dart';
import 'package:aula/widget/read.dart';
import 'package:aula/widget/setting.dart';
import 'package:aula/widget/signUp.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BookWing",
      routes: {
        '/': (context) => Introduction(),
        'login': (context) => Login(),
        'home': (context) => Home(),
        'favorite': (context) => Favorite(),
        'account': (context) => Account(),
        'book': (context) => Book(),
        'buy': (context) => Buy(),
        'reading': (context) => Read(),
        'discover': (context) => Discover(),
        'settings': (context) => Setting(),
        'signup': (context) => SignUp(),
      },
      theme: ThemeData(
        colorScheme: const ColorScheme(
            brightness: Brightness.light,
            background: Color(0xfffdfbf7),
            onBackground: Color(0xfffdfbf7),
            primary: Color(0xff282934),
            onPrimary: Color(0xff282934),
            inversePrimary: Color(0xffc8c5bb),
            secondary: Color(0xffd67477),
            onSecondary: Color(0xff282934),
            error: Colors.redAccent,
            onError: Colors.red,
            surface: Colors.white,
            onSurface: Colors.black,
        ),
        scaffoldBackgroundColor: const Color(0xfff1eee3),
        cardColor: const Color(0xfffdfbf7),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xffd67477),
        ),
        fontFamily: 'Albra Sans Regular',
      ),
      scrollBehavior: MyCustomScrollBehavior().copyWith(scrollbars: false),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
