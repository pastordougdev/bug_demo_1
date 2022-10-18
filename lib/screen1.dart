import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flutter/material.dart';

import 'imports.dart';

class Screen1 extends Entity
    with HasGameRef<BugDemoGame>, FlameBlocListenable<DemoBloc, DemoState> {
  int _squares = 0;
  int _circles = 0;

  final purplePaint = Paint()
    ..color = Colors.deepPurpleAccent
    ..style = PaintingStyle.fill;
  final orangePaint = Paint()
    ..color = Colors.deepOrange
    ..style = PaintingStyle.fill;
  final bluePaint = Paint()
    ..color = Colors.blueAccent
    ..style = PaintingStyle.fill;
  final tealPaint = Paint()
    ..color = Colors.teal
    ..style = PaintingStyle.fill;

  late final List<Paint> paints;

  Screen1() {
    paints = [purplePaint, orangePaint, bluePaint, tealPaint];
  }

  @override
  Future<void> onLoad() async {
    final button1 = CapsuleButton(
        color: Colors.lightGreen,
        buttonSize: Vector2(150, 55),
        onTap: () {
          bloc.add(IncrementSquareEvent());
        },
        label: 'Add Square')
      ..position = Vector2(120, 20);

    final button2 = CapsuleButton(
        color: Colors.lightGreen,
        buttonSize: Vector2(150, 55),
        onTap: () {
          bloc.add(IncrementCircleEvent());
        },
        label: 'Add Circle')
      ..position = Vector2(300, 20);

    final button3 = CapsuleButton(
        color: Colors.pinkAccent,
        buttonSize: Vector2(150, 55),
        onTap: () {
          bloc.add(DecrementSquareEvent());
        },
        label: 'Remove Square')
      ..position = Vector2(120, 85);

    final button4 = CapsuleButton(
        color: Colors.pinkAccent,
        buttonSize: Vector2(150, 55),
        onTap: () {
          bloc.add(DecrementCircleEvent());
        },
        label: 'Remove Circle')
      ..position = Vector2(300, 85);

    final exitButton = CapsuleButton(
        color: Colors.amberAccent,
        buttonSize: Vector2(70, 55),
        onTap: () {
          gameRef.router.pop();
        },
        label: 'Exit')
      ..position = Vector2(20, 55);

    add(button1);
    add(button2);
    add(button3);
    add(button4);
    add(exitButton);
  }

  @override
  onNewState(DemoState state) {
    _circles = state.circles;
    _squares = state.squares;
  }

  @override
  void render(Canvas canvas) {
    var circlePosition = Vector2(20, 300);
    for (int c = 0; c < _circles; ++c) {
      final idx = c % paints.length;
      canvas.drawCircle(circlePosition.toOffset(), 20.0, paints[idx]);
      circlePosition.x += 40.0;
      if (circlePosition.x > gameRef.size.x / 2) {
        circlePosition.x = 20;
        circlePosition.y += 40.0;
      }
    }

    var squarePosition = Vector2(gameRef.size.x / 2, 280);
    for (int s = 0; s < _squares; ++s) {
      final idx = (s + 1) % paints.length;
      final rect = Rect.fromLTWH(squarePosition.x, squarePosition.y, 40, 40);
      canvas.drawRect(rect, paints[idx]);
      squarePosition.x += 40;
      if (squarePosition.x > gameRef.size.x) {
        squarePosition.x = gameRef.size.x / 2;
        squarePosition.y += 40.0;
      }
    }
  }
}
