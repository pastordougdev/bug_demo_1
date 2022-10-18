part of 'demo_bloc.dart';

@immutable
class DemoState {
  final int circles;
  final int squares;

  const DemoState({
    required this.circles,
    required this.squares,
  });

  factory DemoState.initialState() {
    return const DemoState(circles: 0, squares: 0);
  }

  DemoState copyWith({
    int? circles,
    int? squares,
  }) {
    return DemoState(
      circles: circles ?? this.circles,
      squares: squares ?? this.squares,
    );
  }

  @override
  String toString() {
    return 'DemoState{circles: $circles, squares: $squares}';
  }
}
