import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

import '../../app_router.dart';
import '../../main_router.dart';
import '../../singletons/audio.dart';

class SplashPageProvider {
  SplashPageProvider(this.context) {
    Future.delayed(const Duration(seconds: 1), () async {
      await Flame.images.loadAllImages();
      await Audio.initialize();

      AppRouter.pushNamedAndRemoveAll(MainRouter.homePath);
    });
  }

  late final BuildContext context;
}
