import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/timer.dart';
import 'package:myapp/components/background.dart';
import 'package:myapp/components/chonka.dart';
import 'package:myapp/components/ground.dart';
import 'package:myapp/components/pipe_group.dart';
import 'package:myapp/game/configuration.dart';
import 'package:flutter/painting.dart';

class ChonkaBirdGame extends FlameGame with TapDetector, HasCollisionDetection{
  ChonkaBirdGame();  

  late Chonka chonka;
  late TextComponent score;
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  bool isHit = false;

  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      chonka = Chonka(),
      PipeGroup(),
      score = buildScore(),
    ]);

    interval.onTick = () => add(PipeGroup());
  }

  TextComponent buildScore() {
    return TextComponent(
      text: 'Score: 0',
      position: Vector2(size.x / 2, size.y / 2 * 0.2),
      anchor: Anchor.center,
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 40, fontWeight: FontWeight.bold, fontFamily: 'Game'
        ),
      )
    );
  }

  @override
  void onTap() {
    chonka.fly();
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);

    score.text = 'Score: ${chonka.score}';
  }
}