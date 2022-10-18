part of 'demo_bloc.dart';

@immutable
abstract class DemoEvent {}

class IncrementCircleEvent extends DemoEvent {}
class DecrementCircleEvent extends DemoEvent {}
class IncrementSquareEvent extends DemoEvent {}
class DecrementSquareEvent extends DemoEvent {}
