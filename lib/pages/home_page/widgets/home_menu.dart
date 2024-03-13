import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

import '../../../app_router.dart';
import '../../../main_router.dart';
import '../../../widgets/custom_nes_button.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomNesButton(
          type: NesButtonType.primary,
          onPressed: () => AppRouter.pushNamedAndRemoveAll(MainRouter.gamePath),
          child: const Text("START"),
        ),
        const SizedBox(height: 16),
        const CustomNesButton(type: NesButtonType.normal, child: Text("SHOP")),
      ],
    );
  }
}
