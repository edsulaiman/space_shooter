import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';

import '../../singletons/audio.dart';
import '../game_entry.dart';

class DieEffect extends SpriteAnimationComponent
    with HasGameReference<GameEntry> {
  DieEffect({required Vector2 position}) : super(position: position);

  @override
  Future<void> onLoad() async {
    Audio.playExplosiveSfx();

    final image = await Flame.images.load("misc/explosive_misc.png");
    final spriteSheet = SpriteSheet(image: image, srcSize: Vector2.all(8));

    animation = SpriteAnimation.spriteList(
      [
        spriteSheet.getSpriteById(0),
        spriteSheet.getSpriteById(1),
        spriteSheet.getSpriteById(2),
      ],
      stepTime: 0.1,
      loop: false,
    );

    removeOnFinish = true;

    size = Vector2.all(100);

    return super.onLoad();
  }
}
