import 'package:flutter/material.dart';
import 'package:game/game.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Game(),
    );
  }
}
