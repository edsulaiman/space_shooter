import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

import '../../app_router.dart';
import '../../main_router.dart';
import '../../singletons/game_progress.dart';
import '../../widgets/custom_nes_button.dart';
import '../game_entry.dart';

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
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: NesContainer(
          height: 300,
          width: double.infinity,
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
              CustomNesButton(
                onPressed: () => _onMainMenuPressed(context),
                type: NesButtonType.normal,
                child: const Text('MAIN MEMU'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onMainMenuPressed(BuildContext context) {
    GameProgress.instance.coins.value += game.coinsCollected;
    AppRouter.pushNamedAndRemoveAll(MainRouter.homePath);
  }
}
