import 'package:flutter/material.dart';
import 'package:game/game_provider.dart';
import 'package:witt/witt.dart';

import '../../app_router.dart';
import '../../main_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final gameProvider = WProvider.of<GameProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            WListener(
              notifiers: [gameProvider.coins],
              builder: (context) {
                final coins = gameProvider.coins.value;
                return Text(coins.toString());
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => AppRouter.pushNamed(MainRouter.gamePath),
              child: const Text("Play"),
            ),
          ],
        ),
      ),
    );
  }
}
