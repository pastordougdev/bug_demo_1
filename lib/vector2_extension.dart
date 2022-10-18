import 'package:flame/components.dart';

extension Vector2Extension on Vector2 {
  bool get isZeroVector => x == 0.0 && y == 0.0;
  bool get isNotZeroVector => x != 0.0 || y != 0.0;
  bool get isValidSizeVector => x > 0.0 && y > 0.0;

  bool fitsWithin(Vector2 other) {
    if (!isValidSizeVector || !other.isValidSizeVector) return false;

    return x < other.x && y < other.y;
  }
}
