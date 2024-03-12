import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'components/fire_button.dart';
import 'components/health_bar.dart';
import 'components/joystick.dart';
import 'game_world.dart';

class GameEntry extends FlameGame<GameWorld> with HasCollisionDetection {
  GameEntry() : super(world: GameWorld());

  final JoystickComponent joystick = Joystick();

  final aspectRatio = 9 / 16;

  int coinsCollected = 0;

  @override
  Color backgroundColor() => Colors.black;

  @override
  Future<void> onLoad() async {
    _setupCamera();
  }

  @override
  void onMount() {
    super.onMount();
  }

  void _setupCamera() {
    camera = CameraComponent.withFixedResolution(
      width: size.x / aspectRatio,
      height: size.y / aspectRatio,
    );

    camera.viewport.add(joystick);
    camera.viewport.add(FireButton());
    camera.viewport.add(HealthBar());
  }
}
