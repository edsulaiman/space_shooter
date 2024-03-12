import 'dart:async';

import 'package:flame/components.dart';

import 'actors/enemy.dart';
import 'actors/player.dart';
import 'game_entry.dart';
import 'utils/spawn_util.dart';

class GameWorld extends World with HasGameReference<GameEntry> {
  late final Timer interval;

  final Player player = Player();

  final maxEnemySpawn = 30;
  final enemyPerSpawn = 5;
  final enemySpawnDistance = 1000.0;

  @override
  Future<void> onLoad() async {
    interval = Timer(
      5,
      onTick: _spawnEnemy,
      repeat: true,
    );

    add(player);
  }

  @override
  void update(double dt) {
    interval.update(dt);
    super.update(dt);
  }

  void _spawnEnemy() {
    final playerPosition = player.position;
    final currentEnemyCount = children.whereType<Enemy>().length;

    if (currentEnemyCount > maxEnemySpawn) {
      return;
    }

    final enemyCount = enemyPerSpawn;
    for (int i = 0; i < enemyCount; i++) {
      final enemyPosition = SpawnUtil.getSpawnPosition(
        enemySpawnDistance,
        playerPosition,
      );

      final enemy = Enemy(position: enemyPosition);
      add(enemy);
    }
  }
}
