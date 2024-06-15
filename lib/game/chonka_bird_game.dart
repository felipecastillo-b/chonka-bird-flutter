import 'package:flame/game.dart';
import 'package:myapp/components/background.dart';
import 'package:myapp/components/chonka.dart';
import 'package:myapp/components/ground.dart';

class ChonkaBirdGame extends FlameGame {
  late Chonka chonka;
  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      chonka = Chonka(),
    ]);
  }
}