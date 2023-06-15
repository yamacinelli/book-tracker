import 'package:aula/constant/constants.dart';
import 'package:aula/widget/login.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class Introduction extends StatelessWidget {
  const Introduction({super.key});

  Expanded buildTopPage(BuildContext context) {
    return Expanded(
      child: Container(
        color: Theme.of(context).colorScheme.primary,
        child: ClipRRect(),
      ),
    );
  }

  Expanded buildBottomPage(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(60), topRight: Radius.circular(60)),
        child: Container(
          color: Theme.of(context).colorScheme.primary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Text(
                  'Nunca mais perca o controle de seus livros!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Text(
                  'Apresentando nosso novo aplicativo, projetado para ajudá-lo a rastrear e gerenciar facilmente seu progresso de leitura.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, color: Colors.white70),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton.small(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, Constants.ROUTE_LOGIN);
                      },
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      child: const Icon(Ionicons.chevron_forward_outline),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        buildTopPage(context),
        buildBottomPage(context),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: buildBody(context),
    );
  }
}
