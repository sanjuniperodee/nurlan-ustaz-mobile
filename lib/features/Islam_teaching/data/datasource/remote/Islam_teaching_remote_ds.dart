import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/excepteion.dart';
import 'package:nurlan_ustaz_flutter/core/platform/network_helper.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/ayat_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/namaz_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/names_of_Allah_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/pillars_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/result_teaching_dto.dart';

const _tag = 'IslamTeachingRemoteDS';

abstract class IslamTeachingRemoteDs {
  Future<AyatDTO> ayatOfDay();
  Future<ResultTeachingDTO> detailDua({required int id});
  Future<ResultTeachingDTO> detailIslamName({required int id});
  Future<bool> surahFavorite({required int id});
  Future<bool> duasFavorite({required int id});
  Future<bool> dhikrsFavorite({required int id});
  Future<bool> islamNamesFavorite({required int id});
  Future<List<NamazDTO>> ablutions({required String gender});
  Future<List<NamazDTO>> namazDetail({required String gender, required int id});
  Future<List<PillarsDTO>> prayerTimes({required String gender});
  Future<List<PillarsDTO>> pillars();
  Future<List<PillarsDTO>> fatwas();
  Future<List<ResultTeachingDTO>> sura(
      {String? search,
      bool? isSaved,
      int? currentPage,
      bool? isFirstCall = false});
  Future<List<ResultTeachingDTO>> islamNamesMan(
      {String? search,
      bool? isSaved,
      int? currentPage,
      bool? isFirstCall = false});
  Future<List<ResultTeachingDTO>> islamWoman(
      {String? search,
      bool? isSaved,
      int? currentPage,
      bool? isFirstCall = false});
  Future<List<ResultTeachingDTO>> dhikrs(
      {String? search,
      bool? isSaved,
      int? currentPage,
      bool? isFirstCall = false});
  Future<List<ResultTeachingDTO>> duas(
      {String? search,
      bool? isSaved,
      int? currentPage,
      bool? isFirstCall = false});
  Future<List<NamesOfAllahDTO>> namesOfAllah({
    String? search,
    bool? isSaved,
  });
}

@Injectable(as: IslamTeachingRemoteDs)
class IslamTeachingRemoteDsImpl extends IslamTeachingRemoteDs {
  IslamTeachingRemoteDsImpl(this.dio);

  final Dio dio;
  List<ResultTeachingDTO> islamNamesPageMan = [];
  List<ResultTeachingDTO> islamNamesPageWoman = [];
  List<ResultTeachingDTO> surahPage = [];
  List<ResultTeachingDTO> duasPage = [];
  List<ResultTeachingDTO> dhikrsPage = [];
  int? lpM;
  int? lpW;
  int? lpS;
  int? lpD;
  int? lpDh;
  @override
  Future<AyatDTO> ayatOfDay() async {
    try {
      final response = await dio.get(
        EndPoints.ayatOfDay,
      );
      return AyatDTO.fromJson(
        (response.data as Map<String, dynamic>),
      );
    } on DioException catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<ResultTeachingDTO> detailDua({required int id}) async {
    try {
      final response = await dio.get(
        '${EndPoints.duha}$id/',
      );
      return ResultTeachingDTO.fromJson(
        (response.data as Map<String, dynamic>),
      );
    } on DioException catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<ResultTeachingDTO> detailIslamName({required int id}) async {
    try {
      final response = await dio.get(
        '${EndPoints.muslimNames}$id/',
      );
      return ResultTeachingDTO.fromJson(
        (response.data as Map<String, dynamic>),
      );
    } on DioException catch (e) {
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
    } on DioException catch (e) {
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
    } on DioException catch (e) {
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
    } on DioException catch (e) {
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
    } on DioException catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<List<PillarsDTO>> prayerTimes({required String gender}) async {
    try {
      final response = await dio
          .get(EndPoints.prayerTimes, queryParameters: {'gender': gender});
      return ((response.data as List<dynamic>))
          .map((e) => PillarsDTO.fromJson(e))
          .toList();
    } on DioException catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<List<NamazDTO>> namazDetail(
      {required String gender, required int id}) async {
    try {
      final response = await dio.get('${EndPoints.prayerTimes}$id/prayers/',
          queryParameters: {'gender': gender});
      return ((response.data as List<dynamic>))
          .map((e) => NamazDTO.fromJson(e))
          .toList();
    } on DioException catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<List<NamazDTO>> ablutions({required String gender}) async {
    try {
      final response = await dio
          .get(EndPoints.ablutions, queryParameters: {'gender': gender});
      return ((response.data as List<dynamic>))
          .map((e) => NamazDTO.fromJson(e))
          .toList();
    } on DioException catch (e) {
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
    } on DioException catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<List<ResultTeachingDTO>> sura(
      {String? search,
      bool? isSaved,
      int? currentPage,
      bool? isFirstCall = false}) async {
    try {
      if (isFirstCall ?? false) {
        surahPage.clear();
      }
      if (lpS != null && currentPage! >= lpS! && currentPage != 1) {
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
        if (search != null && search.isNotEmpty) {
          surahPage.clear();
        }
        lpS = response.data['meta']['pagination']['pages'];

        surahPage.addAll(((response.data as Map<String, dynamic>)['results']
                as List)
            .map((e) => ResultTeachingDTO.fromJson(e as Map<String, dynamic>))
            .toList());
        return surahPage;
      }
      // log('PAGE${response.data['meta']['pagination']['page']}');
      throw 'ERROR';
    } on DioException catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<List<ResultTeachingDTO>> islamNamesMan(
      {String? search,
      bool? isSaved,
      int? currentPage,
      bool? isFirstCall = false}) async {
    try {
      if (isFirstCall ?? false) {
        islamNamesPageMan.clear();
      }
      if (lpM != null && currentPage! >= lpM! && currentPage != 1) {
        return islamNamesPageMan;
      }
      final response = await dio.get(
        EndPoints.muslimNames,
        queryParameters: {
          if (currentPage != null) 'page[number]': currentPage,
          'page[size]': 6,
          if (isSaved != null) 'is_saved': isSaved,
          if (search != null) 'search': search,
          'gender': 'M',
        },
      );
      log(response.data.toString());
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        if (search != null && search.isNotEmpty) {
          islamNamesPageMan.clear();
        }
        // log(response.data.toString());
        lpM = response.data['meta']['pagination']['pages'];
        // log('CP${currentPage.toString()}');
        // log('LP${lp.toString()}');
        // log('LISTLENGTH${islamNamesPage.length.toString()}');
        // if (currentPage! >= lp && currentPage != 1) {
        //   return islamNamesPage;
        // }

        islamNamesPageMan.addAll(((response.data
                as Map<String, dynamic>)['results'] as List)
            .map((e) => ResultTeachingDTO.fromJson(e as Map<String, dynamic>))
            .toList());
        return islamNamesPageMan;
      }
      log(response.data);
      // log('PAGE${response.data['meta']['pagination']['page']}');
      throw 'ERROR';
    } on DioException catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<List<ResultTeachingDTO>> islamWoman(
      {String? search,
      bool? isSaved,
      int? currentPage,
      bool? isFirstCall = false}) async {
    try {
      if (isFirstCall ?? false) {
        islamNamesPageWoman.clear();
      }
      if (lpW != null && currentPage! >= lpW! && currentPage != 1) {
        return islamNamesPageWoman;
      }
      final response = await dio.get(
        EndPoints.muslimNames,
        queryParameters: {
          if (currentPage != null) 'page[number]': currentPage,
          'page[size]': 6,
          if (isSaved != null) 'is_saved': isSaved,
          if (search != null) 'search': search,
          'gender': 'F',
        },
      );
      log(response.data.toString());
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        if (search != null && search.isNotEmpty) {
          islamNamesPageWoman.clear();
        }
        // log(response.data.toString());
        lpW = response.data['meta']['pagination']['pages'];
        // log('CP${currentPage.toString()}');
        // log('LP${lp.toString()}');
        // log('LISTLENGTH${islamNamesPage.length.toString()}');
        // if (currentPage! >= lp && currentPage != 1) {
        //   return islamNamesPage;
        // }

        islamNamesPageWoman.addAll(((response.data
                as Map<String, dynamic>)['results'] as List)
            .map((e) => ResultTeachingDTO.fromJson(e as Map<String, dynamic>))
            .toList());
        return islamNamesPageWoman;
      }
      log(response.data);
      // log('PAGE${response.data['meta']['pagination']['page']}');
      throw 'ERROR';
    } on DioException catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<List<ResultTeachingDTO>> dhikrs(
      {String? search,
      bool? isSaved,
      int? currentPage,
      bool? isFirstCall = false}) async {
    try {
      if (isFirstCall ?? false) {
        dhikrsPage.clear();
      }
      if (lpDh != null && currentPage! >= lpDh! && currentPage != 1) {
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
        if (search != null && search.isNotEmpty) {
          dhikrsPage.clear();
        }
        lpDh = response.data['meta']['pagination']['pages'];

        dhikrsPage.addAll(((response.data as Map<String, dynamic>)['results']
                as List)
            .map((e) => ResultTeachingDTO.fromJson(e as Map<String, dynamic>))
            .toList());
        return dhikrsPage;
      }
      // log('PAGE${response.data['meta']['pagination']['page']}');
      throw 'ERROR';
    } on DioException catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<List<ResultTeachingDTO>> duas(
      {String? search,
      bool? isSaved,
      int? currentPage,
      bool? isFirstCall = false}) async {
    try {
      if (isFirstCall ?? false) {
        duasPage.clear();
      }
      if (lpD != null && currentPage! >= lpD! && currentPage != 1) {
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
        if (search != null && search.isNotEmpty) {
          duasPage.clear();
        }
        lpD = response.data['meta']['pagination']['pages'];

        duasPage.addAll(((response.data as Map<String, dynamic>)['results']
                as List)
            .map((e) => ResultTeachingDTO.fromJson(e as Map<String, dynamic>))
            .toList());
        return duasPage;
      }
      // log('PAGE${response.data['meta']['pagination']['page']}');
      throw 'ERROR';
    } on DioException catch (e) {
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
    } on DioException catch (e) {
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
    } on DioException catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }
}
