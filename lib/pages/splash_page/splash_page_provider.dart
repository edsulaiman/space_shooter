import 'package:flutter/material.dart';

import '../../app_router.dart';
import '../../main_router.dart';

class SplashPageProvider {
  SplashPageProvider(this.context) {
    Future.delayed(const Duration(seconds: 3), () {
      AppRouter.pushNamed(MainRouter.homePath);
    });
  }

  late final BuildContext context;
}
