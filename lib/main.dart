import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:myapp/game/chonka_bird_game.dart';

void main() {
  final game = ChonkaBirdGame();
  runApp(
    GameWidget(game: game),
  );
}
