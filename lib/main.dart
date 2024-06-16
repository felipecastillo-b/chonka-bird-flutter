import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:myapp/game/chonka_bird_game.dart';
import 'package:myapp/screens/game_over_screen.dart';
import 'package:myapp/screens/main_menu_screen.dart';

void main() {
  final game = ChonkaBirdGame();
  runApp(
    GameWidget(
      game: game,
      initialActiveOverlays: const [MainMenuScreen.id],
      overlayBuilderMap: {
        'mainMenu': (context, _) => MainMenuScreen(game: game),
        'gameOver': (context, _) => GameOverScreen(game: game),
      },
      ),
  );
}
