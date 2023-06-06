import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/excepteion.dart';
import 'package:nurlan_ustaz_flutter/core/platform/dio_wrapper.dart';
import 'package:nurlan_ustaz_flutter/core/platform/network_helper.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/ayat_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/names_of_Allah_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/pagination_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/pillars_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/result_teaching_dto.dart';

const _tag = 'IslamTeachingRemoteDS';

abstract class IslamTeachingRemoteDs {
  Future<AyatDTO> ayatOfDay();
  Future<bool> surahFavorite({required int id});
  Future<bool> duasFavorite({required int id});
  Future<bool> dhikrsFavorite({required int id});
  Future<bool> islamNamesFavorite({required int id});
  Future<List<PillarsDTO>> pillars();
  Future<List<PillarsDTO>> fatwas();
  Future<List<ResultTeachingDTO>> sura(
      {String? search, bool? isSaved, int? currentPage});
  Future<List<ResultTeachingDTO>> islamNames(
      {String? search, bool? isSaved, String? gender, int? currentPage});
  Future<List<ResultTeachingDTO>> dhikrs(
      {String? search, bool? isSaved, int? currentPage});
  Future<List<ResultTeachingDTO>> duas(
      {String? search, bool? isSaved, int? currentPage});
  Future<List<NamesOfAllahDTO>> namesOfAllah({
    String? search,
    bool? isSaved,
  });
}

@Injectable(as: IslamTeachingRemoteDs)
class IslamTeachingRemoteDsImpl extends IslamTeachingRemoteDs {
  late final Dio dio;
  final DioWrapper dioWrapper;
  IslamTeachingRemoteDsImpl(this.dioWrapper) {
    dioWrapper.path('');
    dio = dioWrapper.dio;
  }
  List<ResultTeachingDTO> islamNamesPage = [];
  List<ResultTeachingDTO> surahPage = [];
  List<ResultTeachingDTO> duasPage = [];
  List<ResultTeachingDTO> dhikrsPage = [];
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
  Future<List<ResultTeachingDTO>> sura(
      {String? search, bool? isSaved, int? currentPage}) async {
    try {
      if (lp != null && currentPage! >= lp! && currentPage != 1) {
        return surahPage;
      }
      final response = await dio.get(
        EndPoints.surahs,
        queryParameters: {
          'page[number]': currentPage,
          // 'page[size]': 6,
          if (isSaved != null) 'is_saved': isSaved,
          if (search != null) 'search': search,
        },
      );
      if (response.statusCode == 200) {
        lp = response.data['meta']['pagination']['pages'];

        // if (currentPage! > lp && currentPage != 1) {
        //   return surahPage;
        // }

        surahPage.addAll(((response.data as Map<String, dynamic>)['results']
                as List)
            .map((e) => ResultTeachingDTO.fromJson(e as Map<String, dynamic>))
            .toList());
        return surahPage;
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

  int? lp;
  @override
  Future<List<ResultTeachingDTO>> islamNames(
      {String? search, bool? isSaved, String? gender, int? currentPage}) async {
    try {
      if (lp != null && currentPage! >= lp! && currentPage != 1) {
        return islamNamesPage;
      }
      final response = await dio.get(
        EndPoints.muslimNames,
        queryParameters: {
          if (currentPage != null) 'page[number]': currentPage,
          'page[size]': 6,
          if (isSaved != null) 'is_saved': isSaved,
          if (search != null) 'search': search,
          if (gender != null) 'gender': gender,
        },
      );

      if (response.statusCode == 200) {
        // log(response.data.toString());
        lp = response.data['meta']['pagination']['pages'];
        // log('CP${currentPage.toString()}');
        // log('LP${lp.toString()}');
        // log('LISTLENGTH${islamNamesPage.length.toString()}');
        // if (currentPage! >= lp && currentPage != 1) {
        //   return islamNamesPage;
        // }

        islamNamesPage.addAll(((response.data
                as Map<String, dynamic>)['results'] as List)
            .map((e) => ResultTeachingDTO.fromJson(e as Map<String, dynamic>))
            .toList());
        return islamNamesPage;
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
  Future<List<ResultTeachingDTO>> dhikrs(
      {String? search, bool? isSaved, int? currentPage}) async {
    try {
      if (lp != null && currentPage! >= lp! && currentPage != 1) {
        return dhikrsPage;
      }
      final response = await dio.get(
        EndPoints.dhikrs,
        queryParameters: {
          'page[number]': currentPage,
          // 'page[size]': 6,
          if (isSaved != null) 'is_saved': isSaved,
          if (search != null) 'search': search,
        },
      );
      if (response.statusCode == 200) {
        lp = response.data['meta']['pagination']['pages'];

        dhikrsPage.addAll(((response.data as Map<String, dynamic>)['results']
                as List)
            .map((e) => ResultTeachingDTO.fromJson(e as Map<String, dynamic>))
            .toList());
        return dhikrsPage;
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
  Future<List<ResultTeachingDTO>> duas(
      {String? search, bool? isSaved, int? currentPage}) async {
    try {
      if (lp != null && currentPage! >= lp! && currentPage != 1) {
        return duasPage;
      }
      final response = await dio.get(
        EndPoints.duha,
        queryParameters: {
          'page[number]': currentPage,
          // 'page[size]': 6,
          if (isSaved != null) 'is_saved': isSaved,
          if (search != null) 'search': search,
        },
      );

      if (response.statusCode == 200) {
        lp = response.data['meta']['pagination']['pages'];

        duasPage.addAll(((response.data as Map<String, dynamic>)['results']
                as List)
            .map((e) => ResultTeachingDTO.fromJson(e as Map<String, dynamic>))
            .toList());
        return duasPage;
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
