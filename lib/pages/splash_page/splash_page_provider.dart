import 'package:flutter/material.dart';

import '../../app_router.dart';
import '../../main_router.dart';

class SplashPageProvider {
  SplashPageProvider(this.context) {
    Future.delayed(const Duration(seconds: 3), () {
      AppRouter.pushNamedAndRemoveAll(MainRouter.homePath);
    });
  }

  late final BuildContext context;
}
