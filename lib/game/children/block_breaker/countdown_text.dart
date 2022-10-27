import 'dart:ui';

import 'package:comic_viwer_practice/constants/constants.dart';
import 'package:flame/components.dart';

class CountdownText extends TextComponent {
  CountdownText({required this.count})
      : super(
          size: Vector2.all(kCountdownSize),
          textRenderer: TextPaint(
            style: kCountdownTextStyle,
          ),
          text: '$count',
        );

  final int count;

  @override
  void render(Canvas canvas) async {
    super.render(canvas);
    await Future<void>.delayed(const Duration(seconds: 1));
    removeFromParent();
  }
}
