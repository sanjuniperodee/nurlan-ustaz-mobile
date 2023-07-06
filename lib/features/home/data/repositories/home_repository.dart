import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/common/constants.dart';
import 'package:nurlan_ustaz_flutter/core/error/excepteion.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/core/model/freedom_payment_dto.dart';
import 'package:nurlan_ustaz_flutter/core/platform/network_info.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/datasource/local/home_local_ds.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/datasource/remote/home_remote_ds.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/faq_model_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/geonames_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/media_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/notification_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';

import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/ustaz_aitinizhi/data/models/chat_model.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/ustaz_aitinizhi/data/models/question_model.dart';

import 'package:nurlan_ustaz_flutter/features/home/data/models/timings_dto.dart';

import '../../../../core/services/notification_service.dart';
import '../models/notification_device_dto.dart';

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

  Future<Either<Failure, List<ResultHomeDTO>>> seminar({
    String? search,
    bool? isSaved,
    int? page,
    bool? isFirstCall,
    bool? isPurchased,
  });

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

  Future<Either<Failure, List<ResultHomeDTO>>> commentSem(
      {int? page, bool? isFirstCall, int? id});

  Future<Either<Failure, List<ResultHomeDTO>>> commentNews(
      {int? page, bool? isFirstCall, int? id});

  Future<Either<Failure, List<MediaDTO>>> services({
    int? page,
    bool? isFirstCall,
  });

  Future<Either<Failure, bool>> seminarFavorite({required int id});

  Future<Either<Failure, bool>> seminarLike({required int id});

  Future<Either<Failure, bool>> commentSemPost({
    required int id,
    int? commentId,
    required String body,
  });

  Future<Either<Failure, bool>> commentNewsPost({
    required int id,
    int? commentId,
    required String body,
  });

  Future<Either<Failure, bool>> commentSemLike({
    required int id,
    required int commentId,
  });

  Future<Either<Failure, bool>> commentNewsLike({
    required int id,
    required int commentId,
  });

  Future<Either<Failure, ResultHomeDTO>> newsDetail({required int id});

  Future<Either<Failure, List<FaqModelDTO>>> faq();

  Future<Either<Failure, List<GeonamesDTO>>> geoNames({required String name});

  Future<Either<Failure, NotificationDTO>> setCity({required GeonamesDTO geo});

  Future<Either<Failure, TimingsDTO>> timings(
      {required double lat, required double long});

  Future<Either<Failure, List<ResultHomeDTO>>> projectInfo();
  Future<Either<Failure, List<MediaDTO>>> getNotifications();

  Future<Either<Failure, ResultHomeDTO>> seminarDetail({required int id});

  Future<Either<Failure, bool>> newsFavorite({required int id});

  Future<Either<Failure, bool>> newsLike({required int id});

  Future<Either<Failure, bool>> livesFavorite({required int id});

  Future<Either<Failure, List<ChatDTO>>> chats(
      {required String startTime, required String endTime});

  Future<Either<Failure, List<QuestionDTO>>> questions(
      {required int id, String? search, int? page, bool? isFirstCall});

  Future<Either<Failure, FreedomPaymentDTO>> createSeminarPayment(
      {required int id, required String backUrl});
  Future<Either<Failure, NotificationDTO>> notificationDevice({
    required NotificationDeviceDTO notificationDTO,
  });
  Future<Either<Failure, NotificationDeviceDTO>> notificationDevicePatch({
    NotificationDeviceDTO? notificationDTO,
  });
}

@Singleton(as: HomeRepository)
class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDs remoteDS;
  final HomeLocalDs localDS;
  final NetworkInfo networkInfo;

  HomeRepositoryImpl(
    this.localDS, {
    required this.remoteDS,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, bool>> livesFavorite({required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        final bool res = await remoteDS.livesFavorite(id: id);
        return Right(res);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, List<MediaDTO>>> getNotifications() async {
    if (await networkInfo.isConnected) {
      try {
        final List<MediaDTO> res = await remoteDS.getNotifacations();
        return Right(res);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, List<ResultHomeDTO>>> projectInfo() async {
    if (await networkInfo.isConnected) {
      try {
        final List<ResultHomeDTO> res = await remoteDS.projectInfo();
        return Right(res);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, List<GeonamesDTO>>> geoNames(
      {required String name}) async {
    if (await networkInfo.isConnected) {
      try {
        final List<GeonamesDTO> res = await remoteDS.geoNames(name: name);
        return Right(res);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, NotificationDTO>> setCity(
      {required GeonamesDTO geo}) async {
    if (await networkInfo.isConnected) {
      try {
        final NotificationDTO res = await remoteDS.setCity(geo: geo);
        localDS.saveGeoToCache(geo: geo);

        return Right(res);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, FreedomPaymentDTO>> createSeminarPayment(
      {required int id, required String backUrl}) async {
    if (await networkInfo.isConnected) {
      try {
        final FreedomPaymentDTO result =
            await remoteDS.createSeminarPayment(id: id, backUrl: backUrl);

        log(result.toString());
        return Right(result);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, TimingsDTO>> timings(
      {required double lat, required double long}) async {
    if (await networkInfo.isConnected) {
      try {
        final TimingsDTO res = await remoteDS.timings(lat: lat, long: long);
        return Right(res);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, List<FaqModelDTO>>> faq() async {
    if (await networkInfo.isConnected) {
      try {
        final List<FaqModelDTO> res = await remoteDS.faq();
        return Right(res);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, ResultHomeDTO>> newsDetail({required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        final ResultHomeDTO res = await remoteDS.newsDetail(id: id);
        return Right(res);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, ResultHomeDTO>> seminarDetail(
      {required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        final ResultHomeDTO res = await remoteDS.seminarDetail(id: id);
        return Right(res);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, bool>> newsFavorite({required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        final bool res = await remoteDS.newsFavorite(id: id);
        return Right(res);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, bool>> newsLike({required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        final bool res = await remoteDS.newsLike(id: id);
        return Right(res);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, bool>> seminarFavorite({required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        final bool res = await remoteDS.seminarFavorite(id: id);
        return Right(res);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, bool>> seminarLike({required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        final bool res = await remoteDS.seminarLike(id: id);
        return Right(res);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, bool>> commentNewsPost({
    required int id,
    int? commentId,
    required String body,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final bool res = await remoteDS.commentNewsPost(
          id: id,
          commentId: commentId,
          body: body,
        );
        return Right(res);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, bool>> commentSemPost({
    required int id,
    int? commentId,
    required String body,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final bool res = await remoteDS.commentSemPost(
          id: id,
          commentId: commentId,
          body: body,
        );
        return Right(res);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, bool>> commentNewsLike({
    required int id,
    required int commentId,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final bool res =
            await remoteDS.commentNewsLike(id: id, commentId: commentId);
        return Right(res);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, bool>> commentSemLike({
    required int id,
    required int commentId,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final bool res =
            await remoteDS.commentSemLike(id: id, commentId: commentId);
        return Right(res);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

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
        final String? deviceToken =
            await NotificationService().getDeviceToken();
        final String type = Platform.operatingSystem.toString();

        if (Platform.isIOS || Platform.isAndroid) {
          await remoteDS.notificationDevice(
              notification: NotificationDeviceDTO(
            registrationId: deviceToken,
            type: type,
          ));
        }

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
  Future<Either<Failure, List<ResultHomeDTO>>> commentNews({
    int? page,
    bool? isFirstCall,
    int? id,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final List<ResultHomeDTO> charities = await remoteDS.commentNews(
            currentPage: page, isFirstCall: isFirstCall, id: id);
        return Right(charities);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, List<ResultHomeDTO>>> commentSem({
    int? page,
    bool? isFirstCall,
    int? id,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final List<ResultHomeDTO> charities = await remoteDS.commentSeminar(
            currentPage: page, isFirstCall: isFirstCall, id: id);
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
    bool? isPurchased,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final List<ResultHomeDTO> seminar = await remoteDS.seminar(
            search: search,
            isSaved: isSaved,
            currentPage: page,
            isPurchased: isPurchased,
            isFirstCall: isFirstCall);
        return Right(seminar);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, List<ChatDTO>>> chats(
      {required String startTime, required String endTime}) async {
    if (await networkInfo.isConnected) {
      try {
        final List<ChatDTO> chats =
            await remoteDS.chats(startTime: startTime, endTime: endTime);
        return Right(chats);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, List<QuestionDTO>>> questions(
      {required int id, String? search, int? page, bool? isFirstCall}) async {
    if (await networkInfo.isConnected) {
      try {
        final List<QuestionDTO> questions = await remoteDS.questions(
            search: search,
            currentPage: page,
            isFirstCall: isFirstCall,
            id: id);
        return Right(questions);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, NotificationDTO>> notificationDevice(
      {required NotificationDeviceDTO notificationDTO}) async {
    if (await networkInfo.isConnected) {
      try {
        final NotificationDTO notification =
            await remoteDS.notificationDevice(notification: notificationDTO);
        return Right(notification);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, NotificationDeviceDTO>> notificationDevicePatch(
      {NotificationDeviceDTO? notificationDTO}) async {
    if (await networkInfo.isConnected) {
      try {
        final NotificationDeviceDTO notification = await remoteDS
            .notificationDevicePatch(notification: notificationDTO);
        return Right(notification);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }
}
