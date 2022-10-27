import 'package:comic_viwer_practice/constants/constants.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flutter/material.dart';

class Paddle extends RectangleComponent with CollisionCallbacks, DragCallbacks {
  Paddle({
    required this.draggingPaddle,
  }) : super(
          size: Vector2(kPaddleWidth, kPaddleHeight),
          paint: Paint()..color = kPaddleColor,
        );

  final void Function(DragUpdateEvent event) draggingPaddle;

  @override
  Future<void>? onLoad() async {
    final paddleHitbox = RectangleHitbox(
      size: size,
    );

    add(paddleHitbox);

    return await super.onLoad();
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    draggingPaddle(event);
    super.onDragUpdate(event);
  }
}
