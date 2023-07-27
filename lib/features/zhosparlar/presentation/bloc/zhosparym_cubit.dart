import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/ustaz_aitinizhi/data/models/chat_model.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/data/models/checklist_dto.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/data/repository/zhosparym_repository.dart';

import '../../data/models/event_dto.dart';

part 'zhosparym_cubit.freezed.dart';

@singleton
class ZhosparymCubit extends Cubit<ZhosparymState> {
  ZhosparymCubit(
    this._repository,
  ) : super(const ZhosparymState.initialState());

  final ZhosparymRepository _repository;
  late List<ChatDTO> chatsss;
  late DateTime selectedMonth;


  Future<CheckListDto?> getCheckList() async {
    final result = await _repository.getCheckLists();
    return result.fold((l) {
      return null;
    }, (r) {
      return r.first;
    });
  }

  Future<void> chatPer(String dateTime) async {
    if (DateTime.parse(dateTime).day == 1) {
      calendarEvents(DateTime.parse(dateTime));
    } else {}
  }

  Future<void> calendarEvents(DateTime date) async {
    var lastDayDateTime = (date.month < 12)
        ? DateTime(date.year, date.month + 1, 0)
        : DateTime(date.year + 1, 1, 0);
    final events = await _repository.calendarEvents(
        startTime: DateFormat('yyyy-MM-dd').format(date.copyWith(day: 1)),
        endTime: DateFormat('yyyy-MM-dd').format(lastDayDateTime));
    events.fold((l) => {}, (r) {
      log('----------------------${r.toString()}');
      emit(_InitialState().copyWith(events: r));
    });
  }
}

@freezed
class ZhosparymState with _$ZhosparymState {
  const factory ZhosparymState.initialState(
      {Map<String, List<EventDto>>? events}) = _InitialState;

  const factory ZhosparymState.loadedState() = _LoadedState;

  const factory ZhosparymState.loadingState() = _LoadingState;

  const factory ZhosparymState.errorState({
    required String message,
  }) = _ErrorState;
}
