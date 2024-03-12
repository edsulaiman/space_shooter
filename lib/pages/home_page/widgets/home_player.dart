import 'package:flutter/material.dart';
import 'package:witt/witt.dart';

import '../../../game/game_provider.dart';

class HomePlayer extends StatelessWidget {
  const HomePlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _PlayerShip(),
        SizedBox(height: 32),
        _PlayerCoins(),
      ],
    );
  }
}

class _PlayerShip extends StatelessWidget {
  const _PlayerShip();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/ship/player_ship.png",
      width: 100,
      height: 100,
      fit: BoxFit.cover,
      filterQuality: FilterQuality.none,
    );
  }
}

class _PlayerCoins extends StatelessWidget {
  const _PlayerCoins();

  @override
  Widget build(BuildContext context) {
    final gameProvider = WProvider.of<GameProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/misc/coin_misc.png",
          width: 24,
          height: 24,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.none,
        ),
        const SizedBox(width: 8),
        WListener(
          notifiers: [gameProvider.coins],
          builder: (context) {
            final coins = gameProvider.coins.value;
            return Text(coins.toString());
          },
        ),
      ],
    );
  }
}
