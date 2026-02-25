import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/exception.dart';
import 'package:nurlan_ustaz_flutter/core/platform/platform_check.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/core/model/freedom_payment_dto.dart';
import 'package:nurlan_ustaz_flutter/core/platform/cache_helper/prefs.dart';
import 'package:nurlan_ustaz_flutter/core/platform/platform_helper.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/datasource/local/home_local_ds.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/datasource/remote/home_remote_ds.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/card_model.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/faq_model_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/geonames_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/get_noti_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/media_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/notification_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/timings_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/ustaz_aitinizhi/data/models/chat_model.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/ustaz_aitinizhi/data/models/question_model.dart';

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

  Future<Either<Failure, String>> postImamService({
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

  Future<Either<Failure, List<ResultHomeDTO>>> newsMain({
    bool? isSaved,
    int? currentPage,
  });

  Future<Either<Failure, GetNotiDTO>> getNotifications();

  Future<Either<Failure, ResultHomeDTO>> seminarDetail({required int id});

  Future<Either<Failure, bool>> newsFavorite({required int id});

  Future<Either<Failure, bool>> newsLike({required int id});

  Future<Either<Failure, bool>> commentReport(
      {required int id, required String reason});

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

  Future<Either<Failure, NotificationDTO>> getNotificationDevice({
    required String registrationId,
  });

  Future<Either<Failure, NotificationDTO>> putNotificationDevice(
      {required String registrationId, required NotificationDTO notification});

  Future<Either<Failure, String>> checkTicket({required String url});
  Future<Either<Failure, List<CardDTO>>> getCards({String? search});
  Future<Either<Failure, String>> getAddCArdUrl();
  Future<Either<Failure, void>> setDefaultCard({required int cardId});
}

@Singleton(as: HomeRepository)
class HomeRepositoryImpl extends HomeRepository {
  HomeRepositoryImpl(
    this.localDS, {
    required this.remoteDS,
  });

  final HomeRemoteDs remoteDS;
  final HomeLocalDs localDS;

  // Pagination state (moved from datasource)
  List<ResultHomeDTO> _newsCache = [];
  int? _newsTotalPages;

  List<ResultHomeDTO> _seminarCache = [];
  int? _seminarTotalPages;

  List<ResultHomeDTO> _livesCache = [];
  int? _livesTotalPages;

  List<ResultHomeDTO> _charitiesCache = [];
  int? _charitiesTotalPages;

  List<ResultHomeDTO> _commentSemCache = [];
  int? _commentSemTotalPages;
  int? _commentSemId;

  List<ResultHomeDTO> _commentNewsCache = [];
  int? _commentNewsTotalPages;
  int? _commentNewsId;

  List<MediaDTO> _servicesCache = [];
  int? _servicesTotalPages;

  @override
  Future<Either<Failure, bool>> livesFavorite({required int id}) async {
    try {
      final bool res = await remoteDS.livesFavorite(id: id);
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, GetNotiDTO>> getNotifications() async {
    try {
      final GetNotiDTO res = await remoteDS.getNotifacations();
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<ResultHomeDTO>>> projectInfo() async {
    try {
      final List<ResultHomeDTO> res = await remoteDS.projectInfo();
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<ResultHomeDTO>>> newsMain({
    bool? isSaved,
    int? currentPage,
  }) async {
    try {
      // Регистрация пуш‑устройства не должна ломать загрузку новостей.
      // На платформах, где пуши не поддерживаются (macOS/web), полностью
      // пропускаем этот блок, т.к. некоторые реализации
      // NotificationService().getDeviceToken() могут никогда не завершаться
      // и тогда главная страница вечно висит в состоянии загрузки.
      if (isSaved == null && (isIOS || isAndroid)) {
        try {
          final prefs = Prefs();
          final String? cacheToken = await prefs.getDeviceToken();
          final String? firebaseToken =
              await NotificationService().getDeviceToken();

          final type = PlatformHelper.operatingSystem;

          if (cacheToken == null) {
            await remoteDS.postNotificationDevice(
              notification: NotificationDeviceDTO(
                registrationId: firebaseToken,
                type: type,
              ),
            );
            if (firebaseToken != null) {
              await prefs.saveDeviceToken(firebaseToken);
            }
          } else if (cacheToken != firebaseToken) {
            final notificationDeviceDTO =
                NotificationDTO(registrationId: firebaseToken, type: type);
            await remoteDS
                .patchNotificationDevice(
                    registrationId: cacheToken,
                    notification: notificationDeviceDTO)
                .then((value) async {
              if (firebaseToken != null) {
                await prefs.saveDeviceToken(firebaseToken);
              }
            });
          } else {
            final notificationDeviceDTO =
                NotificationDTO(registrationId: firebaseToken, type: type);
            await remoteDS.patchNotificationDevice(
              registrationId: cacheToken,
              notification: notificationDeviceDTO,
            );
          }
        } catch (_) {
          // Игнорируем любые ошибки регистрации устройства.
        }
      }

      final List<ResultHomeDTO> res =
          await remoteDS.newsMain(isSaved: isSaved, currentPage: currentPage);
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<GeonamesDTO>>> geoNames(
      {required String name}) async {
    try {
      final List<GeonamesDTO> res = await remoteDS.geoNames(name: name);
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, NotificationDTO>> setCity(
      {required GeonamesDTO geo}) async {
    try {
      final NotificationDTO res = await remoteDS.setCity(geo: geo);
      localDS.saveGeoToCache(geo: geo);

      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, FreedomPaymentDTO>> createSeminarPayment(
      {required int id, required String backUrl}) async {
    try {
      final result =
          await remoteDS.createSeminarPayment(id: id, backUrl: backUrl);

      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, TimingsDTO>> timings(
      {required double lat, required double long}) async {
    try {
      final TimingsDTO res = await remoteDS.timings(lat: lat, long: long);
      return Right(res);
    } on DioException catch (e) {
      final err = e.error;
      if (err is ServerException) {
        return Left(ServerFailure(message: err.message));
      }
      String? msg;
      if (e.response?.data is Map<String, dynamic>) {
        final d = e.response!.data as Map<String, dynamic>;
        msg = d['message']?.toString() ?? d['detail']?.toString();
      }
      return Left(ServerFailure(
          message: msg ?? e.message ?? 'Ошибка загрузки времени намаза'));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<FaqModelDTO>>> faq() async {
    try {
      final List<FaqModelDTO> res = await remoteDS.faq();
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, ResultHomeDTO>> newsDetail({required int id}) async {
    try {
      final ResultHomeDTO res = await remoteDS.newsDetail(id: id);
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, ResultHomeDTO>> seminarDetail(
      {required int id}) async {
    try {
      final ResultHomeDTO res = await remoteDS.seminarDetail(id: id);
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> newsFavorite({required int id}) async {
    try {
      final bool res = await remoteDS.newsFavorite(id: id);
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> newsLike({required int id}) async {
    try {
      final bool res = await remoteDS.newsLike(id: id);
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> commentReport(
      {required int id, required String reason}) async {
    try {
      final bool res = await remoteDS.commentReport(id: id, reason: reason);
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> seminarFavorite({required int id}) async {
    try {
      final bool res = await remoteDS.seminarFavorite(id: id);
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> seminarLike({required int id}) async {
    try {
      final bool res = await remoteDS.seminarLike(id: id);
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> commentNewsPost({
    required int id,
    int? commentId,
    required String body,
  }) async {
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
  }

  @override
  Future<Either<Failure, bool>> commentSemPost({
    required int id,
    int? commentId,
    required String body,
  }) async {
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
  }

  @override
  Future<Either<Failure, bool>> commentNewsLike({
    required int id,
    required int commentId,
  }) async {
    try {
      final bool res =
          await remoteDS.commentNewsLike(id: id, commentId: commentId);
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> commentSemLike({
    required int id,
    required int commentId,
  }) async {
    try {
      final bool res =
          await remoteDS.commentSemLike(id: id, commentId: commentId);
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, String>> postImamService({
    required List<int> id,
  }) async {
    try {
      final String result = await remoteDS.postImamService(
        id: id,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<ResultHomeDTO>>> lives({
    String? search,
    bool? isSaved,
    int? page,
    bool? isFirstCall,
  }) async {
    try {
      if (isFirstCall ?? false) {
        _livesCache = [];
        _livesTotalPages = null;
      }
      final currentPage = page ?? 1;
      if (_livesTotalPages != null &&
          currentPage >= _livesTotalPages! &&
          currentPage != 1) {
        return Right(List.from(_livesCache));
      }
      final res = await remoteDS.livesPage(
        search: search,
        isSaved: isSaved,
        page: currentPage,
      );
      _livesTotalPages = res.totalPages;
      if (currentPage == 1) {
        _livesCache = List.from(res.items);
      } else {
        _livesCache.addAll(res.items);
      }
      return Right(List.from(_livesCache));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<ResultHomeDTO>>> partners() async {
    try {
      final List<ResultHomeDTO> partners = await remoteDS.partners();
      return Right(partners);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<ResultHomeDTO>>> news({
    String? search,
    bool? isSaved,
    int? page,
    bool? isFirstCall,
  }) async {
    try {
      if (isSaved == null) {
        final String? deviceToken =
            await NotificationService().getDeviceToken();
        final String type = PlatformHelper.operatingSystem;
        final result =
            await getNotificationDevice(registrationId: deviceToken ?? '');
        result.fold((l) async {
          if (isIOS || isAndroid) {
            await remoteDS.postNotificationDevice(
                notification: NotificationDeviceDTO(
              registrationId: deviceToken,
              type: type,
            ));
          }
        }, (r) async {
          if (r.registrationId != deviceToken) {
            if (isIOS || isAndroid) {
              await remoteDS.postNotificationDevice(
                  notification: NotificationDeviceDTO(
                registrationId: deviceToken,
                type: type,
              ));
            }
          }
        });
      }

      if (isFirstCall ?? false) {
        _newsCache = [];
        _newsTotalPages = null;
      }
      final currentPage = page ?? 1;
      if (_newsTotalPages != null &&
          currentPage >= _newsTotalPages! &&
          currentPage != 1) {
        return Right(List.from(_newsCache));
      }
      final res = await remoteDS.newsPage(
        search: search,
        isSaved: isSaved,
        page: currentPage,
      );
      _newsTotalPages = res.totalPages;
      if (currentPage == 1) {
        _newsCache = List.from(res.items);
      } else {
        _newsCache.addAll(res.items);
      }
      return Right(List.from(_newsCache));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<ResultHomeDTO>>> charities({
    int? page,
    bool? isFirstCall,
  }) async {
    try {
      if (isFirstCall ?? false) {
        _charitiesCache = [];
        _charitiesTotalPages = null;
      }
      final currentPage = page ?? 1;
      if (_charitiesTotalPages != null &&
          currentPage >= _charitiesTotalPages! &&
          currentPage != 1) {
        return Right(List.from(_charitiesCache));
      }
      final res =
          await remoteDS.charitiesPage(page: currentPage);
      _charitiesTotalPages = res.totalPages;
      if (currentPage == 1) {
        _charitiesCache = List.from(res.items);
      } else {
        _charitiesCache.addAll(res.items);
      }
      return Right(List.from(_charitiesCache));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<ResultHomeDTO>>> commentNews({
    int? page,
    bool? isFirstCall,
    int? id,
  }) async {
    try {
      if (id == null) {
        return Right([]);
      }
      if (isFirstCall ?? false || _commentNewsId != id) {
        _commentNewsCache = [];
        _commentNewsTotalPages = null;
        _commentNewsId = id;
      }
      final currentPage = page ?? 1;
      if (_commentNewsTotalPages != null &&
          currentPage >= _commentNewsTotalPages! &&
          currentPage != 1) {
        return Right(List.from(_commentNewsCache));
      }
      final res = await remoteDS.commentNewsPage(id: id, page: currentPage);
      _commentNewsTotalPages = res.totalPages;
      if (currentPage == 1) {
        _commentNewsCache = List.from(res.items);
      } else {
        _commentNewsCache.addAll(res.items);
      }
      return Right(List.from(_commentNewsCache));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<ResultHomeDTO>>> commentSem({
    int? page,
    bool? isFirstCall,
    int? id,
  }) async {
    try {
      if (id == null) {
        return Right([]);
      }
      if (isFirstCall ?? false || _commentSemId != id) {
        _commentSemCache = [];
        _commentSemTotalPages = null;
        _commentSemId = id;
      }
      final currentPage = page ?? 1;
      if (_commentSemTotalPages != null &&
          currentPage >= _commentSemTotalPages! &&
          currentPage != 1) {
        return Right(List.from(_commentSemCache));
      }
      final res = await remoteDS.commentSeminarPage(id: id, page: currentPage);
      _commentSemTotalPages = res.totalPages;
      if (currentPage == 1) {
        _commentSemCache = List.from(res.items);
      } else {
        _commentSemCache.addAll(res.items);
      }
      return Right(List.from(_commentSemCache));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<MediaDTO>>> services({
    int? page,
    bool? isFirstCall,
  }) async {
    try {
      if (isFirstCall ?? false) {
        _servicesCache = [];
        _servicesTotalPages = null;
      }
      final currentPage = page ?? 1;
      if (_servicesTotalPages != null &&
          currentPage >= _servicesTotalPages! &&
          currentPage != 1) {
        return Right(List.from(_servicesCache));
      }
      final res = await remoteDS.servicesPage(page: currentPage);
      _servicesTotalPages = res.totalPages;
      if (currentPage == 1) {
        _servicesCache = List.from(res.items);
      } else {
        _servicesCache.addAll(res.items);
      }
      return Right(List.from(_servicesCache));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
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
    try {
      if (isFirstCall ?? false) {
        _seminarCache = [];
        _seminarTotalPages = null;
      }
      final currentPage = page ?? 1;
      if (_seminarTotalPages != null &&
          currentPage >= _seminarTotalPages! &&
          currentPage != 1) {
        return Right(List.from(_seminarCache));
      }
      final res = await remoteDS.seminarPage(
        search: search,
        isSaved: isSaved,
        isPurchased: isPurchased,
        page: currentPage,
      );
      _seminarTotalPages = res.totalPages;
      if (currentPage == 1) {
        _seminarCache = List.from(res.items);
      } else {
        _seminarCache.addAll(res.items);
      }
      return Right(List.from(_seminarCache));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<ChatDTO>>> chats(
      {required String startTime, required String endTime}) async {
    try {
      final List<ChatDTO> chats =
          await remoteDS.chats(startTime: startTime, endTime: endTime);
      return Right(chats);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<QuestionDTO>>> questions(
      {required int id, String? search, int? page, bool? isFirstCall}) async {
    try {
      final List<QuestionDTO> questions = await remoteDS.questions(
          search: search, currentPage: page, isFirstCall: isFirstCall, id: id);
      return Right(questions);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, NotificationDTO>> notificationDevice(
      {required NotificationDeviceDTO notificationDTO}) async {
    try {
      final NotificationDTO notification =
          await remoteDS.postNotificationDevice(notification: notificationDTO);
      return Right(notification);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, NotificationDTO>> getNotificationDevice(
      {required String registrationId}) async {
    try {
      final NotificationDTO notification =
          await remoteDS.getNotificationDevice(registrationId: registrationId);
      return Right(notification);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, NotificationDTO>> putNotificationDevice(
      {required String registrationId,
      required NotificationDTO notification}) async {
    try {
      final NotificationDTO notificationT =
          await remoteDS.patchNotificationDevice(
              registrationId: registrationId, notification: notification);
      return Right(notificationT);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, String>> checkTicket({required String url}) async {
    try {
      final message = await remoteDS.checkTicket(url: url);
      return Right(message);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<CardDTO>>> getCards({String? search}) async {
    try {
      final List<CardDTO> cards = await remoteDS.getCards(search: search);
      return Right(cards);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, String>> getAddCArdUrl() async {
    try {
      final String addCardUrl = await remoteDS.getAddCardUrl();
      return Right(addCardUrl);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, void>> setDefaultCard({required int cardId}) async {
    try {
      await remoteDS.setDefaultCard(cardId: cardId);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
