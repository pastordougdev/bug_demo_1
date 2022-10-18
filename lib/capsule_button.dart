import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import 'imports.dart';

class CapsuleButton extends Entity with HasPaint, Tappable {
  final String? label;
  final VoidCallback onTap;
  final Vector2 buttonSize;
  final Color color;

  late TextPaint labelPaint;
  late Vector2 labelPosition;
  late RRect buttonRRect;

  bool hasLabel = false;

  CapsuleButton({
    required this.color,
    required this.buttonSize,
    required this.onTap,
    this.label,
  }) : super(size: buttonSize) {
    final rect = Rect.fromLTWH(0.0, 0.0, buttonSize.x, buttonSize.y);
    final radius = buttonSize.y / 2.0;
    buttonRRect = RRect.fromRectAndRadius(rect, Radius.circular(radius));

    paint.color = color;
    paint.style = PaintingStyle.fill;

    if (label != null) {
      _buildLabel(label!);
      hasLabel = true;
    }
  }

  void _buildLabel(String labelText) {
    labelPaint = TextPaint(
      style: const TextStyle(fontSize: 32.0, color: Colors.black87),
    );

    var labelSize = labelPaint.measureText(labelText);
    //resize text if needed

    bool tryResize = !labelSize.fitsWithin(size);

    double fSize = 36.0;
    while (tryResize) {
      fSize -= 0.5;
      final wp = TextPaint(
        style: labelPaint.style.copyWith(fontSize: fSize),
      );
      labelPaint = wp;
      labelSize = labelPaint.measureText(labelText);

      if (labelSize.fitsWithin(size) || fSize <= 16.0) {
        tryResize = false;
      }
    }

    labelPosition =
        Vector2((size.x - labelSize.x) / 2.0, (size.y - labelSize.y) / 2.0);
  }

  @override
  bool onTapUp(TapUpInfo info) {
    onTap();
    return false;
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRRect(buttonRRect, paint);
    if (hasLabel) {
      labelPaint.render(canvas, label!, labelPosition);
    }
  }
}
