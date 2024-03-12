import 'package:flutter/foundation.dart';

class GameProgress {
  static final instance = GameProgress();

  final coins = ValueNotifier(0);
}
