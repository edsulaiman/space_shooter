import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:watt/watt.dart';

import 'app_router.dart';
import 'main_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setPortraitUpOnly();

  runApp(const _App());
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return Watt(
      builder: (context, theme, darkTheme) {
        return MaterialApp(
          navigatorKey: AppRouter.navigatorKey,
          theme: theme,
          darkTheme: darkTheme,
          onGenerateRoute: (settings) => AppRouter.onGenerateRoute(
            settings: settings,
            pages: MainRouter.route(),
          ),
        );
      },
    );
  }
}
