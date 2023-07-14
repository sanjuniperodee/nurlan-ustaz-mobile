import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/common/constants.dart';
import 'package:nurlan_ustaz_flutter/core/error/excepteion.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/core/model/freedom_payment_dto.dart';
import 'package:nurlan_ustaz_flutter/core/platform/network_info.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/data/datasource/remote/tus_zhoru_remote_ds.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/data/models/tus_zhoru_dto.dart';

abstract class TusZhoruRepository {
  Future<Either<Failure, List<ResultHomeDTO>>> tusZhoruBay(
      {String? search,
      bool? isSaved,
      int? page,
      bool? isPurchased,
      bool? isFirstCall});
  Future<Either<Failure, List<TusZhoruDTO>>> tusZhoru(
      {String? search,
      bool? isSaved,
      int? page,
      bool? isPurchased,
      bool? isFirstCall});
  Future<Either<Failure, List<TusZhoruDTO>>> customTusZhoru(
      {String? search, int? page, bool? isFirstCall});
  Future<Either<Failure, TusZhoruDTO>> createTusZhoru(
      {required String title, required String description});
  Future<Either<Failure, FreedomPaymentDTO>> createCustomTusZhoruPayment(
      {required int id, required String userIp, required String backUrl});
  Future<Either<Failure, FreedomPaymentDTO>> createTusZhoruPayment(
      {required int id, required String userIp, required String backUrl});
  Future<Either<Failure, bool>> tusZhoruFavorite({required int id});
  Future<Either<Failure, TusZhoruDTO>> getTusZhoruById({required int id});
  Future<Either<Failure, TusZhoruDTO>> getCustomTusZhoru({required int id});
}

@Singleton(as: TusZhoruRepository)
class TusZhoruRepositoryImpl extends TusZhoruRepository {
  final TusZhoruRemoteDs remoteDS;
  final NetworkInfo networkInfo;

  TusZhoruRepositoryImpl({
    required this.remoteDS,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<ResultHomeDTO>>> tusZhoruBay(
      {String? search,
      bool? isSaved,
      int? page,
      bool? isFirstCall,
      bool? isPurchased}) async {
    if (await networkInfo.isConnected) {
      try {
        final List<ResultHomeDTO> tusZhoruList = await remoteDS.tusZhoruBay(
            search: search,
            isSaved: isSaved,
            currentPage: page,
            isPurchased: isPurchased,
            isFirstCall: isFirstCall);
        return Right(tusZhoruList);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, List<TusZhoruDTO>>> tusZhoru(
      {String? search,
      bool? isSaved,
      int? page,
      bool? isFirstCall,
      bool? isPurchased}) async {
    if (await networkInfo.isConnected) {
      try {
        final List<TusZhoruDTO> tusZhoruList = await remoteDS.tusZhoru(
            search: search,
            isSaved: isSaved,
            currentPage: page,
            isPurchased: isPurchased,
            isFirstCall: isFirstCall);
        return Right(tusZhoruList);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, List<TusZhoruDTO>>> customTusZhoru(
      {String? search, int? page, bool? isFirstCall}) async {
    if (await networkInfo.isConnected) {
      try {
        final List<TusZhoruDTO> customTusZhoruList =
            await remoteDS.customTusZhoru(
                search: search, currentPage: page, isFirstCall: isFirstCall);
        return Right(customTusZhoruList);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, TusZhoruDTO>> createTusZhoru(
      {required String title, required String description}) async {
    if (await networkInfo.isConnected) {
      try {
        final TusZhoruDTO result = await remoteDS.createTusZhoru(
            title: title, description: description);

        return Right(result);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, FreedomPaymentDTO>> createCustomTusZhoruPayment(
      {required int id,
      required String userIp,
      required String backUrl}) async {
    if (await networkInfo.isConnected) {
      try {
        final FreedomPaymentDTO result =
            await remoteDS.createCustomTusZhoruPayment(
                id: id, userIp: userIp, backUrl: backUrl);

        return Right(result);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, FreedomPaymentDTO>> createTusZhoruPayment(
      {required int id,
      required String userIp,
      required String backUrl}) async {
    if (await networkInfo.isConnected) {
      try {
        final FreedomPaymentDTO result = await remoteDS.createTusZhoruPayment(
            id: id, userIp: userIp, backUrl: backUrl);

        return Right(result);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, bool>> tusZhoruFavorite({required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        final bool res = await remoteDS.tusZhoruFavorite(id: id);
        return Right(res);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, TusZhoruDTO>> getTusZhoruById(
      {required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        final TusZhoruDTO result = await remoteDS.getTusZhoruById(
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
  Future<Either<Failure, TusZhoruDTO>> getCustomTusZhoru(
      {required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        final TusZhoruDTO result = await remoteDS.getCustomTusZhoruById(
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
}
