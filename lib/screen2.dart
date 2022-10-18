import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flutter/material.dart';

import 'imports.dart';

class Screen2 extends Entity
    with HasGameRef<BugDemoGame>, FlameBlocListenable<DemoBloc, DemoState> {
  int _squares = 0;
  int _circles = 0;
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
  }

  @override
  void onMount() {
    super.onMount();
    _getState();
  }

  void _getState() async {
    await mounted;
    final state = bloc.state;
    _squares = state.squares;
    _circles = state.circles;
  }

  @override
  void render(Canvas canvas) {
    final cText = 'Circle Count: $_circles';
    final sText = 'Square Count: $_squares';

    textPaint.render(canvas, cText, Vector2(20, 200));
    textPaint.render(canvas, sText, Vector2(200, 200));
  }
}

class SomeText extends Entity {
  final String text;
  late final TextPaint textPaint;

  final style = const TextStyle(fontSize: 24.0, color: Colors.white70);

  SomeText(this.text) {
    textPaint = TextPaint(style: style);
  }

  @override
  void render(Canvas canvas) {
    textPaint.render(canvas, text, Vector2.zero());
  }
}
