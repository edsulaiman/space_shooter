import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';

import '../game_entry.dart';

class FireButton extends SpriteComponent
    with HasGameReference<GameEntry>, TapCallbacks {
  @override
  Future<void> onLoad() async {
    final image = await Flame.images.load("ui.png");
    final spriteSheet = SpriteSheet.fromColumnsAndRows(
      image: image,
      columns: 16,
      rows: 8,
    );

    sprite = spriteSheet.getSprite(4, 1);

    size = Vector2.all(100);

    position = Vector2(
      game.size.x - size.x - 50,
      game.size.y - size.y - 100,
    );

    return super.onLoad();
  }

  @override
  void onTapDown(TapDownEvent _) {
    game.world.player.isFiring = true;
    super.onTapDown(_);
  }

  @override
  void onTapUp(TapUpEvent _) {
    game.world.player.isFiring = false;
    super.onTapUp(_);
  }

  @override
  void onTapCancel(TapCancelEvent _) {
    game.world.player.isFiring = false;
    super.onTapCancel(_);
  }
}
