import 'dart:async';

import 'package:flame/components.dart';

class SpawnBulletArea extends PositionComponent {
  SpawnBulletArea({
    this.spawnSize,
    this.spawnPosition,
  });

  final Vector2? spawnSize;

  final Vector2? spawnPosition;

  @override
  FutureOr<void> onLoad() {
    final parentWidth = (parent as PositionComponent).size.x;

    size = spawnSize ?? Vector2.all(25);

    position = spawnPosition ?? Vector2(parentWidth / 2 - size.x / 2, -25);

    return super.onLoad();
  }
}
