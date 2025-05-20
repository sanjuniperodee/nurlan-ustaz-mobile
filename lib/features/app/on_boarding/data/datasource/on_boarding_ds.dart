import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/platform/platform_helper.dart';
import 'package:nurlan_ustaz_flutter/update_service/app_version_model.dart';

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

  @override
  Future<List<OnBoardingVideoDTO>> onBoardingVideo() async {
    final response = await dio.get(EndPoints.onBoarding);

    return (response.data as List)
        .map((e) => OnBoardingVideoDTO.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<AppVersionsModel> appVersionModel() async {
    final type = PlatformHelper.operatingSystem;

    final response = await dio.get('${EndPoints.appVersions}/$type/');
    return AppVersionsModel.fromJson(response.data as Map<String, dynamic>);
  }
}
