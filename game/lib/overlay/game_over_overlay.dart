import 'package:flutter/material.dart';
import 'package:watt/watt.dart';

class GameOverOverlay extends StatelessWidget {
  const GameOverOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: Container(
        width: 420,
        height: 300,
        margin: const EdgeInsets.all(32),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: palette.background,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(
              "Game Over",
              style: textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
