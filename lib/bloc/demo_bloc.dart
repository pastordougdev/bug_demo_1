import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'demo_event.dart';
part 'demo_state.dart';

class DemoBloc extends Bloc<DemoEvent, DemoState> {
  DemoBloc() : super(DemoState.initialState()) {
    on<IncrementCircleEvent>((event, emit) {
      emit(state.copyWith(circles: state.circles + 1));
    });

    on<IncrementSquareEvent>((event, emit) {
      emit(state.copyWith(squares: state.squares + 1));
    });

    on<DecrementCircleEvent>((event, emit) {
      emit(state.copyWith(circles: max(state.circles - 1, 0)));
    });

    on<DecrementSquareEvent>((event, emit) {
      emit(state.copyWith(squares: max(state.squares - 1, 0)));
    });
  }
}
