

import 'dart:developer';
import 'dart:io';


import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/platform/dio_wrapper.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/data/models/checklist_dto.dart';

import 'package:nurlan_ustaz_flutter/update_service/app_version_model.dart';
import 'package:package_info_plus/package_info_plus.dart';


import '../../../../../../../core/error/excepteion.dart';
import '../../../../../../../core/platform/network_helper.dart';
import '../models/on_boarding_video_dto.dart';

const _tag = 'AuthRemoteDS';

abstract class OnBoardingDs {
  Future<List<OnBoardingVideoDTO>> onBoardingVideo();
  Future<AppVersionsModel> appVersionModel();


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

  @override
  Future<AppVersionsModel> appVersionModel() async {
    try {
      final String type = Platform.operatingSystem;
      final response =
          await dio.get('${EndPoints.appVersions}/${type}/');
     return AppVersionsModel.fromJson(response as Map<String,dynamic>);
    } on DioError catch (e) {
      throw ServerException(
        message:
        (e.response?.data as Map<String, dynamic>)['message'].toString(),
      );
    }
  }
}
