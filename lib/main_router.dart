import 'package:witt/witt.dart';

import 'app_router.dart';
import 'pages/game_page/game_page.dart';
import 'pages/home_page/home_page.dart';
import 'pages/splash_page/splash_page.dart';
import 'pages/splash_page/splash_page_provider.dart';

class MainRouter {
  static const splashPath = "/";
  static const homePath = "/home";
  static const gamePath = "/game";

  static List<AppPage> route() {
    return [
      AppPage(
        path: splashPath,
        builder: (context, args) => const SplashPage(),
        providerBuilder: (context, args) => [
          WProvider(create: (context) => SplashPageProvider(context)),
        ],
      ),
      AppPage(
        path: homePath,
        builder: (context, args) => const HomePage(),
      ),
      AppPage(
        path: gamePath,
        builder: (context, args) => const GamePage(),
      ),
    ];
  }
}
