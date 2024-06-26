import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/game/assets.dart';
import 'package:myapp/game/chonka_movement.dart';
import 'package:myapp/game/chonka_bird_game.dart';
import 'package:myapp/game/configuration.dart';

class Chonka extends SpriteGroupComponent<ChonkaMovement> with HasGameRef<ChonkaBirdGame>, CollisionCallbacks {  
  Chonka();

  int score = 0;

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

    add(CircleHitbox());
  }

  void fly(){
    add(
      MoveByEffect(
      Vector2(0, Config.gravity), 
      EffectController(duration: 0.2, curve: Curves.decelerate),
      onComplete: () => current = ChonkaMovement.down,
      ),
    );
    current = ChonkaMovement.up;
    FlameAudio.play(Assets.flying);
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);
    gameOver();
  }

  void reset() {
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    score = 0;
  }

  void gameOver() {
    FlameAudio.play(Assets.collision);
    gameRef.overlays.add('gameOver');
    gameRef.pauseEngine();
    game.isHit = true;
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += Config.chonkaVelocity * dt;
    if(position.y < 1) {
      gameOver();
    }
  }
}