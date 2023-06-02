import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/common/constants.dart';
import 'package:nurlan_ustaz_flutter/core/error/excepteion.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/core/platform/network_info.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/datasource/remote/Islam_teaching_remote_ds.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/ayat_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/names_of_Allah_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/pillars_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/result_dto.dart';

const _tag = 'AuthRepository';

abstract class IslamTeachingRepository {
  Future<Either<Failure, AyatDTO>> ayatOfDay();
  Future<Either<Failure, bool>> surahFavorite({required int id});
  Future<Either<Failure, bool>> duasFavorite({required int id});
  Future<Either<Failure, bool>> dhikrsFavorite({required int id});
  Future<Either<Failure, bool>> islamNamesFavorite({required int id});
  Future<Either<Failure, List<PillarsDTO>>> pillars();
  Future<Either<Failure, List<PillarsDTO>>> fatwas();
  Future<Either<Failure, List<ResultDTO>>> sura(
      {String? search, bool? isSaved});
  Future<Either<Failure, List<ResultDTO>>> dhikrs(
      {String? search, bool? isSaved});
  Future<Either<Failure, List<ResultDTO>>> duha(
      {String? search, bool? isSaved});
  Future<Either<Failure, List<ResultDTO>>> islamNames(
      {String? search, bool? isSaved, String? gender});
  Future<Either<Failure, List<NamesOfAllahDTO>>> namesOfAllah(
      {String? search, bool? isSaved});
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
  Future<Either<Failure, bool>> surahFavorite({required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        final bool res = await remoteDS.surahFavorite(id: id);
        return Right(res);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, bool>> duasFavorite({required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        final bool res = await remoteDS.duasFavorite(id: id);
        return Right(res);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, bool>> dhikrsFavorite({required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        final bool res = await remoteDS.dhikrsFavorite(id: id);
        return Right(res);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, bool>> islamNamesFavorite({required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        final bool res = await remoteDS.islamNamesFavorite(id: id);
        return Right(res);
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

  @override
  Future<Either<Failure, List<ResultDTO>>> sura(
      {String? search, bool? isSaved}) async {
    if (await networkInfo.isConnected) {
      try {
        final List<ResultDTO> sura =
            await remoteDS.sura(search: search, isSaved: isSaved);
        return Right(sura);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, List<ResultDTO>>> islamNames(
      {String? search, bool? isSaved, String? gender}) async {
    if (await networkInfo.isConnected) {
      try {
        final List<ResultDTO> names = await remoteDS.islamNames(
            search: search, isSaved: isSaved, gender: gender);
        return Right(names);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, List<ResultDTO>>> dhikrs(
      {String? search, bool? isSaved}) async {
    if (await networkInfo.isConnected) {
      try {
        final List<ResultDTO> dhikrs =
            await remoteDS.dhikrs(search: search, isSaved: isSaved);
        return Right(dhikrs);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, List<ResultDTO>>> duha(
      {String? search, bool? isSaved}) async {
    if (await networkInfo.isConnected) {
      try {
        final List<ResultDTO> duha =
            await remoteDS.duas(search: search, isSaved: isSaved);
        return Right(duha);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, List<PillarsDTO>>> fatwas() async {
    if (await networkInfo.isConnected) {
      try {
        final List<PillarsDTO> fatwas = await remoteDS.fatwas();
        return Right(fatwas);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, List<NamesOfAllahDTO>>> namesOfAllah(
      {String? search, bool? isSaved}) async {
    if (await networkInfo.isConnected) {
      try {
        final List<NamesOfAllahDTO> names =
            await remoteDS.namesOfAllah(search: search, isSaved: isSaved);
        return Right(names);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }
}
