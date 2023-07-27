import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/excepteion.dart';
import 'package:nurlan_ustaz_flutter/core/model/freedom_payment_dto.dart';
import 'package:nurlan_ustaz_flutter/core/platform/dio_wrapper.dart';
import 'package:nurlan_ustaz_flutter/core/platform/network_helper.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/data/models/tus_zhoru_dto.dart';

abstract class TusZhoruRemoteDs {
  Future<List<TusZhoruDTO>> tusZhoru(
      {String? search,
      bool? isSaved,
      int? currentPage,
      bool? isPurchased,
      bool? isFirstCall = false});
  Future<List<ResultHomeDTO>> tusZhoruBay(
      {String? search,
      bool? isSaved,
      int? currentPage,
      bool? isPurchased,
      bool? isFirstCall = false});
  Future<List<TusZhoruDTO>> customTusZhoru(
      {String? search, int? currentPage, bool? isFirstCall = false});

  Future<TusZhoruDTO> createTusZhoru(
      {required String title, required String description});
  Future<FreedomPaymentDTO> createCustomTusZhoruPayment(
      {required int id, required String backUrl});
  Future<FreedomPaymentDTO> createTusZhoruPayment(
      {required int id, required String backUrl});
  Future<bool> tusZhoruFavorite({required int id});
  Future<TusZhoruDTO> getTusZhoruById({required int id});
  Future<TusZhoruDTO> getCustomTusZhoruById({required int id});
}

@Injectable(as: TusZhoruRemoteDs)
class TusZhoruRemoteDsImpl extends TusZhoruRemoteDs {
  late final Dio dio;
  final DioWrapper dioWrapper;

  TusZhoruRemoteDsImpl(this.dioWrapper) {
    dioWrapper.path('');
    dio = dioWrapper.dio;
  }

  int? lpc;
  int? lpb;
  int? lpp;
  List<ResultHomeDTO> tusZhoruListBay = [];
  List<TusZhoruDTO> tusZhoruList = [];
  List<TusZhoruDTO> customTusZhoruList = [];

  @override
  Future<List<ResultHomeDTO>> tusZhoruBay(
      {String? search,
      bool? isSaved,
      int? currentPage,
      bool? isPurchased,
      bool? isFirstCall = false}) async {
    try {
      if (isFirstCall ?? false) {
        tusZhoruListBay.clear();
      }
      if (lpb != null && currentPage! >= lpb! && currentPage != 1) {
        return tusZhoruListBay;
      }
      final response = await dio.get(
        EndPoints.tusZhoru,
        queryParameters: {
          'page[number]': currentPage,
          'page[size]': 10,
          if (isPurchased != null) 'is_purchased': isPurchased,
          if (isSaved != null) 'is_saved': isSaved,
          if (search != null) 'search': search,
        },
      );
      if (response.statusCode == 200) {
        if (search != null && search.isNotEmpty) {
          tusZhoruListBay.clear();
        }
        lpb = response.data['meta']['pagination']['pages'];

        tusZhoruListBay.addAll(
            ((response.data as Map<String, dynamic>)['results'] as List)
                .map((e) => ResultHomeDTO.fromJson(e as Map<String, dynamic>))
                .toList());
        return tusZhoruListBay;
      }
      // log('PAGE${response.data['meta']['pagination']['page']}');
      throw 'ERROR';
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response?.data as Map<String, dynamic>)['message'].toString(),
      );
    }
  }

  @override
  Future<List<TusZhoruDTO>> tusZhoru(
      {String? search,
      bool? isSaved,
      int? currentPage,
      bool? isPurchased,
      bool? isFirstCall = false}) async {
    try {
      if (isFirstCall ?? false) {
        tusZhoruList.clear();
      }
      if (lpc != null && currentPage! >= lpc! && currentPage != 1) {
        return tusZhoruList;
      }
      final response = await dio.get(
        EndPoints.tusZhoru,
        queryParameters: {
          'page[number]': currentPage,
          'page[size]': 100,
          if (isPurchased != null) 'is_purchased': isPurchased,
          if (isSaved != null) 'is_saved': isSaved,
          if (search != null) 'search': search,
        },
      );
      if (response.statusCode == 200) {
        if (search != null && search.isNotEmpty) {
          tusZhoruList.clear();
        }
        lpc = response.data['meta']['pagination']['pages'];

        tusZhoruList.addAll(
            ((response.data as Map<String, dynamic>)['results'] as List)
                .map((e) => TusZhoruDTO.fromJson(e as Map<String, dynamic>))
                .toList());
        return tusZhoruList;
      }
      // log('PAGE${response.data['meta']['pagination']['page']}');
      throw 'ERROR';
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response?.data as Map<String, dynamic>)['message'].toString(),
      );
    }
  }

  @override
  Future<List<TusZhoruDTO>> customTusZhoru(
      {String? search, int? currentPage, bool? isFirstCall = false}) async {
    try {
      if (isFirstCall ?? false) {
        customTusZhoruList.clear();
      }
      if (lpp != null && currentPage! >= lpp! && currentPage != 1) {
        return customTusZhoruList;
      }
      final response = await dio.get(
        EndPoints.customTusZhoru,
        queryParameters: {
          'page[number]': 1,
          'page[size]': 100,
          if (search != null) 'search': search,
        },
      );
      if (response.statusCode == 200) {
        if (search != null && search.isNotEmpty) {
          customTusZhoruList.clear();
        }
        lpp = response.data['meta']['pagination']['pages'];

        customTusZhoruList.addAll(
            ((response.data as Map<String, dynamic>)['results'] as List)
                .map((e) => TusZhoruDTO.fromJson(e as Map<String, dynamic>))
                .toList());
        return customTusZhoruList;
      }
      // log('PAGE${response.data['meta']['pagination']['page']}');
      throw 'ERROR';
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response?.data as Map<String, dynamic>)['message'].toString(),
      );
    }
  }

  @override
  Future<TusZhoruDTO> createTusZhoru(
      {required String title, required String description}) async {
    try {
      final response = await dio.post(
        EndPoints.customTusZhoru,
        data: {
          'title': title,
          'description': description,
        },
      );
      return TusZhoruDTO.fromJson(response.data);
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<FreedomPaymentDTO> createCustomTusZhoruPayment(
      {required int id,
      required String backUrl}) async {
    try {
      final response = await dio.post(
        '${EndPoints.customTusZhoru}/$id/init_purchase/',
        data: {
          'back_url': backUrl,
        },
      );
      return FreedomPaymentDTO.fromJson(response.data);
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'].toString(),
      );
    }
  }

  @override
  Future<FreedomPaymentDTO> createTusZhoruPayment(
      {required int id,
      required String backUrl}) async {
    try {
      final response = await dio.post(
        '${EndPoints.tusZhoru}/$id/init_purchase/',
        data: {
          'back_url': backUrl,
        },
      );
      return FreedomPaymentDTO.fromJson(response.data);
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'].toString(),
      );
    }
  }

  @override
  Future<bool> tusZhoruFavorite({required int id}) async {
    try {
      final response = await dio.post(
        '${EndPoints.tusZhoru}/$id/toggle_save/',
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
  Future<TusZhoruDTO> getTusZhoruById({required int id}) async {
    try {
      final response = await dio.get(
        '${EndPoints.tusZhoru}/$id/',
      );
      return TusZhoruDTO.fromJson(response.data);
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'].toString(),
      );
    }
  }

  @override
  Future<TusZhoruDTO> getCustomTusZhoruById({required int id}) async {
    try {
      final response = await dio.get(
        '${EndPoints.customTusZhoru}/$id/',
      );
      return TusZhoruDTO.fromJson(response.data);
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'].toString(),
      );
    }
  }
}
