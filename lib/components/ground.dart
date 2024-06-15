import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:myapp/game/assets.dart';
import 'package:myapp/game/chonka_bird_game.dart';
import 'package:myapp/game/configuration.dart';

class Ground extends ParallaxComponent<ChonkaBirdGame> with HasGameRef<ChonkaBirdGame>{
  Ground();

  @override
  Future<void> onLoad() async {
    final ground = await Flame.images.load(Assets.ground);
    parallax = Parallax([
      ParallaxLayer(
        ParallaxImage(ground, fill: LayerFill.none)
      ),
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    parallax?.baseVelocity.x = Config.gameSpeed;
  }
}