import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'game_entry.dart';
import 'overlay/game_over_overlay.dart';

class Game extends StatelessWidget {
  const Game({super.key});

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: GameEntry(),
      overlayBuilderMap: {
        "gameOver": (context, game) => const GameOverOverlay(),
      },
    );
  }
}
