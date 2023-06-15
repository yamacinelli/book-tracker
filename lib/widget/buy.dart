import 'package:aula/widget/bottomNavigationBarState.dart';
import 'package:flutter/material.dart';

import 'appBar.dart';

class Buy extends StatelessWidget {
  const Buy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBookTracker(false, true, 'Comprar', context),
      bottomNavigationBar: BottomNavigationBarBookTracker(
        bottomNavigationIndex: 4,
      ),
    );
  }
}
