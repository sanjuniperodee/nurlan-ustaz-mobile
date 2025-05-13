import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/platform/platform_helper.dart';

import 'package:nurlan_ustaz_flutter/update_service/app_version_model.dart';

import '../../../../../../../core/error/excepteion.dart';
import '../../../../../../../core/platform/network_helper.dart';
import '../models/on_boarding_video_dto.dart';

abstract class OnBoardingDs {
  const OnBoardingDs();

  Future<List<OnBoardingVideoDTO>> onBoardingVideo();
  Future<AppVersionsModel> appVersionModel();
}

@Injectable(as: OnBoardingDs)
class OnBoardingDsImpl extends OnBoardingDs {
  const OnBoardingDsImpl(this.dio);

  final Dio dio;

  // int? lpp;
  // List<CheckListDto> checkLists = [];

  @override
  Future<List<OnBoardingVideoDTO>> onBoardingVideo() async {
    try {
      final response = await dio.get(EndPoints.onBoarding);

      log(response.toString());
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => OnBoardingVideoDTO.fromJson(e as Map<String, dynamic>))
            .toList();
      }
      throw 'ERROR';
    } on DioException catch (e) {
      throw ServerException(
        message:
            (e.response?.data as Map<String, dynamic>)['message'].toString(),
      );
    }
  }

  @override
  Future<AppVersionsModel> appVersionModel() async {
    try {
      final type = PlatformHelper.operatingSystem;
      // if (Platform.isMacOS) type = 'ios';
      final response = await dio.get('${EndPoints.appVersions}/$type/');
      return AppVersionsModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ServerException(
        message:
            (e.response?.data as Map<String, dynamic>)['message'].toString(),
      );
    }
  }
}
