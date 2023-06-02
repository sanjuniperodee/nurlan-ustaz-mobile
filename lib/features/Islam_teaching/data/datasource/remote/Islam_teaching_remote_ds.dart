import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/excepteion.dart';
import 'package:nurlan_ustaz_flutter/core/platform/dio_wrapper.dart';
import 'package:nurlan_ustaz_flutter/core/platform/network_helper.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/ayat_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/names_of_Allah_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/pillars_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/result_dto.dart';

const _tag = 'IslamTeachingRemoteDS';

abstract class IslamTeachingRemoteDs {
  Future<AyatDTO> ayatOfDay();
  Future<bool> surahFavorite({required int id});
  Future<bool> duasFavorite({required int id});
  Future<bool> dhikrsFavorite({required int id});
  Future<bool> islamNamesFavorite({required int id});
  Future<List<PillarsDTO>> pillars();
  Future<List<PillarsDTO>> fatwas();
  Future<List<ResultDTO>> sura({String? search, bool? isSaved});
  Future<List<ResultDTO>> islamNames({
    String? search,
    bool? isSaved,
    String? gender,
  });
  Future<List<ResultDTO>> dhikrs({String? search, bool? isSaved});
  Future<List<ResultDTO>> duas({String? search, bool? isSaved});
  Future<List<NamesOfAllahDTO>> namesOfAllah({String? search, bool? isSaved});
}

@Injectable(as: IslamTeachingRemoteDs)
class IslamTeachingRemoteDsImpl extends IslamTeachingRemoteDs {
  late final Dio dio;
  final DioWrapper dioWrapper;
  IslamTeachingRemoteDsImpl(this.dioWrapper) {
    dioWrapper.path('');
    dio = dioWrapper.dio;
  }

  @override
  Future<AyatDTO> ayatOfDay() async {
    try {
      final response = await dio.get(
        EndPoints.ayatOfDay,
      );
      return AyatDTO.fromJson(
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
  Future<bool> surahFavorite({required int id}) async {
    try {
      final response = await dio.post(
        '${EndPoints.surahs}/$id/toggle_save/',
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
  Future<bool> islamNamesFavorite({required int id}) async {
    try {
      final response = await dio.post(
        '${EndPoints.muslimNames}/$id/toggle_save/',
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
  Future<bool> dhikrsFavorite({required int id}) async {
    try {
      final response = await dio.post(
        '${EndPoints.dhikrs}/$id/toggle_save/',
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
  Future<bool> duasFavorite({required int id}) async {
    try {
      final response = await dio.post(
        '${EndPoints.duha}/$id/toggle_save/',
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
  Future<List<PillarsDTO>> pillars() async {
    try {
      final response = await dio.get(
        EndPoints.pillars,
      );
      return ((response.data as List<dynamic>))
          .map((e) => PillarsDTO.fromJson(e))
          .toList();
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<List<ResultDTO>> sura({String? search, bool? isSaved}) async {
    try {
      final response = await dio.get(
        EndPoints.surahs,
        queryParameters: {
          if (isSaved != null) 'is_saved': isSaved,
          if (search != null) 'search': search,
        },
      );
      return ((response.data as Map<String, dynamic>)['results'] as List)
          .map((e) => ResultDTO.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<List<ResultDTO>> islamNames(
      {String? search, bool? isSaved, String? gender}) async {
    try {
      final response = await dio.get(
        EndPoints.muslimNames,
        queryParameters: {
          if (isSaved != null) 'is_saved': isSaved,
          if (search != null) 'search': search,
          if (gender != null) 'gender': gender,
        },
      );
      return ((response.data as Map<String, dynamic>)['results'] as List)
          .map((e) => ResultDTO.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<List<ResultDTO>> dhikrs({String? search, bool? isSaved}) async {
    try {
      final response = await dio.get(
        EndPoints.dhikrs,
        queryParameters: {
          if (isSaved != null) 'is_saved': isSaved,
          if (search != null) 'search': search,
        },
      );
      return ((response.data as Map<String, dynamic>)['results'] as List)
          .map((e) => ResultDTO.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<List<ResultDTO>> duas({String? search, bool? isSaved}) async {
    try {
      final response = await dio.get(
        EndPoints.duha,
        queryParameters: {
          if (isSaved != null) 'is_saved': isSaved,
          if (search != null) 'search': search,
        },
      );
      return ((response.data as Map<String, dynamic>)['results'] as List)
          .map((e) => ResultDTO.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<List<PillarsDTO>> fatwas() async {
    try {
      final response = await dio.get(
        EndPoints.fatwas,
      );
      return ((response.data as List<dynamic>))
          .map((e) => PillarsDTO.fromJson(e))
          .toList();
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<List<NamesOfAllahDTO>> namesOfAllah(
      {String? search, bool? isSaved}) async {
    try {
      final response = await dio.get(
        EndPoints.namesOfAllah,
        queryParameters: {
          if (isSaved != null) 'is_saved': isSaved,
          if (search != null) 'search': search,
        },
      );
      return ((response.data as List<dynamic>))
          .map((e) => NamesOfAllahDTO.fromJson(e))
          .toList();
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }
}
