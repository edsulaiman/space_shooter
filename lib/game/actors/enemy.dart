import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';

import '../components/coin.dart';
import '../components/die_effect.dart';
import '../game_entry.dart';
import '../mixins/space_ship.dart';
import '../utils/spawn_util.dart';
import 'player.dart';

class Enemy extends SpriteComponent
    with HasGameReference<GameEntry>, SpaceShip<Player> {
  Enemy({
    required Vector2 position,
    required this.difficulty,
  }) : super(position: position);

  static const maxDifficulty = 50;

  late final SpriteSheet spriteSheet;

  final int difficulty;

  Vector2 velocity = Vector2.all(0);

  @override
  double speed = 700;

  @override
  double projectileSpeed = 2000;

  @override
  int firingCooldown = 1000;

  @override
  Future<void> onLoad() async {
    final shipImage = await Flame.images.load("ship/enemy_ship.png");
    sprite = Sprite(shipImage);
    size = Vector2.all(75);
    health = difficulty;

    add(RectangleHitbox());

    return super.onLoad();
  }

  @override
  void update(double dt) {
    lookAt(game.world.player.center);

    _moveToTargetPosition(dt);

    super.update(dt);
  }

  @override
  void die() {
    removeFromParent();

    final blast = DieEffect(position: position);
    game.world.add(blast);

    final coinCount = 1 + SpawnUtil.random.nextInt(difficulty.clamp(1, 10));
    for (int i = 0; i < coinCount; i++) {
      final coin = Coin(position: position);
      game.world.add(coin);
    }
  }

  void _moveToTargetPosition(dt) {
    final playerPosition = game.world.player.center;
    final direction = playerPosition - position;
    final distance = position.distanceTo(playerPosition);

    velocity = direction.normalized() * speed;
    isFiring = distance <= 550 &&
        SpawnUtil.random.nextInt(2 + maxDifficulty - difficulty) == 1;

    if (distance <= 550 && distance >= 500) {
      return;
    }

    if (distance >= 500) {
      position.add(velocity * dt);
    } else {
      position.add(velocity * -1 * dt);
    }
  }
}
