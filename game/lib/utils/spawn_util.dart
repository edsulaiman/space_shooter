import 'dart:math';

import 'package:flame/components.dart';

class SpawnUtil {
  static final random = Random();

  static Vector2 getSpawnPosition(double distance, Vector2 center) {
    final angle = random.nextDouble() * 2 * pi;
    final spawnX = center.x + distance * cos(angle);
    final spawnY = center.y + distance * sin(angle);

    return Vector2(spawnX, spawnY);
  }
}
