import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/excepteion.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';


import '../../../../../../../core/common/constants.dart';
import '../../../../../../../core/platform/network_info.dart';
import '../datasource/on_boarding_ds.dart';
import '../models/on_boarding_video_dto.dart';


abstract class OnBoardingRepository {
  Future<Either<Failure, List<OnBoardingVideoDTO>>> onBoardingVideo();


}

@Singleton(as: OnBoardingRepository)
class OnBoardingRepositoryImpl extends OnBoardingRepository {
  final OnBoardingDs remoteDS;
  final NetworkInfo networkInfo;

  OnBoardingRepositoryImpl({
    required this.networkInfo,
    required this.remoteDS,
  });

  @override
  Future<Either<Failure, List<OnBoardingVideoDTO>>> onBoardingVideo() async {
    if (await networkInfo.isConnected) {
      try {
        final List<OnBoardingVideoDTO> days =
            await remoteDS.onBoardingVideo();
        return Right(days);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }
  }



