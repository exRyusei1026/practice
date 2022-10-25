import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

class GameScreen extends FlameGame with HasTappables {
  @override
  Color backgroundColor() => Colors.white;

  @override
  Future<void>? onLoad() async {
    add(Square(Vector2(100, 200)));
  }

  @override
  void onTapUp(int pointerId, TapUpInfo info) {
    super.onTapUp(pointerId, info);
    if (!info.handled) {
      final touchPoint = info.eventPosition.game;
      add(Square(touchPoint));
    }
  }
}

class Square extends PositionComponent with Tappable {
  static const speed = 0.25;
  static const squareSize = 128.0;

  static Paint black = BasicPalette.black.paint();
  static Paint red = BasicPalette.red.paint();
  static Paint blue = BasicPalette.blue.paint();

  Square(Vector2 position) : super(position: position);

  @override
  void render(Canvas canvas) {
    canvas.drawRect(size.toRect(), black);
    canvas.drawRect(const Rect.fromLTWH(0, 0, 3, 3), red);
    canvas.drawRect(Rect.fromLTWH(width / 2, height / 2, 3, 3), blue);
  }

  @override
  void update(double dt) {
    super.update(dt);
    angle += speed * dt;
    angle %= 2 * pi;
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    size.setValues(squareSize, squareSize);
    anchor = Anchor.center;
  }

  @override
  bool onTapUp(TapUpInfo info) {
    removeFromParent();
    info.handled = true;
    return true;
  }
}
