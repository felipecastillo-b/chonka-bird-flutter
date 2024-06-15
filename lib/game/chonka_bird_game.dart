import 'package:flame/game.dart';
import 'package:flame/timer.dart';
import 'package:myapp/components/background.dart';
import 'package:myapp/components/chonka.dart';
import 'package:myapp/components/ground.dart';
import 'package:myapp/components/pipe_group.dart';
import 'package:myapp/game/configuration.dart';

class ChonkaBirdGame extends FlameGame {
  ChonkaBirdGame();  

  late Chonka chonka;
  Timer interval = Timer(Config.pipeInterval, repeat: true);

  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      chonka = Chonka(),
      PipeGroup(),
    ]);

    interval.onTick = () => add(PipeGroup());
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
  }
}