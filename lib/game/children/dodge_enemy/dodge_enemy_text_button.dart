import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/experimental.dart';

class DodgeEnemyTextButton extends TextBoxComponent with TapCallbacks {
  DodgeEnemyTextButton(
    String text, {
    required this.onTapDownTextButton,
    required this.renderTextButton,
  }) : super(
          text: text,
          size: Vector2(200, 50),
          align: Anchor.center,
        );

  final Future<void> Function() onTapDownTextButton;
  final void Function(Canvas canvas) renderTextButton;

  @override
  void onTapDown(TapDownEvent event) async {
    await onTapDownTextButton();
    super.onTapDown(event);
  }

  @override
  void render(Canvas c) {
    renderTextButton(c);
    super.render(c);
  }
}
