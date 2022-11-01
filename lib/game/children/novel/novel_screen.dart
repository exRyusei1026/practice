import 'dart:async';
import 'dart:ui';

import 'package:comic_viwer_practice/game/children/novel/novel_text_box.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

class NovelScreen extends FlameGame {
  NovelScreen();

  var monika = SpriteComponent();

  @override
  Future<void>? onLoad() async {
    monika
      ..sprite = await loadSprite('monika.png')
      ..size = Vector2(100, 200)
      ..x = 30
      ..y = 0;
    await add(monika);
    await add(NovelTextBox(
        text: 'Hello Flame hogehogehogehogehogehogehogehogehoge', game: this));
    return await super.onLoad();
  }

  Future<Image> getImage(String path) async {
    final completer = Completer();
    var img = NetworkImage(path);
    img
        .resolve(const ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo info, bool _) {
      completer.complete(info);
    }));
    final imageInfo = await completer.future;
    return imageInfo.image;
  }
}
