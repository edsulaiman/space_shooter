import 'package:flutter/material.dart';

class HomeFooter extends StatelessWidget {
  const HomeFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text(
      "© 2024 Edwin Sulaiman",
      style: textTheme.bodySmall,
      textAlign: TextAlign.center,
    );
  }
}
