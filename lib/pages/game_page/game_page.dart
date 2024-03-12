import 'package:flutter/material.dart';
import 'package:game/game.dart';
import 'package:game/game_provider.dart';
import 'package:witt/witt.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final gameProvider = WProvider.of<GameProvider>(context);
    return Scaffold(
      body: Game(gameProvider: gameProvider),
    );
  }
}
