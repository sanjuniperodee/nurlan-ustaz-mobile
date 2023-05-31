import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/excepteion.dart';
import 'package:nurlan_ustaz_flutter/core/platform/dio_wrapper.dart';
import 'package:nurlan_ustaz_flutter/core/platform/network_helper.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/ayat_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/pillars_dto.dart';

const _tag = 'IslamTeachingRemoteDS';

abstract class IslamTeachingRemoteDs {
  Future<AyatDTO> ayatOfDay();
  Future<List<PillarsDTO>> pillars();
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
}
