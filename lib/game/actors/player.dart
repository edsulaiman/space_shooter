import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';

import '../components/die_effect.dart';
import '../game_entry.dart';
import '../mixins/space_ship.dart';
import 'enemy.dart';

class Player extends SpriteComponent
    with HasGameReference<GameEntry>, SpaceShip<Enemy> {
  late final SpriteSheet spriteSheet;

  @override
  double speed = 1000;

  @override
  double projectileSpeed = 2000;

  @override
  int firingCooldown = 200;

  @override
  Future<void> onLoad() async {
    final shipImage = await Flame.images.load("ship/player_ship.png");
    sprite = Sprite(shipImage);
    size = Vector2.all(75);
    anchor = Anchor.center;

    game.camera.follow(this);

    add(RectangleHitbox());

    return super.onLoad();
  }

  @override
  void update(double dt) {
    _movePlayer(dt);
    _lauchAttack();

    super.update(dt);
  }

  @override
  void die() {
    removeFromParent();

    final blast = DieEffect(position: position);
    game.world.add(blast);

    game.pauseEngine();
    game.overlays.add("gameOver");
  }

  void _movePlayer(double dt) {
    if (game.moveJoystick.direction == JoystickDirection.idle) {
      return;
    }

    position.add(game.moveJoystick.relativeDelta * speed * dt);
    angle = game.moveJoystick.delta.screenAngle();
  }

  void _lauchAttack() {
    if (game.attackJoystick.direction == JoystickDirection.idle) {
      isFiring = false;
      return;
    }

    angle = game.attackJoystick.delta.screenAngle();
    isFiring = true;
  }
}
