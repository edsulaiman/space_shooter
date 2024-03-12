import 'package:flame/flame.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

import 'app_router.dart';
import 'main_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlameAudio.bgm.initialize();

  await Flame.device.fullScreen();
  await Flame.device.setPortraitUpOnly();

  runApp(const _App());
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppRouter.navigatorKey,
      theme: flutterNesTheme(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      onGenerateRoute: (settings) => AppRouter.onGenerateRoute(
        settings: settings,
        pages: MainRouter.route(),
      ),
    );
  }
}
