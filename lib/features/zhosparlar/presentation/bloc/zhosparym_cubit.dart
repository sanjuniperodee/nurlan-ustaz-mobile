import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/ustaz_aitinizhi/data/models/chat_model.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/data/models/checklist_dto.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/data/repository/zhosparym_repository.dart';

import '../../data/models/event_dto.dart';

part 'zhosparym_cubit.freezed.dart';

@singleton
class ZhosparymCubit extends Cubit<ZhosparymState> {
  ZhosparymCubit(
    this._repository,
  ) : super(const ZhosparymState.initial());

  final ZhosparymRepository _repository;
  late List<ChatDTO> chatsss;
  late DateTime selectedMonth;
  late CheckListDto? checklist;

  Future<CheckListDto?> getCheckList() async {
    final result = await _repository.getCheckLists();

    return result.fold(
      (error) {
        checklist = null;
        return null;
      },
      (list) {
        checklist = list.isNotEmpty ? list.first : null;
        return checklist;
      },
    );
  }

  Future<void> chatPer(String dateTime) async {
    if (DateTime.parse(dateTime).day == 1) {
      calendarEvents(DateTime.parse(dateTime));
    } else {}
  }

  Future<void> calendarEvents(DateTime date) async {
    log('daniel-${date.toString()}');

    var lastDayDateTime = (date.month < 12)
        ? DateTime(date.year, date.month + 1, 0)
        : DateTime(date.year + 1, 1, 0);
    final events = await _repository.calendarEvents(
        startTime: DateFormat('yyyy-MM-dd').format(date.copyWith(day: 1)),
        endTime: DateFormat('yyyy-MM-dd').format(lastDayDateTime));
    events.fold((l) => {}, (r) {
      emit(ZhosparymState.initial(
          events: r, checklist: checklist, isLoading: false));
    });
  }
}

@freezed
sealed class ZhosparymState with _$ZhosparymState {
  const factory ZhosparymState.initial(
      {Map<String, List<EventDto>>? events,
      final CheckListDto? checklist,
      @Default(false) bool isLoading}) = ZhosparymInitialState;
  const factory ZhosparymState.loaded() = ZhosparymLoadedState;
  const factory ZhosparymState.loading() = ZhosparymLoadingState;
  const factory ZhosparymState.error({
    required String message,
  }) = ZhosparymErrorState;
}
