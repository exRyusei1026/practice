import 'package:comic_viwer_practice/game/ball.dart';
import 'package:comic_viwer_practice/game/game_loop_view.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class BreakableBlock extends RectangleComponent
    with CollisionCallbacks, HasGameRef<GameLoop> {
  BreakableBlock(
    size,
    position,
  ) : super(
          size: size,
          position: position,
        );

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Ball) {
      gameRef.gameLoopState.incrementScore();
      gameRef.remove(this);
    }
    super.onCollision(intersectionPoints, other);
  }
}
