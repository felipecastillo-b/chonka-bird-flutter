import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:myapp/game/assets.dart';
import 'package:myapp/game/chonka_bird_game.dart';
import 'package:myapp/game/configuration.dart';
import 'package:myapp/game/pipe_position.dart';

class Pipe extends SpriteComponent with HasGameRef<ChonkaBirdGame> {
  Pipe({
    required this.pipePosition,
    required this.height,
  });

  @override
  final double height;
  final PipePosition pipePosition;

  Future<void> onLoad() async {
    final pipe = await Flame.images.load(Assets.pipe);
    final pipeRotated = await Flame.images.load(Assets.pipeRotated);
    size = Vector2(50, height);

    switch (pipePosition) {
      case PipePosition.top:
        position.y = 0;
        sprite = Sprite(pipeRotated);
        break;
      case PipePosition.bottom:
      position.y = gameRef.size.y - size.y - Config.groundHeight;
      sprite = Sprite(pipe);
      break;
    }

    add(RectangleHitbox());
  }
}