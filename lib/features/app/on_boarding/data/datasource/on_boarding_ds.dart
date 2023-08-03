import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/platform/dio_wrapper.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/data/models/checklist_day_dto.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/data/models/checklist_dto.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/data/models/checklist_task_dto.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/data/models/event_dto.dart';

import '../../../../../../../core/error/excepteion.dart';
import '../../../../../../../core/platform/network_helper.dart';
import '../models/on_boarding_video_dto.dart';

const _tag = 'AuthRemoteDS';

abstract class OnBoardingDs {
  Future<List<OnBoardingVideoDTO>> onBoardingVideo();

}

@Injectable(as: OnBoardingDs)
class OnBoardingDsImpl extends OnBoardingDs {

  late final Dio dio;
  final DioWrapper dioWrapper;

  OnBoardingDsImpl(this.dioWrapper) {
    dioWrapper.path('');
    dio = dioWrapper.dio;
  }

  int? lpp;
  List<CheckListDto> checkLists = [];

  @override
  Future<List<OnBoardingVideoDTO>> onBoardingVideo() async {
    try {
      final response =
          await dio.get(EndPoints.onBoarding);
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => OnBoardingVideoDTO.fromJson(e as Map<String, dynamic>))
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
