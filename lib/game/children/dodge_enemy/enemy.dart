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

  final Future<void> Function(bool isHittedPlayer) onEnemyRemove;

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
  void onRemove() async {
    if (isCollidedScreenHitboxY) {
      await onEnemyRemove(false);
      isCollidedScreenHitboxY = false;
    } else {
      await onEnemyRemove(true);
    }
    super.onRemove();
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
          isCollidedScreenHitboxY = true;
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
    final isLeftHit = collisionPoint.x == rect.left;
    final isRightHit = collisionPoint.x == rect.right;
    final isTopHit = collisionPoint.y == rect.top;
    final isBottomHit = collisionPoint.y == rect.bottom;

    final isLeftOrRightHit = isLeftHit || isRightHit;
    final isTopOrBottomHit = isTopHit || isBottomHit;

    if (isLeftOrRightHit || isTopOrBottomHit) {
      removeFromParent();
    }
  }
}
