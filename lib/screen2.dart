import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flutter/material.dart';

import 'imports.dart';

class Screen2 extends Entity with HasGameRef<BugDemoGame> {
  late final TextPaint textPaint;

  final style = const TextStyle(fontSize: 24.0, color: Colors.white70);

  Screen2() {
    textPaint = TextPaint(style: style);
  }

  @override
  Future<void> onLoad() async {
    final exitButton = CapsuleButton(
        color: Colors.amberAccent,
        buttonSize: Vector2(70, 55),
        onTap: () {
          gameRef.router.pop();
        },
        label: 'Exit')
      ..position = Vector2(20, 55);

    add(exitButton);
    add(CircleText()..position = Vector2(20, 200));
    add(SquareText()..position = Vector2(200, 200));
  }
}

class CircleText extends Entity with FlameBlocListenable<DemoBloc, DemoState> {
  int _count = 0;
  late final TextPaint textPaint;

  final style = const TextStyle(fontSize: 24.0, color: Colors.white70);

  CircleText() {
    textPaint = TextPaint(style: style);
  }

  @override
  void onMount() {
    super.onMount();
    _getState();
  }

  void _getState() async {
    await mounted;
    _count = bloc.state.circles;
  }

  @override
  void render(Canvas canvas) {
    textPaint.render(canvas, 'Circle Count: $_count', Vector2.zero());
  }
}

class SquareText extends Entity with FlameBlocListenable<DemoBloc, DemoState> {
  int _count = 0;
  late final TextPaint textPaint;

  final style = const TextStyle(fontSize: 24.0, color: Colors.white70);

  SquareText() {
    textPaint = TextPaint(style: style);
  }

  @override
  void onMount() {
    super.onMount();
    _getState();
  }

  void _getState() async {
    await mounted;
    _count = bloc.state.squares;
  }

  @override
  void render(Canvas canvas) {
    textPaint.render(canvas, 'Square Count: $_count', Vector2.zero());
  }
}
