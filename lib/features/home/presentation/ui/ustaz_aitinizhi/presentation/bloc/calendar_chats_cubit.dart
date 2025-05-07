import 'dart:developer';

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
  ) : super(const CalendarChatsState.initial()) {
    getChatsMonth(DateTime.now())
      ..then((value) {
        getQuestionByDate(DateFormat('yyyy-MM-dd').format(DateTime.now()));
      });

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
    var lastDayDateTime = (date.month < 12)
        ? DateTime(date.year, date.month + 1, 0)
        : DateTime(date.year + 1, 1, 0);
    final result = await _homeRepository.chats(
        startTime: DateFormat('yyyy-MM-dd').format(date.copyWith(day: 1)),
        endTime: DateFormat('yyyy-MM-dd').format(lastDayDateTime));
    return result.fold((l) => {}, (r) {
      chatsss = r.toList();
      emit(CalendarChatsState.initial(chats: r));
    });
  }

  Future<void> getQuestionByDate(String dateTime) async {
    if (!chatsss.map((e) => e.date).toList().contains(dateTime)) {
      emit(CalendarChatsState.initial(questions: null, chats: chatsss));
      return;
    } else {
      emit(CalendarChatsState.initial(
          questions: null, chats: chatsss, isLoading: true));

      final dayChat =
          chatsss.toList().firstWhere((element) => element.date == dateTime);
      final result = await _homeRepository.questions(
          id: dayChat.id!, isFirstCall: false, page: 1);
      return result.fold(
          (l) => emit(CalendarChatsState.initial(
              questions: null, chats: chatsss, isLoading: false)), (r) async {
        log(r.toString());
        emit(CalendarChatsState.initial(
            questions: r.toList(), chats: chatsss, isLoading: false));
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

  Future<void> getQuestionById({int? id}) async {
    if (id == null) {
      emit(const CalendarChatsState.initial(questions: null));
      return;
    }
    final questions =
        await _homeRepository.questions(id: id, isFirstCall: true, page: 1);
    return questions.fold((l) {
      emit(const CalendarChatsState.initial(questions: null));
    }, (r) {
      emit(CalendarChatsState.initial(questions: r));
    });
  }
}

@freezed
sealed class CalendarChatsState with _$CalendarChatsState {
  const factory CalendarChatsState.initial({
    final List<ChatDTO>? chats,
    final List<QuestionDTO>? questions,
    @Default(false) bool isLoading,
  }) = CalendarChatsInitialState;

  const factory CalendarChatsState.loaded() = CalendarChatsLoadedState;

  const factory CalendarChatsState.loading() = CalendarChatsLoadingState;

  const factory CalendarChatsState.error({
    required String message,
  }) = CalendarChatsErrorState;
}
