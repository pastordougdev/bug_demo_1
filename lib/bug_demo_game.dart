import 'package:flame_bloc/flame_bloc.dart';
import 'package:flame/game.dart';
import 'imports.dart';

class BugDemoGame extends FlameGame with HasTappables {
  late RouterComponent router;

  @override
  Future<void> onLoad() async {
    router = RouterComponent(
      routes: {
        'main_menu': Route(MainMenu.new),
        'route1': Route(Screen1.new),
        'route2': Route(Screen2.new),
      },
      initialRoute: 'main_menu',
    );

    final bloc = FlameBlocProvider<DemoBloc, DemoState>(
        create: () => DemoBloc(),
        children: [
          router,
        ]);

    add(bloc);
  }
}
