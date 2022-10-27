import 'dart:ui';
import 'dart:math';

import 'package:comic_viwer_practice/constants/constants.dart';
import 'package:comic_viwer_practice/game/children/ball.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Block extends RectangleComponent with CollisionCallbacks {
  Block({
    required this.blockSize,
    required this.onBlockRemove,
  }) : super(
          size: blockSize,
          paint: Paint()
            ..color = kBlockColors[Random().nextInt(kBlockColors.length)],
        );

  final Vector2 blockSize;
  final Future<void> Function() onBlockRemove;

  @override
  Future<void>? onLoad() async {
    final blockHitbox = RectangleHitbox(
      size: size,
    );

    await add(blockHitbox);

    return super.onLoad();
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    if (other is Ball) {
      removeFromParent();
    }
    super.onCollisionStart(intersectionPoints, other);
  }

  @override
  void onRemove() async {
    await onBlockRemove();
    super.onRemove();
  }
}
