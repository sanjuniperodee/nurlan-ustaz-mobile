import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/excepteion.dart';
import 'package:nurlan_ustaz_flutter/core/model/freedom_payment_dto.dart';
import 'package:nurlan_ustaz_flutter/core/platform/cache_helper/prefs.dart';
import 'package:nurlan_ustaz_flutter/core/platform/dio_wrapper.dart';
import 'package:nurlan_ustaz_flutter/core/platform/network_helper.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/card_model.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/faq_model_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/geonames_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/media_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/notification_device_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/notification_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';

import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/ustaz_aitinizhi/data/models/chat_model.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/ustaz_aitinizhi/data/models/question_model.dart';

import 'package:nurlan_ustaz_flutter/features/home/data/models/timings_dto.dart';

import '../../models/get_noti_dto.dart';

const _tag = 'HomeRemoteDS';

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

  Future<List<ResultHomeDTO>> news(
      {String? search,
      bool? isSaved,
      int? currentPage,
      bool? isFirstCall = false});

  Future<List<ResultHomeDTO>> newsMain({
    bool? isSaved,
    int? currentPage,
  });

  Future<List<ResultHomeDTO>> seminar(
      {String? search,
      bool? isSaved,
      int? currentPage,
      bool? isPurchased,
      bool? isFirstCall = false});

  Future<List<ResultHomeDTO>> lives(
      {String? search,
      bool? isSaved,
      int? currentPage,
      bool? isFirstCall = false});

  Future<List<ResultHomeDTO>> charities(
      {int? currentPage, bool? isFirstCall = false});

  Future<List<ResultHomeDTO>> commentSeminar(
      {int? currentPage, bool? isFirstCall = false, int? id});

  Future<List<ResultHomeDTO>> commentNews(
      {int? currentPage, bool? isFirstCall = false, int? id});

  Future<String> postImamService({required List<int> id});

  Future<GetNotiDTO> getNotifacations();

  Future<List<MediaDTO>> services(
      {int? currentPage, bool? isFirstCall = false});

  Future<List<ResultHomeDTO>> partners();

  Future<List<ChatDTO>> chats(
      {required String startTime, required String endTime});

  Future<void> createSeminarPayment(
      {required int id, required String backUrl});

  Future<List<QuestionDTO>> questions(
      {int? currentPage,
      String? search,
      required int id,
      bool? isFirstCall = false});

  Future<NotificationDTO> postNotificationDevice(
      {required NotificationDeviceDTO notification});

  Future<NotificationDTO> getNotificationDevice(
      {required String registrationId});

  Future<NotificationDTO> patchNotificationDevice(
      {required String registrationId, required NotificationDTO notification});

  Future<String> checkTicket({required String url});
  Future<List<CardDTO>> getCards({String? search});
  Future<String> getAddCardUrl();
    Future<void> setDefaultCard({required int cardId});

}

@Injectable(as: HomeRemoteDs)
class HomeRemoteDsImpl extends HomeRemoteDs {
  late final Dio dio;
  final DioWrapper dioWrapper;

  HomeRemoteDsImpl(this.dioWrapper) {
    dioWrapper.path('');
    dio = dioWrapper.dio;
  }

  List<ResultHomeDTO> newsPage = [];
  int? lpn;
  List<ResultHomeDTO> seminarPage = [];
  int? lps;
  List<ResultHomeDTO> charitiesPage = [];
  int? lpl;
  List<ResultHomeDTO> livesPage = [];
  int? lpc;
  List<MediaDTO> servicesPage = [];
  int? lpServices;
  List<ResultHomeDTO> commentSeminarPage = [];
  int? lpComSem;
  List<ResultHomeDTO> commentNewsPage = [];
  int? lpComNews;
  List<QuestionDTO> question = [];
  int? lpQuestions;

  @override
  Future<void> createSeminarPayment(
      {required int id, required String backUrl}) async {
    try {
      final response = await dio.post(
        '${EndPoints.seminar}/$id/init_purchase/',
        data: {
          'back_url': backUrl,
        },
      );
      return(response.data);
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'].toString(),
      );
    }
  }

  @override
  Future<bool> livesFavorite({required int id}) async {
    try {
      final response = await dio.post(
        '${EndPoints.lives}/$id/toggle_save/',
      );
      return true;
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<bool> newsFavorite({required int id}) async {
    try {
      final response = await dio.post(
        '${EndPoints.news}/$id/toggle_save/',
      );
      return true;
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<bool> newsLike({required int id}) async {
    try {
      final response = await dio.post(
        '${EndPoints.news}/$id/toggle_like/',
      );
      return true;
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<bool> commentReport({required int id, required String reason}) async {
    try {
      final response = await dio.post(EndPoints.commentReport, data: {
        'comment': id,
        'reason': reason,
      });
      return true;
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<GetNotiDTO> getNotifacations() async {
    try {
      Prefs prefs = Prefs();
      final String? dev = await prefs.getDeviceToken();
      final response = await dio.get(
        '${EndPoints.getNotification}$dev/',
      );

      return GetNotiDTO.fromJson((response.data as Map<String, dynamic>));
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<List<ResultHomeDTO>> projectInfo() async {
    try {
      final response = await dio.get(
        EndPoints.prjInfo,
      );
      return ((response.data as List<dynamic>))
          .map((e) => ResultHomeDTO.fromJson(e))
          .toList();
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<List<ResultHomeDTO>> newsMain({
    bool? isSaved,
    int? currentPage,
  }) async {
    try {
      final response = await dio.get(
        EndPoints.news,
        queryParameters: {
          'page[number]': currentPage,
          // 'page[size]': 6,
          if (isSaved != null) 'is_saved': isSaved,
        },
      );
      return ((response.data as Map<String, dynamic>)['results'] as List)
          .map((x) => ResultHomeDTO.fromJson(x as Map<String, dynamic>))
          .toList();
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<List<FaqModelDTO>> faq() async {
    try {
      final response = await dio.get(
        EndPoints.faq,
      );
      return ((response.data as Map<String, dynamic>)['results'] as List)
          .map((x) => FaqModelDTO.fromJson(x as Map<String, dynamic>))
          .toList();
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<List<GeonamesDTO>> geoNames({required String name}) async {
    try {
      final response = await dio.post(EndPoints.geoNames, data: {'name': name});
      return ((response.data as Map<String, dynamic>)['geonames'] as List)
          .map((x) => GeonamesDTO.fromJson(x as Map<String, dynamic>))
          .toList();
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<TimingsDTO> timings(
      {required double lat, required double long}) async {
    try {
      final response = await dio.post(EndPoints.timings, data: {
        'latitude': lat,
        'longitude': long,
      });

      return TimingsDTO.fromJson(
        (response.data['data']['timings'] as Map<String, dynamic>),
      );
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<NotificationDTO> setCity({required GeonamesDTO geo}) async {
    try {
      Prefs prefs = Prefs();
      final String? dev = await prefs.getDeviceToken();

      final response =
          await dio.post('${EndPoints.setCity}$dev/set_city/', data: {
        'city_name': geo.name,
        'country_name': geo.countryName,
        'latitude': geo.lat,
        'longitude': geo.lng,
      });
      return NotificationDTO.fromJson(
        (response.data as Map<String, dynamic>),
      );
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<ResultHomeDTO> newsDetail({required int id}) async {
    try {
      final response = await dio.get(
        '${EndPoints.news}/$id/',
      );
      return ResultHomeDTO.fromJson(
        (response.data as Map<String, dynamic>),
      );
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<ResultHomeDTO> seminarDetail({required int id}) async {
    try {
      final response = await dio.get(
        '${EndPoints.seminar}/$id/',
      );
      log(response.data.toString());
      return ResultHomeDTO.fromJson(
        (response.data as Map<String, dynamic>),
      );
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<bool> seminarFavorite({required int id}) async {
    try {
      final response = await dio.post(
        '${EndPoints.seminar}/$id/toggle_save/',
      );
      return true;
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<bool> seminarLike({required int id}) async {
    try {
      final response = await dio.post(
        '${EndPoints.seminar}/$id/toggle_like/',
      );
      return true;
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<bool> commentNewsPost({
    required int id,
    int? commentId,
    required String body,
  }) async {
    try {
      final response = await dio.post('${EndPoints.news}/$id/comment/', data: {
        if (commentId != null) 'parent': commentId,
        'body': body,
      });
      return true;
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<bool> commentSemPost({
    required int id,
    int? commentId,
    required String body,
  }) async {
    try {
      final response =
          await dio.post('${EndPoints.seminar}/$id/comment/', data: {
        'parent': commentId,
        'body': body,
      });

      return true;
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<bool> commentNewsLike(
      {required int id, required int commentId}) async {
    try {
      final response =
          await dio.post('${EndPoints.news}/$id/toggle_like_comment/', data: {
        'comment': commentId,
      });

      return true;
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<bool> commentSemLike({required int id, required int commentId}) async {
    try {
      final response = await dio
          .post('${EndPoints.seminar}/$id/toggle_like_comment/', data: {
        'comment': commentId,
      });

      return true;
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<List<ResultHomeDTO>> charities(
      {int? currentPage, bool? isFirstCall = false}) async {
    try {
      if (isFirstCall ?? false) {
        charitiesPage.clear();
      }
      if (lps != null && currentPage! >= lps! && currentPage != 1) {
        return charitiesPage;
      }
      final response = await dio.get(
        EndPoints.charities,
        queryParameters: {
          'page[number]': currentPage,
        },
      );
      if (response.statusCode == 200) {
        lpc = response.data['meta']['pagination']['pages'];

        charitiesPage.addAll(
            ((response.data as Map<String, dynamic>)['results'] as List)
                .map((e) => ResultHomeDTO.fromJson(e as Map<String, dynamic>))
                .toList());
        return charitiesPage;
      }
      // log('PAGE${response.data['meta']['pagination']['page']}');
      throw 'ERROR';
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<List<ResultHomeDTO>> commentNews(
      {int? currentPage, bool? isFirstCall = false, int? id}) async {
    try {
      if (isFirstCall ?? false) {
        commentNewsPage.clear();
      }
      if (lpComNews != null && currentPage! >= lpComNews! && currentPage != 1) {
        return commentNewsPage;
      }
      final response = await dio.get(
        '${EndPoints.news}$id/comments/',
        queryParameters: {
          'page[number]': currentPage,
        },
      );
      if (response.statusCode == 200) {
        lpComNews = response.data['meta']['pagination']['pages'];

        commentNewsPage.addAll(
            ((response.data as Map<String, dynamic>)['results'] as List)
                .map((e) => ResultHomeDTO.fromJson(e as Map<String, dynamic>))
                .toList());
        return commentNewsPage;
      }

      // log('PAGE${response.data['meta']['pagination']['page']}');
      throw 'ERROR';
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<List<ResultHomeDTO>> commentSeminar(
      {int? currentPage, bool? isFirstCall = false, int? id}) async {
    try {
      if (isFirstCall ?? false) {
        commentSeminarPage.clear();
      }
      if (lpComSem != null && currentPage! >= lpComSem! && currentPage != 1) {
        return commentSeminarPage;
      }
      final response = await dio.get(
        '${EndPoints.seminar}$id/comments/',
        queryParameters: {
          'page[number]': currentPage,
        },
      );
      log('COMMENT:::${response.data.toString()}');
      if (response.statusCode == 200) {
        lpComSem = response.data['meta']['pagination']['pages'];

        commentSeminarPage.addAll(
            ((response.data as Map<String, dynamic>)['results'] as List)
                .map((e) => ResultHomeDTO.fromJson(e as Map<String, dynamic>))
                .toList());
        return commentSeminarPage;
      }

      // log('PAGE${response.data['meta']['pagination']['page']}');
      throw 'ERROR';
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<List<MediaDTO>> services(
      {int? currentPage, bool? isFirstCall = false}) async {
    try {
      if (isFirstCall ?? false) {
        servicesPage.clear();
      }
      if (lpServices != null &&
          currentPage! >= lpServices! &&
          currentPage != 1) {
        return servicesPage;
      }
      final response = await dio.get(
        EndPoints.imamServices,
        queryParameters: {
          'page[number]': currentPage,
        },
      );
      log(response.data.toString());
      if (response.statusCode == 200) {
        lpServices = response.data['meta']['pagination']['pages'];

        servicesPage.addAll(
            ((response.data as Map<String, dynamic>)['results'] as List)
                .map((e) => MediaDTO.fromJson(e as Map<String, dynamic>))
                .toList());
        return servicesPage;
      }
      // log('PAGE${response.data['meta']['pagination']['page']}');
      throw 'ERROR';
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<List<ResultHomeDTO>> partners() async {
    try {
      final response = await dio.get(
        EndPoints.partners,
      );

      return ((response.data as Map<String, dynamic>)['results'] as List)
          .map((x) => ResultHomeDTO.fromJson(x as Map<String, dynamic>))
          .toList();
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<List<ResultHomeDTO>> lives(
      {String? search,
      bool? isSaved,
      int? currentPage,
      bool? isFirstCall = false}) async {
    try {
      if (isFirstCall ?? false) {
        livesPage.clear();
      }
      if (lpl != null && currentPage! >= lpl! && currentPage != 1) {
        return livesPage;
      }
      final response = await dio.get(
        EndPoints.lives,
        queryParameters: {
          'page[number]': currentPage,
          // 'page[size]': 6,
          if (isSaved != null) 'is_saved': isSaved,
          if (search != null) 'search': search,
        },
      );
      log(response.data.toString());
      if (response.statusCode == 200) {
        if (search != null && search.isNotEmpty) {
          livesPage.clear();
        }
        lpl = response.data['meta']['pagination']['pages'];

        livesPage.addAll(
            ((response.data as Map<String, dynamic>)['results'] as List)
                .map((e) => ResultHomeDTO.fromJson(e as Map<String, dynamic>))
                .toList());
        log('lives response-${livesPage.map((e) => e.cover).toList().toString()}');
        return livesPage;
      }
      // log('PAGE${response.data['meta']['pagination']['page']}');
      throw 'ERROR';
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<List<ResultHomeDTO>> news(
      {String? search,
      bool? isSaved,
      int? currentPage,
      bool? isFirstCall = false}) async {
    try {
      if (isFirstCall ?? false) {
        newsPage.clear();
      }
      if (lpn != null && currentPage! >= lpn! && currentPage != 1) {
        return newsPage;
      }
      final response = await dio.get(
        EndPoints.news,
        queryParameters: {
          'page[number]': currentPage,
          // 'page[size]': 6,
          if (isSaved != null) 'is_saved': isSaved,
          if (search != null) 'search': search,
        },
      );
      if (response.statusCode == 200) {
        if (search != null && search.isNotEmpty) {
          newsPage.clear();
        }
        lpn = response.data['meta']['pagination']['pages'];

        newsPage.addAll(
            ((response.data as Map<String, dynamic>)['results'] as List)
                .map((e) => ResultHomeDTO.fromJson(e as Map<String, dynamic>))
                .toList());
        log('news response-${newsPage.map((e) => e.cover).toList().toString()}');

        return newsPage;
      }
      // log('PAGE${response.data['meta']['pagination']['page']}');
      throw 'ERROR';
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<String> postImamService({required List<int> id}) async {
    try {
      final response = await dio.post(
        '${EndPoints.imamServices}/google_form/',
        data: {
          'imam_services': id,
        },
      );
      log(response.data.toString());
      return (response.data as Map<String, dynamic>)['url'] as String;
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<List<ResultHomeDTO>> seminar(
      {String? search,
      bool? isSaved,
      bool? isPurchased,
      int? currentPage,
      bool? isFirstCall = false}) async {
    try {
      if (isFirstCall ?? false) {
        seminarPage.clear();
      }
      if (lps != null && currentPage! >= lps! && currentPage != 1) {
        return seminarPage;
      }
      final response = await dio.get(
        EndPoints.seminar,
        queryParameters: {
          'page[number]': currentPage,
          // 'page[size]': 6,
          if (isPurchased != null) 'is_purchased': isPurchased,
          if (isSaved != null) 'is_saved': isSaved,
          if (search != null) 'search': search,
        },
      );
      log(response.data.toString());
      if (response.statusCode == 200) {
        if (search != null && search.isNotEmpty) {
          seminarPage.clear();
        }
        lps = response.data['meta']['pagination']['pages'];

        seminarPage.addAll(
            ((response.data as Map<String, dynamic>)['results'] as List)
                .map((e) => ResultHomeDTO.fromJson(e as Map<String, dynamic>))
                .toList());
        log('seminar response-${seminarPage.map((e) => e.cover).toList().toString()}');

        return seminarPage;
      }

      // log('PAGE${response.data['meta']['pagination']['page']}');
      throw 'ERROR';
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<List<ChatDTO>> chats(
      {required String startTime, required String endTime}) async {
    try {
      final response = await dio.get(
        '${EndPoints.chats}/?start_date=$startTime&end_date=$endTime',
      );
      if (response.statusCode == 200) {
        var chatList = ((response.data as List)
            .map((e) => ChatDTO.fromJson(e as Map<String, dynamic>))
            .toList());
        print(chatList.map((e) => e.id).toList());

        return chatList;
      }
      throw 'ERROR';
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<List<QuestionDTO>> questions(
      {int? currentPage,
      String? search,
      required int id,
      bool? isFirstCall = false}) async {
    try {
      final response = await dio.get(
        '${EndPoints.chats}/$id/questions/',
        queryParameters: {
          if (search != null) 'search': search,
          'page[number]': 1,
          'page[size]': 100,
        },
      );

      if (response.statusCode == 200) {
        final responseBody = response.data as Map<String, dynamic>;
        final List<QuestionDTO> quests = (responseBody['results'] as List)
            .map((e) => QuestionDTO.fromJson(e as Map<String, dynamic>))
            .toList();
        return quests;
      }

      // log('PAGE${response.data['meta']['pagination']['page']}');
      throw 'ERROR';
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<NotificationDTO> postNotificationDevice(
      {required NotificationDeviceDTO notification}) async {
    try {
      final response = await dio.post(
        EndPoints.notification,
        data: jsonEncode(notification.toJson()),
      );
      return NotificationDTO.fromJson(response.data);
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'].toString(),
      );
    }
  }

  @override
  Future<NotificationDTO> getNotificationDevice(
      {required String registrationId}) async {
    try {
      final response = await dio.get(
        '${EndPoints.notification}/$registrationId/',
        data: {'registration_id': registrationId},
      );
      log('NOTI::::${response.data.toString()}');
      return NotificationDTO.fromJson(response.data);
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'].toString(),
      );
    }
  }

  @override
  Future<NotificationDTO> patchNotificationDevice(
      {required String registrationId,
      required NotificationDTO notification}) async {
    log('Atai-${registrationId}');
    log('Atai1-${notification.toString()}');

    try {
      final FormData formData = FormData.fromMap(notification.toJson());
      final response = await dio.patch(
        '${EndPoints.notification}/$registrationId/',
        data: formData,
      );
      return NotificationDTO.fromJson(response.data);
    } on DioError catch (e) {
      throw ServerException(
        message: e.response?.data.toString() ?? 'error',
      );
    }
  }

  @override
  Future<String> checkTicket({required String url}) async {
    try {
      final response = await dio.get(
        url,
      );
      log(response.data.toString());
      return (response.data.toString());
    } on DioError catch (e) {
      throw ServerException(
        message: (e.response!.data.toString()),
      );
    }
  }

  @override
  Future<List<CardDTO>> getCards({String? search}) async {
    try {
      final response = await dio.get(
        EndPoints.cards,
      );
      if (response.statusCode == 200) {
        var cardList = ((response.data as List)
            .map((e) => CardDTO.fromJson(e as Map<String, dynamic>))
            .toList());

        return cardList;
      }
      throw 'ERROR';
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<String> getAddCardUrl() async {
    try {
      final response = await dio.get(
        EndPoints.addCards,
      );
      if (response.statusCode == 200) {
        var cardAddUrl = ((response.data as String));

        return cardAddUrl;
      }
      throw 'ERROR';
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }
  
  @override
  Future<void> setDefaultCard({required int cardId})async {
   try {
       await dio.get(
        '${EndPoints.cards}$cardId/set-default-card/',
      );
      
      throw 'ERROR';
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }
}
