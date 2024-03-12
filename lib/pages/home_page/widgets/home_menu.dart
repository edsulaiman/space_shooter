import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

import '../../../app_router.dart';
import '../../../main_router.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NesButton(
          type: NesButtonType.primary,
          onPressed: () => AppRouter.pushNamedAndRemoveAll(MainRouter.gamePath),
          child: const Text("START"),
        ),
        const SizedBox(height: 16),
        const NesButton(type: NesButtonType.normal, child: Text("SHOP")),
      ],
    );
  }
}
