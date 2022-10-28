import 'package:comic_viwer_practice/game/children/block_breaker/block_breaker.dart';
import 'package:comic_viwer_practice/game/children/dodge_enemy/dodge_enemy.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
  GameScreen({Key? key}) : super(key: key);

  final game = DodgeEnemy();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GameWidget(game: game),
    );
  }
}
