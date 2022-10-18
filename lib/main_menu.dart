import 'package:flame/game.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flutter/material.dart';

import 'imports.dart';

class MainMenu extends Entity {
  @override
  Future<void> onLoad() async {
    final button1 = CapsuleButton(
        color: Colors.lightBlue,
        buttonSize: Vector2(200, 55),
        onTap: () {
          final router = findParent<RouterComponent>();
          router!.pushNamed('route1');
        },
        label: 'Route 1')
      ..position = Vector2(200, 200);

    final button2 = CapsuleButton(
        color: Colors.lightBlue,
        buttonSize: Vector2(200, 55),
        onTap: () {
          final router = findParent<RouterComponent>();
          router!.pushNamed('route2');
        },
        label: 'Route 2')
      ..position = Vector2(200, 300);

    add(button1);
    add(button2);
  }
}
