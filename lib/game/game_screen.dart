import 'package:comic_viwer_practice/game/children/novel/novel_screen.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GameScreen extends StatelessWidget {
  GameScreen({Key? key}) : super(key: key);

  final game = NovelScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            Navigator.of(context).pop();
            await SystemChrome.setPreferredOrientations([
              DeviceOrientation.portraitUp,
            ]);
          },
          icon: Icon(Icons.close),
        ),
      ),
      body: GameWidget(game: game),
    );
  }
}
