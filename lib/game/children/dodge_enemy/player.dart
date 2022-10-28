import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flutter/material.dart';

class Player extends RectangleComponent with CollisionCallbacks, DragCallbacks {
  Player({
    required this.draggingPlayer,
  }) : super(
          size: Vector2(30, 30),
          paint: Paint()..color = Colors.white,
        );

  final void Function(DragUpdateEvent event) draggingPlayer;

  @override
  Future<void>? onLoad() async {
    final playerHitbox = RectangleHitbox(
      size: size,
    );

    await add(playerHitbox);

    return super.onLoad();
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    draggingPlayer(event);
    super.onDragUpdate(event);
  }
}
