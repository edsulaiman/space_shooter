import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text(
      "SPACE SHOOTER",
      style: textTheme.headlineSmall,
      textAlign: TextAlign.center,
    );
  }
}
