import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/platform/dio_wrapper.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/data/models/checklist_day_dto.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/data/models/checklist_dto.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/data/models/checklist_task_dto.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/data/models/event_dto.dart';

import '../../../../../core/error/excepteion.dart';
import '../../../../../core/platform/network_helper.dart';

const _tag = 'AuthRemoteDS';

abstract class ZhosparymRemoteDs {
  Future<Map<String, List<EventDto>>> calendarEvents(
      {required String startTime, required String endTime});

  Future<List<CheckListDto>> getCheckLists(
      {String? search, int? currentPage, bool? isFirstCall = false});

  Future<List<CheckListDayDto>> getDays({required int checklistId});

  Future<void> completeTask(
      {required CheckListDayDto checkListDayDto,
      required CheckListTaskDto checkListTaskDto,
      required bool isComplete});

  Future<void> deleteTask(
      {required int checkListDayId, required int checkListTaskId});

  Future<void> postTask({required int checkListDayId, required String title});

  Future<void> autoFill({required int checklistId});
  Future<List<CheckListTaskDto>> getTasksByDate({required int checklistDayId});

}

@Injectable(as: ZhosparymRemoteDs)
class ZhosparymRemoteDsImpl extends ZhosparymRemoteDs {
  late final Dio dio;
  final DioWrapper dioWrapper;

  ZhosparymRemoteDsImpl(this.dioWrapper) {
    dioWrapper.path('');
    dio = dioWrapper.dio;
  }

  int? lpp;
  List<CheckListDto> checkLists = [];

  @override
  Future<Map<String, List<EventDto>>> calendarEvents(
      {required String startTime, required String endTime}) async {
    try {
      final response = await dio.get(
        '${EndPoints.events}/?start_date=$startTime&end_date=$endTime',
      );
      if (response.statusCode == 200) {
        final events =
            (response.data as Map<String, dynamic>).map<String, List<EventDto>>(
          (key, value) => MapEntry(
            key,
            value.map<EventDto>((e) => EventDto.fromJson(e)).toList(),
          ),
        );

        return events;
      }
      throw 'ERROR';
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<List<CheckListDto>> getCheckLists(
      {String? search, int? currentPage, bool? isFirstCall = false}) async {
    try {
      final response = await dio.get(
        EndPoints.checklist,
        queryParameters: {
          'page[number]': 1,
          'page[size]': 10,
          if (search != null) 'search': search,
        },
      );
      if (response.statusCode == 200) {
        lpp = response.data['meta']['pagination']['pages'];

        checkLists.addAll(
            ((response.data as Map<String, dynamic>)['results'] as List)
                .map((e) => CheckListDto.fromJson(e as Map<String, dynamic>))
                .toList());
        return checkLists;
      }
      // log('PAGE${response.data['meta']['pagination']['page']}');
      throw 'ERROR';
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response?.data as Map<String, dynamic>)['message'].toString(),
      );
    }
  }

  @override
  Future<List<CheckListDayDto>> getDays({required int checklistId}) async {
    try {
      final response =
          await dio.get('${EndPoints.checklist}/$checklistId/days/', data: {
        'checklist_id': checklistId.toString(),
      });
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => CheckListDayDto.fromJson(e as Map<String, dynamic>))
            .toList();
      }
      throw 'ERROR';
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response?.data as Map<String, dynamic>)['message'].toString(),
      );
    }
  }

  @override
  Future<void> completeTask(
      {required CheckListDayDto checkListDayDto,
      required CheckListTaskDto checkListTaskDto,
      required bool isComplete}) async {
    try {
      final FormData formdat = FormData.fromMap({
        "checklist_day": checkListDayDto.id,
        "title": checkListTaskDto.title.toString(),
        "is_completed": isComplete,
      });
      final response = await dio.put(
          '${EndPoints.checklistDays}/${checkListDayDto.id}/tasks/${checkListTaskDto.id}/',
          data: formdat);
      if (response.statusCode == 200) {
        return;
      }
      throw 'ERROR';
    } on DioError catch (e) {
      throw ServerException(
        message: (e.response?.data).toString(),
      );
    }
  }

  @override
  Future<void> deleteTask(
      {required int checkListDayId, required int checkListTaskId}) async {
    try {
      final response = await dio.delete(
          '${EndPoints.checklistDays}/$checkListDayId/tasks/$checkListTaskId/',
          data: {
            'checklist_day_id': checkListDayId.toString(),
            'id': checkListTaskId.toString(),
          });
      if (response.statusCode == 204) {
        return;
      }
      throw 'ERROR';
    } on DioError catch (e) {
      throw ServerException(
        message: (e.response?.data).toString(),
      );
    }
  }

  @override
  Future<void> postTask(
      {required int checkListDayId, required String title}) async {
    try {
      final response = await dio
          .post('${EndPoints.checklistDays}/$checkListDayId/tasks/', data: {
        "checklist_day": checkListDayId,
        'title': title.toString(),
        'is_completed': false,
      });
      if (response.statusCode == 201) {
        return;
      }
      throw 'ERROR';
    } on DioError catch (e) {
      throw ServerException(
        message: (e.response?.data).toString(),
      );
    }
  }

  @override
  Future<void> autoFill({required int checklistId}) async {
    try {
      final response =
          await dio.post('${EndPoints.checklist}/$checklistId/days/fill-days/', data: {
      });
      if (response.statusCode == 201) {
        return ;
      }
      throw 'ERROR';
    } on DioError catch (e) {
      throw ServerException(
        message:
        (e.response?.data as Map<String, dynamic>)['message'].toString(),
      );
    }
  }

  @override
  Future<List<CheckListTaskDto>> getTasksByDate({required int checklistDayId}) async {
    try {
      final response =
          await dio.get('${EndPoints.checklistDays}/$checklistDayId/tasks/');
      if (response.statusCode == 200) {
        log(response.data.toString());
        return (response.data as List)
            .map((e) => CheckListTaskDto.fromJson(e as Map <String, dynamic>))
            .toList();
      }
      throw 'ERROR';
    } on DioError catch (e) {
      throw ServerException(
        message:
        (e.response?.data as Map<String, dynamic>)['message'].toString(),
      );
    }
  }
}
