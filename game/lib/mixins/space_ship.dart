import 'dart:async';

import 'package:flame/components.dart';

import '../components/projectile.dart';
import '../components/spawn_bullet_area.dart';
import '../game_entry.dart';

mixin SpaceShip<ProjectileTarget> on PositionComponent
    implements HasGameReference<GameEntry> {
  final SpawnBulletArea spawnBulletArea = SpawnBulletArea();

  /// Space ship max health.
  int maxHealth = 100;

  /// Current space ship health.
  int health = 100;

  /// Projectile type when firing.
  String projectileType = "";

  /// Speed when moving.
  double speed = 1000;

  /// Projectile speed.
  double projectileSpeed = 2000;

  /// Interval between each fire.
  int firingCooldown = 50;

  /// Whether this space ship on firing state.
  bool isFiring = false;

  /// Whether this space ship firing is on cooldown.
  bool isFiringCooldown = false;

  @override
  FutureOr<void> onLoad() {
    add(spawnBulletArea);
  }

  @override
  void update(double dt) {
    _spawnProjectile();

    if (health <= 0) {
      die();
    }

    super.update(dt);
  }

  /// Method run on health <= 0.
  void die() {}

  void _spawnProjectile() {
    if (!isFiring || isFiringCooldown) {
      return;
    }

    final projectilePosition = spawnBulletArea.absolutePosition;
    final projectileAngle = spawnBulletArea.absoluteAngle;

    final projectile = Projectile<ProjectileTarget>(
      speed: projectileSpeed,
      projectileType: projectileType,
      position: projectilePosition,
      angle: projectileAngle,
      facing: ProjectileFacing.top,
      size: Vector2.all(25),
    );

    game.world.add(projectile);
    isFiringCooldown = true;

    Future.delayed(
      Duration(milliseconds: firingCooldown),
      () => isFiringCooldown = false,
    );
  }
}
