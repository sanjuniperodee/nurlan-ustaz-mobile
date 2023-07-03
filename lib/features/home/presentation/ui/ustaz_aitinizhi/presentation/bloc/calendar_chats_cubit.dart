import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/ustaz_aitinizhi/data/models/chat_model.dart';

import '../../data/models/question_model.dart';

part 'calendar_chats_cubit.freezed.dart';

@singleton
class CalendarChatsCubit extends Cubit<CalendarChatsState> {
  CalendarChatsCubit(
    this._homeRepository,
  ) : super(const CalendarChatsState.initialState()) {
    var now = DateTime.now();
    //getChatsMonth(DateTime.now());



      // getChatByDate(
    //     DateFormat('yyyy-MM-dd')
    //         .format(DateTime.now().copyWith(day: 1))
    //         .toString(),
    //     DateFormat('yyyy-MM-dd').format(lastDayDateTime).toString());
  }

  final HomeRepository _homeRepository;
  late List<ChatDTO> chatsss;
  late DateTime selectedMonth;

  Future<void> chatPer(String dateTime) async {
    if (DateTime.parse(dateTime).day == 1) {
      getChatsMonth(DateTime.parse(dateTime));
    } else {
      getQuestionByDate(dateTime);
    }
  }

  Future<void> getChatsMonth(DateTime date) async {
    print('hello');
    var lastDayDateTime = (date.month < 12)
        ? DateTime(date.year, date.month + 1, 0)
        : DateTime(date.year + 1, 1, 0);
    final result = await _homeRepository.chats(
        startTime: DateFormat('yyyy-MM-dd').format(date.copyWith(day: 1)),
        endTime: DateFormat('yyyy-MM-dd').format(lastDayDateTime));
    return result.fold((l) => {}, (r) {
      chatsss = r.toList();
      emit(const _InitialState().copyWith(chats: r));
    });
  }

  Future<void> getChatByDay(String dateTime) async {
    if (chatsss.isEmpty) {
      emit(const _InitialState().copyWith(questions: null));
    } else {
      final nop = chatsss.map((e) => e.date!).toList();
      print(nop);
    }
  }

  Future<void> getQuestionByDate(String dateTime) async {
    if (!chatsss.map((e) => e.date).toList().contains(dateTime)) {
      emit(const _InitialState().copyWith(questions: null,chats: chatsss));
      return;
    } else {
      final dayChat =
          chatsss.toList().firstWhere((element) => element.date == dateTime);
      final result =
          await _homeRepository.questions(id: dayChat.id!, isFirstCall: true,page: 1);
      return result.fold(
          (l) => {
                emit(const _InitialState()
                    .copyWith(questions: null, chats: chatsss))
              }, (r) async {
        emit(_InitialState().copyWith(questions: r.toList(), chats: chatsss));
      });
    }

    // else {
    //   final dayChat =
    //   chatsss.toList().firstWhere((element) => element.date == dateTime);
    //   final result =
    //   await _homeRepository.questions(id: dayChat.id!, isFirstCall: true);
    //   return result.fold(
    //           (l) => {emit(const _InitialState().copyWith(questions: null))}, (r) {
    //     r.isEmpty ? emit(const _InitialState().copyWith(questions: null)) :
    //     emit(const _InitialState().copyWith(questions: r));
    //   });
    // }
  }

  Future<void> getChatByDate(String startTime, String endTime) async {
    final result =
        await _homeRepository.chats(startTime: startTime, endTime: endTime);
    return result.fold((l) {
      return;
    }, (r) async {
      if (r.isEmpty) {
        emit(const _InitialState(questions: null, chats: null));
      } else {
        getQuestionById(id: r.isEmpty ? null : r.first.id);
      }
    });
  }

  Future<void> getQuestionById({int? id}) async {
    if (id == null) {
      emit(const _InitialState(questions: null));
      return;
    }
    final questions =
        await _homeRepository.questions(id: id, isFirstCall: true,page: 1);
    return questions.fold((l) {
      emit(const _InitialState(questions: null));
    }, (r) {
      emit(CalendarChatsState.initialState(questions: r));
    });
  }
}

@freezed
class CalendarChatsState with _$CalendarChatsState {
  const factory CalendarChatsState.initialState({
    final List<ChatDTO>? chats,
    final List<QuestionDTO>? questions,
  }) = _InitialState;

  const factory CalendarChatsState.loadedState() = _LoadedState;

  const factory CalendarChatsState.loadingState() = _LoadingState;

  const factory CalendarChatsState.errorState({
    required String message,
  }) = _ErrorState;
}
