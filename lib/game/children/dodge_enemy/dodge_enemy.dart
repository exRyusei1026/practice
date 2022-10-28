import 'dart:math';

import 'package:comic_viwer_practice/game/children/dodge_enemy/countdown_text.dart';
import 'package:comic_viwer_practice/game/children/dodge_enemy/dodge_enemy_text_button.dart';
import 'package:comic_viwer_practice/game/children/dodge_enemy/enemy.dart';
import 'package:comic_viwer_practice/game/children/dodge_enemy/player.dart';
import 'package:flame/collisions.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class DodgeEnemy extends FlameGame
    with HasCollisionDetection, HasDraggableComponents, HasTappableComponents {
  DodgeEnemy();

  bool get isCleared => children.whereType<Enemy>().isEmpty;

  @override
  Future<void>? onLoad() async {
    final player = Player(draggingPlayer: draggingPlayer);
    final playerSize = player.size;
    player
      ..position.x = size.x / 2 - playerSize.x / 2
      ..position.y = size.y - playerSize.y - 150;

    await addTextButton('Start!');

    await addAll([
      ScreenHitbox(),
      player,
    ]);

    return await super.onLoad();
  }

  Future<void> resetEnemy() async {
    final enemy = Enemy(
      onEnemyRemove: onEnemyRemove,
    );
    enemy.position
      ..x = Random().nextDouble() * (size.x - enemy.size.x)
      ..y = -size.y + enemy.size.y;
    await add(enemy);
    await Future.delayed(const Duration(seconds: 1));
  }

  Future<void> addTextButton(String text) async {
    final myTextButton = DodgeEnemyTextButton(
      text,
      onTapDownTextButton: onTapDownTextbutton,
      renderTextButton: renderTextButton,
    );

    myTextButton.position
      ..x = size.x / 2 - myTextButton.size.x / 2
      ..y = size.y / 2 - myTextButton.size.y / 2;

    await add(myTextButton);
  }

  Future<void> onTapDownTextbutton() async {
    children.whereType<DodgeEnemyTextButton>().forEach((button) {
      button.removeFromParent();
    });

    await countdown();
    for (var i = 0; i < 10; i++) {
      await resetEnemy();
      if (isCleared) break;
    }
  }

  void renderTextButton(Canvas canvas) {
    final myTextButton = children.whereType<DodgeEnemyTextButton>().first;
    final rect = Rect.fromLTWH(0, 0, myTextButton.size.x, myTextButton.size.y);
    final bgPaint = Paint()..color = Colors.red;
    canvas.drawRect(rect, bgPaint);
  }

  Future<void> onEnemyRemove(bool isHittedPlayer) async {
    if (isHittedPlayer) {
      await addTextButton('Retry');
      children.whereType<Enemy>().forEach((enemy) {
        enemy.removeFromParent();
      });
    }
    if (!isHittedPlayer && isCleared) {
      await addTextButton('Clear!');
      children.whereType<Enemy>().forEach((enemy) {
        enemy.removeFromParent();
      });
    }
  }

  void draggingPlayer(DragUpdateEvent event) {
    final player = children.whereType<Player>().first;

    player.position.x += event.delta.x;

    if (player.position.x < 0) {
      player.position.x = 0;
    }
    if (player.position.x > size.x - player.size.x) {
      player.position.x = size.x - player.size.x;
    }
  }

  Future<void> countdown() async {
    for (var i = 3; i > 0; i--) {
      final countdownText = CountdownText(count: i);

      countdownText.position
        ..x = size.x / 2 - countdownText.size.x / 2
        ..y = size.y / 2 - countdownText.size.y / 2;

      await add(countdownText);

      await Future<void>.delayed(const Duration(seconds: 1));
    }
  }
}
