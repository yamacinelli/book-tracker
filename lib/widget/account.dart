import 'package:flutter/material.dart';

import 'appBar.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarBookTracker(true, true, 'Perfil', context)
    );
  }
}