import 'package:comic_viwer_practice/game/ball.dart';
import 'package:comic_viwer_practice/game/breakable_block.dart';
import 'package:comic_viwer_practice/game/gameover_view.dart';
import 'package:comic_viwer_practice/game/initial_view.dart';
import 'package:comic_viwer_practice/game/paddle.dart';
import 'package:flame/collisions.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class GameLoopView extends StatelessWidget {
  GameLoopView({Key? key}) : super(key: key);

  final gameLoop = GameLoop(GameLoopState(0, false));

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Center(
      child: SizedBox(
        height: deviceHeight * 0.8,
        width: deviceWidth * 0.8,
        child: GameWidget(
          game: gameLoop,
          loadingBuilder: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
          overlayBuilderMap: {
            'initial': (context, GameLoop gameLoop) => InitialView(
                  gameLoop: gameLoop,
                ),
            'gameover': (context, GameLoop gameLoop) =>
                GameOverView(gameLoop: gameLoop),
          },
          initialActiveOverlays: const ['initial'],
        ),
      ),
    );
  }
}

class GameLoop extends FlameGame
    with CollisionCallbacks, HasKeyboardHandlerComponents {
  GameLoop(this.gameLoopState) : super();

  static const blockColumnCount = 6;
  static const blockRowCount = 2;
  final GameLoopState gameLoopState;

  void onOverlayChanged() {
    if (overlays.isActive('initial')) {
      pauseEngine();
    } else {
      resumeEngine();
    }
  }

  @override
  void update(double dt) {
    if (gameLoopState.isGameOver ||
        gameLoopState.score >= blockColumnCount * blockRowCount) {
      final allBlocks = children.query();
      final ball = children.query();
      removeAll(allBlocks);
      removeAll(ball);
      overlays.add('gameover');
    }
    super.update(dt);
  }

  void reload() {
    addInitialBlock();
    addInitialBall();
    gameLoopState.reset();
  }

  void addInitialBlock() {
    final blockWidth = canvasSize.x * 0.1;
    final blockHeight = blockWidth * 0.6;
    for (var i = 0; i < blockColumnCount; i++) {
      for (var j = 0; j < blockRowCount; j++) {
        final blockPositionX =
            (canvasSize.x / (blockColumnCount + 1)) * (i + 1) - blockWidth / 2;
        final blockPositionY = canvasSize.y * 0.03 * (j + 1) + blockHeight * j;
        add(BreakableBlock(
          Vector2(blockWidth, blockHeight),
          Vector2(blockPositionX, blockPositionY),
        ));
      }
    }
  }

  void addInitialPaddle() {
    final paddleWidth = canvasSize.x * 0.2;
    final paddleHeight = paddleWidth * 0.1;
    final paddleX = (canvasSize.x - paddleWidth) / 2;
    final paddleY = canvasSize.y * 0.9;
    add(Paddle(Vector2(paddleWidth, paddleHeight), Vector2(paddleX, paddleY)));
  }

  void addInitialBall() {
    final ballRadius = canvasSize.x * 0.03;
    final ballX = (canvasSize.x - ballRadius) / 2;
    final ballY = canvasSize.y / 2;
    add(Ball(ballRadius, Vector2(ballX, ballY)));
  }

  @override
  void onMount() {
    paused = true;
    // overlays.
    super.onMount();
  }

  @override
  Future<void>? onLoad() async {
    await super.onLoad();
    add(ScreenHitbox());
    addInitialBlock();
    addInitialPaddle();
    addInitialBall();
    children.register<BreakableBlock>();
    children.register<Ball>();
  }
}

class GameLoopState {
  GameLoopState(
    this.score,
    this.isGameOver,
  );

  int score;
  bool isGameOver;

  void reset() {
    score = 0;
    isGameOver = false;
  }

  void incrementScore() {
    score++;
  }

  void gameOver() {
    isGameOver = true;
  }
}
