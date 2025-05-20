import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/exception.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';

import 'package:nurlan_ustaz_flutter/update_service/app_version_model.dart';

import '../datasource/on_boarding_ds.dart';
import '../models/on_boarding_video_dto.dart';

abstract class OnBoardingRepository {
  Future<Either<Failure, List<OnBoardingVideoDTO>>> onBoardingVideo();
  Future<AppVersionsModel?> appVersionsModel();
}

@Singleton(as: OnBoardingRepository)
class OnBoardingRepositoryImpl extends OnBoardingRepository {
  final OnBoardingDs remoteDS;

  OnBoardingRepositoryImpl({
    required this.remoteDS,
  });

  @override
  Future<Either<Failure, List<OnBoardingVideoDTO>>> onBoardingVideo() async {
    try {
      final List<OnBoardingVideoDTO> days = await remoteDS.onBoardingVideo();
      return Right(days);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<AppVersionsModel?> appVersionsModel() async {
    try {
      final AppVersionsModel model = await remoteDS.appVersionModel();
      log('result from repo - ${model.toString()}');
      return model;
    } on ServerException {
      return null;
    }
  }
}
