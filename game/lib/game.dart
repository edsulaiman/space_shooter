import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'game_entry.dart';
import 'game_provider.dart';
import 'overlay/game_over_overlay.dart';

class Game extends StatelessWidget {
  const Game({
    Key? key,
    required this.gameProvider,
  }) : super(key: key);

  final GameProvider gameProvider;

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: GameEntry(gameProvider: gameProvider),
      overlayBuilderMap: {
        "gameOver": (context, game) => const GameOverOverlay(),
      },
    );
  }
}
