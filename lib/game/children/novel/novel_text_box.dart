import 'package:comic_viwer_practice/game/children/novel/novel_screen.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class NovelTextBox extends TextBoxComponent {
  NovelTextBox({
    required this.text,
    required this.game,
  }) : super(
          text: text,
          position: game.size,
          boxConfig: TextBoxConfig(
            dismissDelay: 3.0,
            maxWidth: game.size.x * 0.5,
            timePerChar: 0.1,
          ),
        ) {
    anchor = Anchor.bottomRight;
  }

  @override
  final String text;
  final NovelScreen game;

  @override
  void drawBackground(Canvas c) {
    final rect = Rect.fromLTWH(0, 0, width, height);
    final color = Paint()..color = const Color(0x8f37474f);
    c.drawRect(rect, color);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (finished) {
      game.remove(this);
    }
  }
}
