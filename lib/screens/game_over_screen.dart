import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/game/assets.dart';
import 'package:myapp/game/chonka_bird_game.dart';

class GameOverScreen extends StatelessWidget {
  final ChonkaBirdGame game;
  static const String id = 'gameOver';
  const GameOverScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black38,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Score: ${game.chonka.score}',
              style: const TextStyle(
                fontSize: 60,
                color: Colors.white,
                fontFamily: 'Game',
              ),
            ),
            const SizedBox(height: 20,),
            Image.asset(Assets.gameOver),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: onRestart,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: const Text(
                'Restart',
                style: TextStyle(fontSize: 20),
              )
              ),
          ],
        ),
        ),
    );
  }

  void onRestart() {
    game.chonka.reset();
    game.overlays.remove('gameOver');
    game.resumeEngine();
  }
}