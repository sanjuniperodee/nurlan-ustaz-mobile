import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/* Local dependencies */

class TimerCubit extends Cubit<TimerState> {
  Timer? timer;

  TimerCubit() : super(TimerInitial());

  void startTimer(int count) async {
    emit(TimerInitial());
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (time) {
        if (count == 0) {
          timer!.cancel();
          time.cancel();

          emit(TimerEnd());
        } else {
          count--;

          emit(TimerRunning(count));
        }
      },
    );
    if (state is TimerEnd) {
      timer!.cancel();
    }
  }

  void restartTimer(int count, bool isStart) {
    count = count * 2;
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (time) {
        if (isStart == false) {
          if (count == 0) {
            timer!.cancel();
            time.cancel();

            isStart = true;

            emit(TimerEnd());
          } else {
            count--;

            emit(TimerRunning(count));
          }
        }
      },
    );
  }
}

abstract class TimerState extends Equatable {
  @override
  List<Object> get props => [];
}

class TimerInitial extends TimerState {}

class TimerRunning extends TimerState {
  final int duration;

  TimerRunning(this.duration);

  @override
  List<Object> get props => [duration];
}

class TimerEnd extends TimerState {}
