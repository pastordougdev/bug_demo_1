import 'package:flame/game.dart';

import 'package:flutter/material.dart';
import 'imports.dart';

void main() {
  final game = BugDemoGame();
  runApp(GameWidget(game: game));
}
