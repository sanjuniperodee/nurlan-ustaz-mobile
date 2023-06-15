import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/excepteion.dart';
import 'package:nurlan_ustaz_flutter/core/platform/dio_wrapper.dart';
import 'package:nurlan_ustaz_flutter/core/platform/network_helper.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/media_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';

const _tag = 'HomeRemoteDS';

abstract class HomeRemoteDs {
  Future<bool> seminarFavorite({required int id});
  Future<bool> seminarLike({required int id});
  Future<bool> newsFavorite({required int id});
  Future<bool> newsLike({required int id});
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
  Future<ResultHomeDTO> seminarDetail({required int id});
  Future<List<ResultHomeDTO>> news(
      {String? search,
      bool? isSaved,
      int? currentPage,
      bool? isFirstCall = false});
  Future<List<ResultHomeDTO>> seminar(
      {String? search,
      bool? isSaved,
      int? currentPage,
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
  Future<bool> postImamService({required List<int> id});
  Future<List<MediaDTO>> services(
      {int? currentPage, bool? isFirstCall = false});
  Future<List<ResultHomeDTO>> partners();
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
      if (response.statusCode == 200) {
        if (search != null && search.isNotEmpty) {
          livesPage.clear();
        }
        lpl = response.data['meta']['pagination']['pages'];

        livesPage.addAll(
            ((response.data as Map<String, dynamic>)['results'] as List)
                .map((e) => ResultHomeDTO.fromJson(e as Map<String, dynamic>))
                .toList());
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
  Future<bool> postImamService({required List<int> id}) async {
    try {
      final response = await dio.post(
        '${EndPoints.imamServices}/google_form/',
        data: {
          'imam_services': id,
        },
      );
      log(response.statusCode.toString());
      return true;
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
          if (isSaved != null) 'is_saved': isSaved,
          if (search != null) 'search': search,
        },
      );
      if (response.statusCode == 200) {
        if (search != null && search.isNotEmpty) {
          seminarPage.clear();
        }
        lps = response.data['meta']['pagination']['pages'];

        seminarPage.addAll(
            ((response.data as Map<String, dynamic>)['results'] as List)
                .map((e) => ResultHomeDTO.fromJson(e as Map<String, dynamic>))
                .toList());
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
}
