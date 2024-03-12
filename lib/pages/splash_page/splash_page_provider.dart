import 'package:flame/flame.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

import '../../app_router.dart';
import '../../main_router.dart';
import '../../singletons/audio.dart';

class SplashPageProvider {
  SplashPageProvider(this.context) {
    Future.delayed(Duration.zero, () async {
      await Flame.images.loadAllImages();

      await FlameAudio.audioCache.loadAll([
        "shoot.mp3",
        "score.mp3",
        "explosive.mp3",
        "tropical_fantasy.mp3",
      ]);

      await Audio.initialize();

      await FlameAudio.bgm.play("tropical_fantasy.mp3");

      AppRouter.pushNamedAndRemoveAll(MainRouter.homePath);
    });
  }

  late final BuildContext context;
}
