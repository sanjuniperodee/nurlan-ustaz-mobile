import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/common/constants.dart';
import 'package:nurlan_ustaz_flutter/core/error/excepteion.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/core/platform/network_info.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/datasource/remote/Islam_teaching_remote_ds.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/ayat_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/pillars_dto.dart';

const _tag = 'AuthRepository';

abstract class IslamTeachingRepository {
  Future<Either<Failure, AyatDTO>> ayatOfDay();
  Future<Either<Failure, List<PillarsDTO>>> pillars();
}

@Singleton(as: IslamTeachingRepository)
class IslamTeachingRepositoryImpl extends IslamTeachingRepository {
  final IslamTeachingRemoteDs remoteDS;
  final NetworkInfo networkInfo;
  IslamTeachingRepositoryImpl({
    required this.remoteDS,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, AyatDTO>> ayatOfDay() async {
    if (await networkInfo.isConnected) {
      try {
        final AyatDTO profile = await remoteDS.ayatOfDay();
        return Right(profile);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, List<PillarsDTO>>> pillars() async {
    if (await networkInfo.isConnected) {
      try {
        final List<PillarsDTO> pillars = await remoteDS.pillars();
        return Right(pillars);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }
}
