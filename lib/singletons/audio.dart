import 'package:flame_audio/flame_audio.dart';

class Audio {
  static final instance = Audio();

  late final AudioPool shootSfx;
  late final AudioPool coinSfx;
  late final AudioPool explosiveSfx;

  static Future<void> initialize() async {
    instance.shootSfx = await FlameAudio.createPool(
      "shoot.mp3",
      maxPlayers: 100,
    );

    instance.coinSfx = await FlameAudio.createPool(
      "score.mp3",
      maxPlayers: 25,
    );

    instance.explosiveSfx = await FlameAudio.createPool(
      "explosive.mp3",
      maxPlayers: 25,
    );
  }

  static Future<void> playShootSfx() {
    return instance.shootSfx.start();
  }

  static Future<void> playCoinSfx() {
    return instance.coinSfx.start();
  }

  static Future<void> playExplosiveSfx() {
    return instance.explosiveSfx.start();
  }
}
