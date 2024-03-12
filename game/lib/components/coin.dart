import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';

import '../game_entry.dart';
import '../utils/spawn_util.dart';

class Coin extends SpriteComponent with HasGameReference<GameEntry> {
  Coin({required Vector2 position}) : super(position: position);

  final double speed = 1000;
  final double spawnDistance = 100;

  bool isChasingPlayer = false;
  Vector2 velocity = Vector2.zero();

  @override
  Future<void> onLoad() async {
    final image = await Flame.images.load("misc/coin_misc.png");

    sprite = Sprite(image);
    size = Vector2.all(20);

    position = SpawnUtil.getSpawnPosition(spawnDistance, center);

    return super.onLoad();
  }

  @override
  void update(double dt) {
    _detectPlayer(dt);
    _moveToPlayer(dt);

    position.add(velocity * dt);

    super.update(dt);
  }

  void _detectPlayer(double dt) {
    final playerPosition = game.world.player.center;
    final distance = position.distanceTo(playerPosition);

    if (distance <= 300) {
      isChasingPlayer = true;
    }

    if (distance <= 50) {
      removeFromParent();
    }
  }

  void _moveToPlayer(double dt) {
    if (!isChasingPlayer) {
      return;
    }

    final playerPosition = game.world.player.center;
    final direction = playerPosition - position;

    velocity = direction.normalized() * speed;
  }
}
