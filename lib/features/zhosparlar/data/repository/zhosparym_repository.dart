import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/exception.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/data/models/checklist_dto.dart';

import '../datasources/zhosparym_remote_ds.dart';
import '../models/checklist_day_dto.dart';
import '../models/checklist_task_dto.dart';
import '../models/event_dto.dart';

abstract class ZhosparymRepository {
  Future<Either<Failure, Map<String, List<EventDto>>>> calendarEvents(
      {required String startTime, required String endTime});

  Future<Either<Failure, List<CheckListDto>>> getCheckLists(
      {String? search, bool? isSaved, int? page, bool? isFirstCall});

  Future<Either<Failure, List<CheckListDayDto>>> getDays(
      {required int checklistId});
  Future<Either<Failure, void>> autoFillDays({required int checklistId});

  Future<Either<Failure, void>> completeTask(
      {required CheckListDayDto checkListDayDto,
      required CheckListTaskDto checkListTaskDto,
      required bool isComplete});
  Future<Either<Failure, void>> deleteTask(
      {required int checkListDayId, required int checkListTaskId});
  Future<Either<Failure, void>> postTask(
      {required int checkListDayId, required String title});
  Future<Either<Failure, List<CheckListTaskDto>>> getTasksByDate(
      {required int checklistDayId});
}

@Singleton(as: ZhosparymRepository)
class ZhosparymRepositoryImpl extends ZhosparymRepository {
  final ZhosparymRemoteDs remoteDS;

  ZhosparymRepositoryImpl({
    required this.remoteDS,
  });

  @override
  Future<Either<Failure, Map<String, List<EventDto>>>> calendarEvents(
      {required String startTime, required String endTime}) async {
    try {
      final Map<String, List<EventDto>> events =
          await remoteDS.calendarEvents(startTime: startTime, endTime: endTime);
      return Right(events);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<CheckListDto>>> getCheckLists(
      {String? search, bool? isSaved, int? page, bool? isFirstCall}) async {
    try {
      final List<CheckListDto> tusZhoruList = await remoteDS.getCheckLists(
          search: search, currentPage: page, isFirstCall: isFirstCall);
      return Right(tusZhoruList);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<CheckListDayDto>>> getDays(
      {required int checklistId}) async {
    try {
      final List<CheckListDayDto> days =
          await remoteDS.getDays(checklistId: checklistId);
      return Right(days);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, void>> completeTask(
      {required CheckListDayDto checkListDayDto,
      required CheckListTaskDto checkListTaskDto,
      required bool isComplete}) async {
    try {
      await remoteDS.completeTask(
          checkListDayDto: checkListDayDto,
          checkListTaskDto: checkListTaskDto,
          isComplete: isComplete);
      return const Right('success');
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTask(
      {required int checkListDayId, required int checkListTaskId}) async {
    try {
      await remoteDS.deleteTask(
          checkListDayId: checkListDayId, checkListTaskId: checkListTaskId);
      return const Right('success');
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, void>> postTask(
      {required int checkListDayId, required String title}) async {
    try {
      await remoteDS.postTask(checkListDayId: checkListDayId, title: title);
      return const Right('success');
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, void>> autoFillDays({required int checklistId}) async {
    try {
      await remoteDS.autoFill(checklistId: checklistId);
      return const Right('success');
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<CheckListTaskDto>>> getTasksByDate(
      {required int checklistDayId}) async {
    try {
      final List<CheckListTaskDto> tasks =
          await remoteDS.getTasksByDate(checklistDayId: checklistDayId);
      return Right(tasks);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
