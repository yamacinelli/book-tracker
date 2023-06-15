import 'package:aula/widget/bottomNavigationBarState.dart';
import 'package:flutter/material.dart';

import 'appBar.dart';

class Discover extends StatelessWidget {
  const Discover({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBookTracker(false, true, 'Descobrir', context),
      bottomNavigationBar:
          BottomNavigationBarBookTracker(bottomNavigationIndex: 2),
    );
  }
}
