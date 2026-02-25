import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/data/dio_error_helper.dart';
import 'package:nurlan_ustaz_flutter/core/data/json_api_response_parser.dart';
import 'package:nurlan_ustaz_flutter/core/data/paginated_response.dart';
import 'package:nurlan_ustaz_flutter/core/error/exception.dart';
import 'package:nurlan_ustaz_flutter/core/platform/network_helper.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';

abstract class LivesRemoteDs {
  Future<PaginatedResponse<ResultHomeDTO>> livesPage({
    String? search,
    bool? isSaved,
    required int page,
  });
  Future<bool> livesFavorite({required int id});
}

@Injectable(as: LivesRemoteDs)
class LivesRemoteDsImpl implements LivesRemoteDs {
  LivesRemoteDsImpl(this.dio);
  final Dio dio;

  @override
  Future<PaginatedResponse<ResultHomeDTO>> livesPage({
    String? search,
    bool? isSaved,
    required int page,
  }) async {
    try {
      final response = await dio.get(
        EndPoints.lives,
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
  Future<bool> livesFavorite({required int id}) async {
    try {
      await dio.post('${EndPoints.lives}$id/toggle_save/');
      return true;
    } on DioException catch (e) {
      throw ClientServerException(
        message: (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }
}
