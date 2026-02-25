import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/data/dio_error_helper.dart';
import 'package:nurlan_ustaz_flutter/core/data/json_api_response_parser.dart';
import 'package:nurlan_ustaz_flutter/core/data/paginated_response.dart';
import 'package:nurlan_ustaz_flutter/core/platform/network_helper.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';

abstract class CharityRemoteDs {
  Future<PaginatedResponse<ResultHomeDTO>> charitiesPage({required int page});
}

@Injectable(as: CharityRemoteDs)
class CharityRemoteDsImpl implements CharityRemoteDs {
  CharityRemoteDsImpl(this.dio);
  final Dio dio;

  @override
  Future<PaginatedResponse<ResultHomeDTO>> charitiesPage({
    required int page,
  }) async {
    try {
      final response = await dio.get(
        EndPoints.charities,
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
}
