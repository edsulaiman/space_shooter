import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';

import '../game_entry.dart';
import '../mixins/space_ship.dart';

enum ProjectileFacing {
  top,
  down,
  left,
  right,
}

class Projectile<T> extends SpriteComponent
    with HasGameReference<GameEntry>, CollisionCallbacks {
  Projectile({
    required this.speed,
    required this.projectileType,
    required Vector2 position,
    required double angle,
    required Vector2 size,
    required this.facing,
  }) : super(
          position: position,
          angle: angle,
          size: size,
        );

  late Vector2 velocity;

  final String projectileType;
  final double speed;
  final ProjectileFacing facing;

  @override
  Future<void> onLoad() async {
    final image =
        await Flame.images.load("projectile/${projectileType}_projectile.png");

    sprite = Sprite(image);

    switch (facing) {
      case ProjectileFacing.top:
        velocity = Vector2(sin(angle), -cos(angle)) * speed.toDouble();
        break;
      case ProjectileFacing.down:
        velocity = Vector2(-sin(angle), cos(angle)) * speed.toDouble();
        break;
      case ProjectileFacing.left:
        velocity = Vector2(-cos(angle), -sin(angle)) * speed.toDouble();
        break;
      case ProjectileFacing.right:
        velocity = Vector2(cos(angle), sin(angle)) * speed.toDouble();
        break;
      default:
    }

    Future.delayed(
      const Duration(seconds: 5),
      () => removeFromParent(),
    );

    add(RectangleHitbox(collisionType: CollisionType.passive));

    return super.onLoad();
  }

  @override
  void update(double dt) {
    _moveProjectile(dt);
    super.update(dt);
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is T) {
      removeFromParent();

      if (other is SpaceShip) {
        other.health -= 1;
      }
    }

    super.onCollisionStart(intersectionPoints, other);
  }

  void _moveProjectile(double dt) {
    position += velocity * dt;
  }
}
