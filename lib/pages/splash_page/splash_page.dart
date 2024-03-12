import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: NesPulser(
          child: Text(
            "GAME LOADING",
            style: textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}
