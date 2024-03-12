import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

class Joystick extends JoystickComponent {
  Joystick()
      : super(
          background: SpriteComponent(size: Vector2.all(200)),
          knob: SpriteComponent(size: Vector2.all(100)),
          margin: const EdgeInsets.only(left: 50, bottom: 100),
        );

  @override
  Future<void> onLoad() async {
    final backgroundImage = await Flame.images.load("joystick/background.png");
    final knobImage = await Flame.images.load("joystick/knob.png");

    (background as SpriteComponent).sprite = Sprite(backgroundImage);
    (knob as SpriteComponent).sprite = Sprite(knobImage);

    return super.onLoad();
  }
}
