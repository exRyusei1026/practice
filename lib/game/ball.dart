import 'package:comic_viwer_practice/game/breakable_block.dart';
import 'package:comic_viwer_practice/game/game_loop_view.dart';
import 'package:comic_viwer_practice/game/paddle.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Ball extends CircleComponent
    with CollisionCallbacks, HasGameRef<GameLoop> {
  Ball(radius, position) : super(radius: radius, position: position);
  var dx = 5;
  var dy = 5;

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is ScreenHitbox && x + dx + radius / 2 < 0) {
      dx *= -1;
    } else if (x + dx + radius / 2 > gameRef.canvasSize.x) {
      dx *= -1;
    } else if (other is ScreenHitbox && y + dy + radius / 2 < 0) {
      dy *= -1;
    } else if (y + dy + radius / 2 > gameRef.canvasSize.y) {
      gameRef.gameLoopState.gameOver();
    } else if (other is BreakableBlock) {
      dy *= -1;
    } else if (other is Paddle) {
      dy *= -1;
    }
    super.onCollision(intersectionPoints, other);
  }

  @override
  void update(double dt) {
    position = Vector2(x + dx, y + dy);
    super.update(dt);
  }
}
