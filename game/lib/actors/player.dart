import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';

import '../components/blast.dart';
import '../game_entry.dart';
import '../mixins/space_ship.dart';
import 'enemy.dart';

class Player extends SpriteComponent
    with HasGameReference<GameEntry>, SpaceShip<Enemy> {
  late final JoystickComponent joystick;
  late final SpriteSheet spriteSheet;

  @override
  String projectileType = "player";

  @override
  double speed = 1000;

  @override
  double projectileSpeed = 2000;

  @override
  int firingCooldown = 100;

  @override
  bool isFiring = false;

  @override
  bool isFiringCooldown = false;

  @override
  Future<void> onLoad() async {
    final shipImage = await Flame.images.load("ship/player_ship.png");
    sprite = Sprite(shipImage);
    joystick = game.joystick;
    size = Vector2.all(75);
    anchor = Anchor.center;

    game.camera.follow(this);

    add(RectangleHitbox());

    return super.onLoad();
  }

  @override
  void update(double dt) {
    _movePlayer(dt);

    super.update(dt);
  }

  @override
  void die() {
    removeFromParent();

    final blast = Blast(position: position);
    game.world.add(blast);

    game.pauseEngine();
    game.overlays.add("gameOver");
  }

  void _movePlayer(double dt) {
    if (joystick.direction == JoystickDirection.idle) {
      return;
    }

    position.add(joystick.relativeDelta * speed * dt);
    angle = joystick.delta.screenAngle();
  }
}
