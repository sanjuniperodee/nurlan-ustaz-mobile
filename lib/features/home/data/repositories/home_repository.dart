import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/common/constants.dart';
import 'package:nurlan_ustaz_flutter/core/error/excepteion.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/core/platform/network_info.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/datasource/remote/home_remote_ds.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/media_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';

const _tag = 'HomeRepository';

abstract class HomeRepository {
  Future<Either<Failure, List<ResultHomeDTO>>> news({
    String? search,
    bool? isSaved,
    int? page,
    bool? isFirstCall,
  });
  Future<Either<Failure, bool>> postImamService({
    required List<int> id,
  });
  Future<Either<Failure, List<ResultHomeDTO>>> partners();
  Future<Either<Failure, List<ResultHomeDTO>>> seminar(
      {String? search, bool? isSaved, int? page, bool? isFirstCall});
  Future<Either<Failure, List<ResultHomeDTO>>> lives({
    String? search,
    bool? isSaved,
    int? page,
    bool? isFirstCall,
  });
  Future<Either<Failure, List<ResultHomeDTO>>> charities({
    int? page,
    bool? isFirstCall,
  });
  Future<Either<Failure, List<MediaDTO>>> services({
    int? page,
    bool? isFirstCall,
  });
}

@Singleton(as: HomeRepository)
class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDs remoteDS;
  final NetworkInfo networkInfo;
  HomeRepositoryImpl({
    required this.remoteDS,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, bool>> postImamService({
    required List<int> id,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final bool result = await remoteDS.postImamService(
          id: id,
        );
        return Right(result);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, List<ResultHomeDTO>>> lives({
    String? search,
    bool? isSaved,
    int? page,
    bool? isFirstCall,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final List<ResultHomeDTO> lives = await remoteDS.lives(
            search: search,
            isSaved: isSaved,
            currentPage: page,
            isFirstCall: isFirstCall);
        return Right(lives);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, List<ResultHomeDTO>>> partners() async {
    if (await networkInfo.isConnected) {
      try {
        final List<ResultHomeDTO> partners = await remoteDS.partners();
        return Right(partners);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, List<ResultHomeDTO>>> news({
    String? search,
    bool? isSaved,
    int? page,
    bool? isFirstCall,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final List<ResultHomeDTO> news = await remoteDS.news(
            search: search,
            isSaved: isSaved,
            currentPage: page,
            isFirstCall: isFirstCall);
        return Right(news);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, List<ResultHomeDTO>>> charities({
    int? page,
    bool? isFirstCall,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final List<ResultHomeDTO> charities = await remoteDS.charities(
            currentPage: page, isFirstCall: isFirstCall);
        return Right(charities);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, List<MediaDTO>>> services({
    int? page,
    bool? isFirstCall,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final List<MediaDTO> services = await remoteDS.services(
            currentPage: page, isFirstCall: isFirstCall);
        return Right(services);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, List<ResultHomeDTO>>> seminar({
    String? search,
    bool? isSaved,
    int? page,
    bool? isFirstCall,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final List<ResultHomeDTO> seminar = await remoteDS.seminar(
            search: search,
            isSaved: isSaved,
            currentPage: page,
            isFirstCall: isFirstCall);
        return Right(seminar);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }
}
