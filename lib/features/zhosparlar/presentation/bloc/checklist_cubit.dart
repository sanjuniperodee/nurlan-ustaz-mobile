import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/data/models/checklist_task_dto.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/data/repository/zhosparym_repository.dart';

import '../../data/models/checklist_day_dto.dart';

part 'checklist_cubit.freezed.dart';

@singleton
class CheckListCubit extends Cubit<CheckListState> {
  CheckListCubit(
    this._repository,
  ) : super(const CheckListState.initialState()) {
    selectedDate = DateTime.now();
  }

  final ZhosparymRepository _repository;
  late List<CheckListDayDto> days;
  late DateTime selectedDate;
  late List<CheckListTaskDto> tasks;
  late int checklistID;

  Future<void> autoFillDays({required int checklistId}) async {}

  Future<List<CheckListDayDto>> getDays({required int checklistId}) async {
    checklistID = checklistId;
    final result = await _repository.getDays(checklistId: checklistId);

    result.fold((l) => {
      log('salamaleikum')
    }, (r) async {
      log('${r.toString()}---ooo');
      days = r.toList();
      if (days.isEmpty ) {
        await _repository.autoFillDays(checklistId: checklistId);
        final result = await _repository.getDays(checklistId: checklistId);
        result.fold(
            (l) => {},
            (r) {




              days = r.toList();
                  emit(_InitialState(
                      days: days, selectedDate: selectedDate));
                });
      } else {
        emit(_InitialState(days: r.toList(), selectedDate: selectedDate,));
      }
    });
    return days;
  }

  Future<void> postTask(CheckListDayDto checkListDayDto, String title) async {
    final result = await _repository.postTask(
        checkListDayId: checkListDayDto.id, title: title);
    result.fold((l) => {}, (r) => {getDays(checklistId: checklistID)});
  }

  Future<void> completeTask(CheckListDayDto checkListDayDto,
      CheckListTaskDto checkListTaskDto, bool value) async {
    final result = await _repository.completeTask(
        checkListDayDto: checkListDayDto,
        checkListTaskDto: checkListTaskDto,
        isComplete: value);
    result.fold((l) => {}, (r) => {getDays(checklistId: checklistID)});
  }

  Future<void> deleteTask(CheckListDayDto checkListDayDto,
      CheckListTaskDto checkListTaskDto) async {
    emit(_InitialState().copyWith(selectedDate: selectedDate, days: days,tasks: [],isLoading: true));

    await _repository.deleteTask(
        checkListDayId: checkListDayDto.id,
        checkListTaskId: checkListTaskDto.id);
    getDays(checklistId: checklistID);
  }

  Future<void> changeDate({required DateTime date}) async {
    emit(_InitialState().copyWith(selectedDate: date, days: days,tasks: [],isLoading: true));

    final day = days.firstWhere((element) => DateTime.parse(element.date).day == date.day);
    final result = await _repository.getTasksByDate(checklistDayId: day.id);
    result.fold((l) => {}, (r) {
      tasks = r.toList();
      log(tasks.toList().toString());
      selectedDate = date;
      emit(_InitialState().copyWith(selectedDate: date, days: days,tasks: tasks,isLoading: false));
    });
  }
}

@freezed
class CheckListState with _$CheckListState {
  const factory CheckListState.initialState(
      {@Default([]) final List<CheckListDayDto> days,
      final DateTime? selectedDate,final List<CheckListTaskDto>? tasks,@Default(false) bool isLoading}) = _InitialState;

  const factory CheckListState.loadedState() = _LoadedState;

  const factory CheckListState.loadingState() = _LoadingState;

  const factory CheckListState.errorState({
    required String message,
  }) = _ErrorState;
}
