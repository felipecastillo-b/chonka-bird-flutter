import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:myapp/game/assets.dart';
import 'package:myapp/game/chonka_bird_game.dart';

class Background extends SpriteComponent with HasGameRef<ChonkaBirdGame>{
  Background();

  @override
  Future<void> onLoad() async {
    final background = await Flame.images.load(Assets.background);
    size = gameRef.size;
    sprite = Sprite(background);
  }
}