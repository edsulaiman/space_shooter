import 'package:flame/collisions.dart';
import 'package:flame/src/components/position_component.dart';
import 'package:vector_math/vector_math_64.dart';

mixin CollisionBlockHandle on PositionComponent implements CollisionCallbacks {
  @override
  void onCollision(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    if (ignoreCollisionWhen(intersectionPoints, other)) {
      return;
    }

    final left = position.x;
    final right = position.x + size.x;
    final top = position.y;
    final bottom = position.y + size.y;

    final otherLeft = other.position.x;
    final otherRight = other.position.x + other.size.x;
    final otherTop = other.position.y;
    final otherBottom = other.position.y + other.size.y;

    final nearLeft = otherLeft - right;
    final nearRight = left - otherRight;
    final nearTop = otherTop - bottom;
    final nearBottom = top - otherBottom;

    if (nearLeft > nearTop && nearLeft > nearBottom) {
      position.x = other.position.x - size.x;
    } else if (nearRight > nearTop && nearRight > nearBottom) {
      position.x = other.position.x + other.size.x;
    } else if (nearTop > nearLeft && nearTop > nearRight) {
      position.y = other.position.y - size.y;
    } else if (nearBottom > nearLeft && nearBottom > nearRight) {
      position.y = other.position.y + other.size.y;
    }
  }

  bool ignoreCollisionWhen(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    return false;
  }
}
