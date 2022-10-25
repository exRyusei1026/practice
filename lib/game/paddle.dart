import 'package:comic_viwer_practice/game/game_loop_view.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Paddle extends RectangleComponent
    with CollisionCallbacks, KeyboardHandler, HasGameRef<GameLoop> {
  Paddle(
    size,
    position,
  ) : super(
          size: size,
          position: position,
        );

  final _dx = 15;
  var _isRightPressed = false;
  var _isLeftPressed = false;
  var _isRightScreenCollided = false;
  var _isLeftScreenCllided = false;

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (event is RawKeyUpEvent) {
      _isLeftPressed = false;
      _isRightPressed = false;
      return true;
    }
    if (event is RawKeyDownEvent) {
      if (keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
        _isLeftPressed = true;
      } else if (keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
        _isRightPressed = true;
      }
    }
    return true;
  }

  @override
  void onGameResize(Vector2 size) {}

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is ScreenHitbox && x < 0) {
      _isLeftScreenCllided = true;
    }
    if (other is ScreenHitbox && x + width > gameRef.canvasSize.x) {
      _isRightScreenCollided = true;
    }
    super.onCollision(intersectionPoints, other);
  }

  @override
  void update(double dt) {
    if (_isRightPressed && !_isRightScreenCollided) {
      x += _dx;
      _isLeftScreenCllided = false;
    }
    if (_isLeftPressed && !_isLeftScreenCllided) {
      x -= _dx;
      _isRightScreenCollided = false;
    }
    super.update(dt);
  }
}
