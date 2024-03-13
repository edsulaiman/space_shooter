import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

import '../singletons/audio.dart';

class CustomNesButton extends StatelessWidget {
  const CustomNesButton({
    Key? key,
    required this.type,
    this.onPressed,
    required this.child,
  }) : super(key: key);

  final NesButtonType type;
  final void Function()? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return NesButton(
      type: type,
      onPressed: () {
        Audio.playClickSfx();
        onPressed?.call();
      },
      child: child,
    );
  }
}
