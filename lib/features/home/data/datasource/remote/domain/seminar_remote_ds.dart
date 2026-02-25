import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/data/dio_error_helper.dart';
import 'package:nurlan_ustaz_flutter/core/data/json_api_response_parser.dart';
import 'package:nurlan_ustaz_flutter/core/data/paginated_response.dart';
import 'package:nurlan_ustaz_flutter/core/error/exception.dart';
import 'package:nurlan_ustaz_flutter/core/model/freedom_payment_dto.dart';
import 'package:nurlan_ustaz_flutter/core/platform/network_helper.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';

abstract class SeminarRemoteDs {
  Future<ResultHomeDTO> seminarDetail({required int id});
  Future<bool> seminarFavorite({required int id});
  Future<bool> seminarLike({required int id});
  Future<PaginatedResponse<ResultHomeDTO>> seminarPage({
    String? search,
    bool? isSaved,
    bool? isPurchased,
    required int page,
  });
  Future<PaginatedResponse<ResultHomeDTO>> commentSeminarPage({
    required int id,
    required int page,
  });
  Future<bool> commentSemPost({
    required int id,
    int? commentId,
    required String body,
  });
  Future<bool> commentSemLike({required int id, required int commentId});
  Future<FreedomPaymentDTO> createSeminarPayment({
    required int id,
    required String backUrl,
  });
}

@Injectable(as: SeminarRemoteDs)
class SeminarRemoteDsImpl implements SeminarRemoteDs {
  SeminarRemoteDsImpl(this.dio);
  final Dio dio;

  @override
  Future<ResultHomeDTO> seminarDetail({required int id}) async {
    try {
      final response = await dio.get('${EndPoints.seminar}$id/');
      return ResultHomeDTO.fromJson(
        (response.data as Map<String, dynamic>),
      );
    } on DioException catch (e) {
      throw ClientServerException(
        message: (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<bool> seminarFavorite({required int id}) async {
    try {
      await dio.post('${EndPoints.seminar}$id/toggle_save/');
      return true;
    } on DioException catch (e) {
      throw ClientServerException(
        message: (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<bool> seminarLike({required int id}) async {
    try {
      await dio.post('${EndPoints.seminar}$id/toggle_like/');
      return true;
    } on DioException catch (e) {
      throw ClientServerException(
        message: (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<PaginatedResponse<ResultHomeDTO>> seminarPage({
    String? search,
    bool? isSaved,
    bool? isPurchased,
    required int page,
  }) async {
    try {
      final response = await dio.get(
        EndPoints.seminar,
        queryParameters: {
          'page[number]': page,
          if (isPurchased != null) 'is_purchased': isPurchased,
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
  Future<PaginatedResponse<ResultHomeDTO>> commentSeminarPage({
    required int id,
    required int page,
  }) async {
    try {
      final response = await dio.get(
        '${EndPoints.seminar}$id/comments/',
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
  Future<bool> commentSemPost({
    required int id,
    int? commentId,
    required String body,
  }) async {
    try {
      await dio.post('${EndPoints.seminar}$id/comment/', data: {
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
  Future<bool> commentSemLike({
    required int id,
    required int commentId,
  }) async {
    try {
      await dio.post('${EndPoints.seminar}$id/toggle_like_comment/', data: {
        'comment': commentId,
      });
      return true;
    } on DioException catch (e) {
      throw ClientServerException(
        message: (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<FreedomPaymentDTO> createSeminarPayment({
    required int id,
    required String backUrl,
  }) async {
    try {
      final response = await dio.post(
        '${EndPoints.seminar}$id/init_purchase/',
        data: {'back_url': backUrl},
      );
      final data = Map<String, dynamic>.from(response.data as Map);
      if (data['pg_payment_id'] != null) {
        data['pg_payment_id'] = data['pg_payment_id'].toString();
      }
      return FreedomPaymentDTO.fromJson(data);
    } on DioException catch (e) {
      throw ClientServerException(
        message: (e.response!.data as Map<String, dynamic>)['message'].toString(),
      );
    }
  }
}
