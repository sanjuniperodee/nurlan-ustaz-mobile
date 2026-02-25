import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/platform/dio_helper.dart';
import 'package:nurlan_ustaz_flutter/core/data/dio_error_helper.dart';
import 'package:nurlan_ustaz_flutter/core/data/json_api_response_parser.dart';
import 'package:nurlan_ustaz_flutter/core/data/paginated_response.dart';
import 'package:nurlan_ustaz_flutter/core/error/exception.dart';
import 'package:nurlan_ustaz_flutter/core/platform/cache_helper/prefs.dart';
import 'package:nurlan_ustaz_flutter/core/platform/network_helper.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/faq_model_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/geonames_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/media_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/notification_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/timings_dto.dart';

abstract class HomeMiscRemoteDs {
  Future<List<FaqModelDTO>> faq();
  Future<List<GeonamesDTO>> geoNames({required String name});
  Future<NotificationDTO> setCity({required GeonamesDTO geo});
  Future<TimingsDTO> timings({required double lat, required double long});
  Future<List<ResultHomeDTO>> projectInfo();
  Future<List<ResultHomeDTO>> partners();
  Future<String> postImamService({required List<int> id});
  Future<PaginatedResponse<MediaDTO>> servicesPage({required int page});
  Future<String> checkTicket({required String url});
}

@Injectable(as: HomeMiscRemoteDs)
class HomeMiscRemoteDsImpl implements HomeMiscRemoteDs {
  HomeMiscRemoteDsImpl(this.dio);
  final Dio dio;

  @override
  Future<List<FaqModelDTO>> faq() async {
    try {
      final response = await dio.get(EndPoints.faq);
      return ((response.data as Map<String, dynamic>)['results'] as List)
          .map((x) => FaqModelDTO.fromJson(x as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw ClientServerException(
        message: (e.response!.data as Map<String, dynamic>)['message'] as String,
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
    } on DioException catch (e) {
      throw ClientServerException(
        message: (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<NotificationDTO> setCity({required GeonamesDTO geo}) async {
    try {
      final prefs = Prefs();
      final String? dev = await prefs.getDeviceToken();
      final response = await dio.post('${EndPoints.setCity}$dev/set_city/', data: {
        'city_name': geo.name,
        'country_name': geo.countryName,
        'latitude': geo.lat,
        'longitude': geo.lng,
      });
      return NotificationDTO.fromJson((response.data as Map<String, dynamic>));
    } on DioException catch (e) {
      throw ClientServerException(
        message: (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<TimingsDTO> timings({
    required double lat,
    required double long,
  }) async {
    try {
      final response = await dio.post(
        EndPoints.timings,
        data: {'latitude': lat, 'longitude': long},
        options: DioHelperMixin.skipAuthOption,
      );
      final data = response.data;
      if (data is! Map<String, dynamic>) {
        throw ClientServerException(message: 'Invalid response format');
      }
      final inner = data['data'] as Map<String, dynamic>?;
      final timingsMap = inner?['timings'] as Map<String, dynamic>?;
      if (timingsMap == null) {
        throw ClientServerException(
          message:
              (data['message'] as String?) ?? (data['status'] as String?) ?? 'Failed to fetch timings',
        );
      }
      return TimingsDTO.fromJson(timingsMap);
    } on DioException catch (e) {
      if (e.error is ServerException) {
        rethrow;
      }
      String? msg;
      if (e.response?.data is Map<String, dynamic>) {
        final d = e.response!.data as Map<String, dynamic>;
        msg = d['message']?.toString() ?? d['detail']?.toString();
      }
      throw ClientServerException(
        message: msg ?? e.message ?? 'Ошибка загрузки времени намаза',
      );
    }
  }

  @override
  Future<List<ResultHomeDTO>> projectInfo() async {
    try {
      final response = await dio.get(EndPoints.prjInfo);
      return ((response.data as List<dynamic>))
          .map((e) => ResultHomeDTO.fromJson(e))
          .toList();
    } on DioException catch (e) {
      throw ClientServerException(
        message: (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<List<ResultHomeDTO>> partners() async {
    try {
      final response = await dio.get(EndPoints.partners);
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
  Future<String> postImamService({required List<int> id}) async {
    try {
      final response = await dio.post(
        '${EndPoints.imamServices}/google_form/',
        data: {'imam_services': id},
      );
      return (response.data as Map<String, dynamic>)['url'] as String;
    } on DioException catch (e) {
      throw ClientServerException(
        message: (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<PaginatedResponse<MediaDTO>> servicesPage({required int page}) async {
    try {
      final response = await dio.get(
        EndPoints.imamServices,
        queryParameters: {'page[number]': page},
      );
      if (response.statusCode == 200) {
        return JsonApiResponseParser.parsePaginated(
          response.data as Map<String, dynamic>,
          MediaDTO.fromJson,
        );
      }
      throw 'ERROR';
    } on DioException catch (e) {
      handleDioError(e);
    }
  }

  @override
  Future<String> checkTicket({required String url}) async {
    try {
      final response = await dio.get(url);
      return response.data.toString();
    } on DioException catch (e) {
      throw ClientServerException(
        message: e.response!.data.toString(),
      );
    }
  }
}
