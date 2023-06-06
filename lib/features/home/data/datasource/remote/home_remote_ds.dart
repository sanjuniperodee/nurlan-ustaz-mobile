import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/excepteion.dart';
import 'package:nurlan_ustaz_flutter/core/platform/dio_wrapper.dart';
import 'package:nurlan_ustaz_flutter/core/platform/network_helper.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';

const _tag = 'HomeRemoteDS';

abstract class HomeRemoteDs {
  Future<List<ResultHomeDTO>> news(
      {String? search, bool? isSaved, int? currentPage});
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
  int? lp;

  @override
  Future<List<ResultHomeDTO>> news(
      {String? search, bool? isSaved, int? currentPage}) async {
    try {
      if (lp != null && currentPage! >= lp! && currentPage != 1) {
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
        lp = response.data['meta']['pagination']['pages'];

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
}
