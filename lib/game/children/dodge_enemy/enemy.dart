import 'dart:math';
import 'dart:ui';

import 'package:comic_viwer_practice/game/children/dodge_enemy/player.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Enemy extends CircleComponent with CollisionCallbacks {
  Enemy({
    required this.onEnemyRemove,
  }) {
    radius = 30;
    paint = Paint()..color = Colors.red;
    final vy = 500 * sin(spawnAngle * pi / 180);
    velocity = Vector2(0, vy);
  }

  final Future<void> Function() onEnemyRemove;

  late Vector2 velocity;
  bool isCollidedScreenHitboxY = false;

  double get spawnAngle {
    final random = Random().nextDouble();
    final spawnAngle = lerpDouble(
      45,
      135,
      random,
    )!;

    return spawnAngle;
  }

  @override
  Future<void>? onLoad() async {
    final hitbox = CircleHitbox(
      radius: radius,
    );

    await add(hitbox);

    return await super.onLoad();
  }

  @override
  void update(double dt) {
    position += velocity * dt;
    super.update(dt);
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    final collisionPoint = intersectionPoints.first;
    if (other is Player) {
      final playerRect = other.toAbsoluteRect();

      updateBallTrajectory(collisionPoint, playerRect);
    }
    super.onCollisionStart(intersectionPoints, other);
  }

  @override
  void onCollision(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    if (other is ScreenHitbox) {
      final screenHitBoxRect = other.toAbsoluteRect();

      for (final point in intersectionPoints) {
        if (point.y == screenHitBoxRect.bottom) {
          removeFromParent();
        }
      }
    }
    super.onCollision(intersectionPoints, other);
  }

  void updateBallTrajectory(
    Vector2 collisionPoint,
    Rect rect,
  ) {
    final isTopHit = collisionPoint.y == rect.top;

    if (isTopHit) {
      removeFromParent();
    }
  }
}
