import 'package:aula/widget/appBar.dart';
import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBookTracker(true, true, 'Configurações', context)
    );
  }
}