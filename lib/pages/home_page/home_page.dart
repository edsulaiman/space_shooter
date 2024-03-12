import 'package:flutter/material.dart';

import 'widgets/home_footer.dart';
import 'widgets/home_menu.dart';
import 'widgets/home_player.dart';
import 'widgets/home_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            children: [
              HomeTitle(),
              SizedBox(height: 16),
              Expanded(child: HomePlayer()),
              SizedBox(height: 16),
              HomeMenu(),
              SizedBox(height: 64),
              HomeFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
