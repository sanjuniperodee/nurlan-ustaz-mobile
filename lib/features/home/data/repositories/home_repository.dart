import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/common/constants.dart';
import 'package:nurlan_ustaz_flutter/core/error/excepteion.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/core/platform/network_info.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/datasource/remote/home_remote_ds.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';

const _tag = 'HomeRepository';

abstract class HomeRepository {
  Future<Either<Failure, List<ResultHomeDTO>>> news(
      {String? search, bool? isSaved, int? page});
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
  Future<Either<Failure, List<ResultHomeDTO>>> news(
      {String? search, bool? isSaved, int? page}) async {
    if (await networkInfo.isConnected) {
      try {
        final List<ResultHomeDTO> news = await remoteDS.news(
            search: search, isSaved: isSaved, currentPage: page);
        return Right(news);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }
}
