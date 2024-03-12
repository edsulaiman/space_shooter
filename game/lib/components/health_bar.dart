import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../game_entry.dart';

class HealthBar extends PositionComponent with HasGameReference<GameEntry> {
  late final RectangleComponent border;
  late final RectangleComponent bar;

  @override
  FutureOr<void> onLoad() {
    border = RectangleComponent();
    border.setColor(Colors.white);
    border.size = Vector2(100, 25);

    bar = RectangleComponent();
    bar.setColor(Colors.green);
    bar.size = Vector2(100, 25);

    position = Vector2(50, 50);

    border.add(bar);
    add(border);

    return super.onLoad();
  }

  @override
  void update(double dt) {
    final player = game.world.player;

    bar.size = Vector2(player.health / player.maxHealth * 100, 25);

    super.update(dt);
  }
}
