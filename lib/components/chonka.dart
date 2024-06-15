import 'package:flame/components.dart';
import 'package:myapp/game/assets.dart';
import 'package:myapp/game/chonka_movement.dart';
import 'package:myapp/game/chonka_bird_game.dart';

class Chonka extends SpriteGroupComponent<ChonkaMovement> with HasGameRef<ChonkaBirdGame> {  
  Chonka();

  @override
  Future<void> onLoad() async {
    final chonkaMidFlap = await gameRef.loadSprite(Assets.chonkaMidFlap);
    final chonkaUpFlap = await gameRef.loadSprite(Assets.chonkaUpFlap);
    final chonkaDownFlap = await gameRef.loadSprite(Assets.chonkaDownFlap);

    size = Vector2(50, 40);
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    current = ChonkaMovement.middle;
    sprites = {
      ChonkaMovement.middle: chonkaMidFlap,
      ChonkaMovement.up: chonkaUpFlap,
      ChonkaMovement.down: chonkaDownFlap
    };
  }
}