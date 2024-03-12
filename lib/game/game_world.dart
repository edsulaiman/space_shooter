import 'dart:async';

import 'package:flame/components.dart';

import 'actors/enemy.dart';
import 'actors/player.dart';
import 'game_entry.dart';
import 'utils/spawn_util.dart';

class GameWorld extends World with HasGameReference<GameEntry> {
  late final Timer spawnInterval;
  late final Timer difficultyInterval;

  final Player player = Player();

  int enemyPerSpawn = 5;
  final enemySpawnDistance = 1000.0;

  @override
  Future<void> onLoad() async {
    _spawnEnemy();

    spawnInterval = Timer(
      10,
      onTick: _spawnEnemy,
      repeat: true,
    );

    difficultyInterval = Timer(
      30,
      onTick: () => enemyPerSpawn += 1,
      repeat: true,
    );

    add(player);
  }

  @override
  void update(double dt) {
    spawnInterval.update(dt);
    difficultyInterval.update(dt);

    super.update(dt);
  }

  void _spawnEnemy() {
    final playerPosition = player.position;
    for (int i = 0; i < enemyPerSpawn; i++) {
      final enemyPosition = SpawnUtil.getSpawnPosition(
        enemySpawnDistance,
        playerPosition,
      );

      final enemy = Enemy(position: enemyPosition);
      add(enemy);
    }
  }
}
