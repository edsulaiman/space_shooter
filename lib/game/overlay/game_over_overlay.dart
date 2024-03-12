import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:witt/witt.dart';

import '../../app_router.dart';
import '../../main_router.dart';
import '../game_entry.dart';
import '../game_provider.dart';

class GameOverOverlay extends StatelessWidget {
  const GameOverOverlay({
    Key? key,
    required this.game,
  }) : super(key: key);

  final GameEntry game;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: NesContainer(
        width: 420,
        height: 300,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "GAME OVER",
              style: textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Text("COINS COLLECTED: ${game.coinsCollected}"),
            const SizedBox(height: 32),
            NesButton(
              onPressed: () => _onMainMenuPressed(context),
              type: NesButtonType.normal,
              child: const Text('MAIN MEMU'),
            ),
          ],
        ),
      ),
    );
  }

  void _onMainMenuPressed(BuildContext context) {
    final gameProvider = WProvider.of<GameProvider>(context);
    gameProvider.coins.value = game.coinsCollected;

    AppRouter.pushNamedAndRemoveAll(MainRouter.homePath);
  }
}
