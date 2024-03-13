import 'package:flame_audio/flame_audio.dart';

class Audio {
  static final instance = Audio();

  late final AudioPool clickSfx;
  late final AudioPool playerShootSfx;
  late final AudioPool enemyShootSfx;
  late final AudioPool coinSfx;
  late final AudioPool explosiveSfx;

  static Future<void> initialize() async {
    await FlameAudio.audioCache.loadAll([
      "click.mp3",
      "shoot.mp3",
      "shoot2.mp3",
      "score.mp3",
      "explosive.mp3",
      "tropical_fantasy.mp3",
    ]);

    instance.clickSfx = await FlameAudio.createPool(
      "click.mp3",
      maxPlayers: 10,
    );

    instance.playerShootSfx = await FlameAudio.createPool(
      "shoot.mp3",
      maxPlayers: 100,
    );

    instance.enemyShootSfx = await FlameAudio.createPool(
      "shoot2.mp3",
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

    await FlameAudio.bgm.play("tropical_fantasy.mp3", volume: .75);
  }

  static Future<void> playClickSfx() {
    return instance.clickSfx.start(volume: 4);
  }

  static Future<void> playShootSfx() {
    return instance.playerShootSfx.start(volume: 1.25);
  }

  static Future<void> playShoot2Sfx() {
    return instance.enemyShootSfx.start(volume: .25);
  }

  static Future<void> playCoinSfx() {
    return instance.coinSfx.start(volume: .5);
  }

  static Future<void> playExplosiveSfx() {
    return instance.explosiveSfx.start();
  }
}
