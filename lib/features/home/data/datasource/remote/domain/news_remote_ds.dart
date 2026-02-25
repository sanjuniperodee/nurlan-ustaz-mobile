import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/data/dio_error_helper.dart';
import 'package:nurlan_ustaz_flutter/core/data/json_api_response_parser.dart';
import 'package:nurlan_ustaz_flutter/core/data/paginated_response.dart';
import 'package:nurlan_ustaz_flutter/core/error/exception.dart';
import 'package:nurlan_ustaz_flutter/core/platform/dio_helper.dart';
import 'package:nurlan_ustaz_flutter/core/platform/network_helper.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';

abstract class NewsRemoteDs {
  Future<ResultHomeDTO> newsDetail({required int id});
  Future<bool> newsFavorite({required int id});
  Future<bool> newsLike({required int id});
  Future<PaginatedResponse<ResultHomeDTO>> newsPage({
    String? search,
    bool? isSaved,
    required int page,
  });
  Future<List<ResultHomeDTO>> newsMain({bool? isSaved, int? currentPage});
  Future<PaginatedResponse<ResultHomeDTO>> commentNewsPage({
    required int id,
    required int page,
  });
  Future<bool> commentNewsPost({
    required int id,
    int? commentId,
    required String body,
  });
  Future<bool> commentNewsLike({required int id, required int commentId});
}

@Injectable(as: NewsRemoteDs)
class NewsRemoteDsImpl implements NewsRemoteDs {
  NewsRemoteDsImpl(this.dio);
  final Dio dio;

  @override
  Future<ResultHomeDTO> newsDetail({required int id}) async {
    try {
      final response = await dio.get(
        '${EndPoints.news}$id/',
        // Детальная новость должна быть доступна без авторизации.
        options: DioHelperMixin.skipAuthOption,
      );
      return ResultHomeDTO.fromJson(
        (response.data as Map<String, dynamic>),
      );
    } on DioException catch (e) {
      handleDioError(e);
    }
  }

  @override
  Future<bool> newsFavorite({required int id}) async {
    try {
      await dio.post('${EndPoints.news}$id/toggle_save/');
      return true;
    } on DioException catch (e) {
      throw ClientServerException(
        message: (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<bool> newsLike({required int id}) async {
    try {
      await dio.post('${EndPoints.news}$id/toggle_like/');
      return true;
    } on DioException catch (e) {
      throw ClientServerException(
        message: (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<PaginatedResponse<ResultHomeDTO>> newsPage({
    String? search,
    bool? isSaved,
    required int page,
  }) async {
    try {
      final response = await dio.get(
        EndPoints.news,
        // Список новостей (публичный) – не должен падать из‑за битого токена.
        options: DioHelperMixin.skipAuthOption,
        queryParameters: {
          'page[number]': page,
          if (isSaved != null) 'is_saved': isSaved,
          if (search != null) 'search': search,
        },
      );
      if (response.statusCode == 200) {
        return JsonApiResponseParser.parsePaginated(
          response.data as Map<String, dynamic>,
          ResultHomeDTO.fromJson,
        );
      }
      throw 'ERROR';
    } on DioException catch (e) {
      handleDioError(e);
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
        // Главная страница должна открываться даже с просроченным/битым токеном.
        // Это публичный эндпоинт, поэтому помечаем запрос как skipAuth,
        // чтобы AuthInterceptor не подставлял Authorization и не ловил 401.
        options: DioHelperMixin.skipAuthOption,
        queryParameters: {
          'page[number]': currentPage,
          if (isSaved != null) 'is_saved': isSaved,
        },
      );
      return ((response.data as Map<String, dynamic>)['results'] as List)
          .map((x) => ResultHomeDTO.fromJson(x as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw ClientServerException(
        message: (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<PaginatedResponse<ResultHomeDTO>> commentNewsPage({
    required int id,
    required int page,
  }) async {
    try {
      final response = await dio.get(
        '${EndPoints.news}$id/comments/',
        queryParameters: {'page[number]': page},
      );
      if (response.statusCode == 200) {
        return JsonApiResponseParser.parsePaginated(
          response.data as Map<String, dynamic>,
          ResultHomeDTO.fromJson,
        );
      }
      throw 'ERROR';
    } on DioException catch (e) {
      handleDioError(e);
    }
  }

  @override
  Future<bool> commentNewsPost({
    required int id,
    int? commentId,
    required String body,
  }) async {
    try {
      await dio.post('${EndPoints.news}$id/comment/', data: {
        if (commentId != null) 'parent': commentId,
        'body': body,
      });
      return true;
    } on DioException catch (e) {
      throw ClientServerException(
        message: (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<bool> commentNewsLike({
    required int id,
    required int commentId,
  }) async {
    try {
      await dio.post('${EndPoints.news}$id/toggle_like_comment/', data: {
        'comment': commentId,
      });
      return true;
    } on DioException catch (e) {
      throw ClientServerException(
        message: (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }
}
