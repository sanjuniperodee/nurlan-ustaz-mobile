import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/data/paginated_response.dart';
import 'package:nurlan_ustaz_flutter/core/model/freedom_payment_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/datasource/remote/domain/charity_remote_ds.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/datasource/remote/domain/comment_remote_ds.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/datasource/remote/domain/home_misc_remote_ds.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/datasource/remote/domain/lives_remote_ds.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/datasource/remote/domain/news_remote_ds.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/datasource/remote/domain/notification_remote_ds.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/datasource/remote/domain/payment_remote_ds.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/datasource/remote/domain/seminar_remote_ds.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/datasource/remote/domain/tell_me_ustaz_remote_ds.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/card_model.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/faq_model_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/geonames_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/media_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/notification_device_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/notification_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/timings_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/ustaz_aitinizhi/data/models/chat_model.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/ustaz_aitinizhi/data/models/question_model.dart';

import '../../models/get_noti_dto.dart';

abstract class HomeRemoteDs {
  Future<bool> seminarFavorite({required int id});
  Future<bool> seminarLike({required int id});
  Future<bool> newsFavorite({required int id});
  Future<bool> newsLike({required int id});
  Future<bool> commentReport({required int id, required String reason});
  Future<bool> commentSemPost({
    required int id,
    int? commentId,
    required String body,
  });
  Future<bool> commentNewsPost({
    required int id,
    int? commentId,
    required String body,
  });
  Future<bool> commentSemLike({required int id, required int commentId});
  Future<bool> commentNewsLike({required int id, required int commentId});
  Future<bool> livesFavorite({required int id});
  Future<ResultHomeDTO> newsDetail({required int id});
  Future<List<FaqModelDTO>> faq();
  Future<List<GeonamesDTO>> geoNames({required String name});
  Future<NotificationDTO> setCity({required GeonamesDTO geo});
  Future<TimingsDTO> timings({required double lat, required double long});
  Future<List<ResultHomeDTO>> projectInfo();
  Future<ResultHomeDTO> seminarDetail({required int id});
  Future<PaginatedResponse<ResultHomeDTO>> newsPage({
    String? search,
    bool? isSaved,
    required int page,
  });
  Future<List<ResultHomeDTO>> newsMain({
    bool? isSaved,
    int? currentPage,
  });
  Future<PaginatedResponse<ResultHomeDTO>> seminarPage({
    String? search,
    bool? isSaved,
    bool? isPurchased,
    required int page,
  });
  Future<PaginatedResponse<ResultHomeDTO>> livesPage({
    String? search,
    bool? isSaved,
    required int page,
  });
  Future<PaginatedResponse<ResultHomeDTO>> charitiesPage({
    required int page,
  });
  Future<PaginatedResponse<ResultHomeDTO>> commentSeminarPage({
    required int id,
    required int page,
  });
  Future<PaginatedResponse<ResultHomeDTO>> commentNewsPage({
    required int id,
    required int page,
  });
  Future<String> postImamService({required List<int> id});
  Future<GetNotiDTO> getNotifacations();
  Future<PaginatedResponse<MediaDTO>> servicesPage({required int page});
  Future<List<ResultHomeDTO>> partners();
  Future<List<ChatDTO>> chats({
    required String startTime,
    required String endTime,
  });
  Future<FreedomPaymentDTO> createSeminarPayment({
    required int id,
    required String backUrl,
  });
  Future<List<QuestionDTO>> questions({
    int? currentPage,
    String? search,
    required int id,
    bool? isFirstCall = false,
  });
  Future<NotificationDTO> postNotificationDevice({
    required NotificationDeviceDTO notification,
  });
  Future<NotificationDTO> getNotificationDevice({
    required String registrationId,
  });
  Future<NotificationDTO> patchNotificationDevice({
    required String registrationId,
    required NotificationDTO notification,
  });
  Future<String> checkTicket({required String url});
  Future<List<CardDTO>> getCards({String? search});
  Future<String> getAddCardUrl();
  Future<void> setDefaultCard({required int cardId});
}

@Injectable(as: HomeRemoteDs)
class HomeRemoteDsImpl extends HomeRemoteDs {
  HomeRemoteDsImpl({
    required this.newsDs,
    required this.seminarDs,
    required this.livesDs,
    required this.charityDs,
    required this.notificationDs,
    required this.paymentDs,
    required this.tellMeUstazDs,
    required this.commentDs,
    required this.miscDs,
  });

  final NewsRemoteDs newsDs;
  final SeminarRemoteDs seminarDs;
  final LivesRemoteDs livesDs;
  final CharityRemoteDs charityDs;
  final HomeNotificationRemoteDs notificationDs;
  final PaymentRemoteDs paymentDs;
  final TellMeUstazRemoteDs tellMeUstazDs;
  final CommentRemoteDs commentDs;
  final HomeMiscRemoteDs miscDs;

  @override
  Future<FreedomPaymentDTO> createSeminarPayment({
    required int id,
    required String backUrl,
  }) =>
      seminarDs.createSeminarPayment(id: id, backUrl: backUrl);

  @override
  Future<bool> livesFavorite({required int id}) =>
      livesDs.livesFavorite(id: id);

  @override
  Future<bool> newsFavorite({required int id}) =>
      newsDs.newsFavorite(id: id);

  @override
  Future<bool> newsLike({required int id}) => newsDs.newsLike(id: id);

  @override
  Future<bool> commentReport({required int id, required String reason}) =>
      commentDs.commentReport(id: id, reason: reason);

  @override
  Future<GetNotiDTO> getNotifacations() => notificationDs.getNotifications();

  @override
  Future<List<ResultHomeDTO>> projectInfo() => miscDs.projectInfo();

  @override
  Future<List<ResultHomeDTO>> newsMain({
    bool? isSaved,
    int? currentPage,
  }) =>
      newsDs.newsMain(isSaved: isSaved, currentPage: currentPage);

  @override
  Future<List<GeonamesDTO>> geoNames({required String name}) =>
      miscDs.geoNames(name: name);

  @override
  Future<NotificationDTO> setCity({required GeonamesDTO geo}) =>
      miscDs.setCity(geo: geo);

  @override
  Future<TimingsDTO> timings({
    required double lat,
    required double long,
  }) =>
      miscDs.timings(lat: lat, long: long);

  @override
  Future<List<FaqModelDTO>> faq() => miscDs.faq();

  @override
  Future<ResultHomeDTO> newsDetail({required int id}) =>
      newsDs.newsDetail(id: id);

  @override
  Future<ResultHomeDTO> seminarDetail({required int id}) =>
      seminarDs.seminarDetail(id: id);

  @override
  Future<bool> seminarFavorite({required int id}) =>
      seminarDs.seminarFavorite(id: id);

  @override
  Future<bool> seminarLike({required int id}) =>
      seminarDs.seminarLike(id: id);

  @override
  Future<bool> commentNewsPost({
    required int id,
    int? commentId,
    required String body,
  }) =>
      newsDs.commentNewsPost(
        id: id,
        commentId: commentId,
        body: body,
      );

  @override
  Future<bool> commentSemPost({
    required int id,
    int? commentId,
    required String body,
  }) =>
      seminarDs.commentSemPost(
        id: id,
        commentId: commentId,
        body: body,
      );

  @override
  Future<bool> commentNewsLike({
    required int id,
    required int commentId,
  }) =>
      newsDs.commentNewsLike(id: id, commentId: commentId);

  @override
  Future<bool> commentSemLike({
    required int id,
    required int commentId,
  }) =>
      seminarDs.commentSemLike(id: id, commentId: commentId);

  @override
  Future<String> postImamService({required List<int> id}) =>
      miscDs.postImamService(id: id);

  @override
  Future<PaginatedResponse<ResultHomeDTO>> livesPage({
    String? search,
    bool? isSaved,
    required int page,
  }) =>
      livesDs.livesPage(
        search: search,
        isSaved: isSaved,
        page: page,
      );

  @override
  Future<List<ResultHomeDTO>> partners() => miscDs.partners();

  @override
  Future<PaginatedResponse<ResultHomeDTO>> newsPage({
    String? search,
    bool? isSaved,
    required int page,
  }) =>
      newsDs.newsPage(
        search: search,
        isSaved: isSaved,
        page: page,
      );

  @override
  Future<PaginatedResponse<ResultHomeDTO>> charitiesPage({
    required int page,
  }) =>
      charityDs.charitiesPage(page: page);

  @override
  Future<PaginatedResponse<ResultHomeDTO>> commentNewsPage({
    required int id,
    required int page,
  }) =>
      newsDs.commentNewsPage(id: id, page: page);

  @override
  Future<PaginatedResponse<ResultHomeDTO>> commentSeminarPage({
    required int id,
    required int page,
  }) =>
      seminarDs.commentSeminarPage(id: id, page: page);

  @override
  Future<PaginatedResponse<MediaDTO>> servicesPage({required int page}) =>
      miscDs.servicesPage(page: page);

  @override
  Future<PaginatedResponse<ResultHomeDTO>> seminarPage({
    String? search,
    bool? isSaved,
    bool? isPurchased,
    required int page,
  }) =>
      seminarDs.seminarPage(
        search: search,
        isSaved: isSaved,
        isPurchased: isPurchased,
        page: page,
      );

  @override
  Future<List<ChatDTO>> chats({
    required String startTime,
    required String endTime,
  }) =>
      tellMeUstazDs.chats(
        startTime: startTime,
        endTime: endTime,
      );

  @override
  Future<List<QuestionDTO>> questions({
    int? currentPage,
    String? search,
    required int id,
    bool? isFirstCall = false,
  }) =>
      tellMeUstazDs.questions(
        currentPage: currentPage,
        search: search,
        id: id,
        isFirstCall: isFirstCall,
      );

  @override
  Future<NotificationDTO> postNotificationDevice({
    required NotificationDeviceDTO notification,
  }) =>
      notificationDs.postNotificationDevice(notification: notification);

  @override
  Future<NotificationDTO> getNotificationDevice({
    required String registrationId,
  }) =>
      notificationDs.getNotificationDevice(registrationId: registrationId);

  @override
  Future<NotificationDTO> patchNotificationDevice({
    required String registrationId,
    required NotificationDTO notification,
  }) =>
      notificationDs.patchNotificationDevice(
        registrationId: registrationId,
        notification: notification,
      );

  @override
  Future<String> checkTicket({required String url}) =>
      miscDs.checkTicket(url: url);

  @override
  Future<List<CardDTO>> getCards({String? search}) =>
      paymentDs.getCards(search: search);

  @override
  Future<String> getAddCardUrl() => paymentDs.getAddCardUrl();

  @override
  Future<void> setDefaultCard({required int cardId}) =>
      paymentDs.setDefaultCard(cardId: cardId);
}
