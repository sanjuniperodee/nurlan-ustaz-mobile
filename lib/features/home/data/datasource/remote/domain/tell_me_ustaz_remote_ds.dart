import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/exception.dart';
import 'package:nurlan_ustaz_flutter/core/platform/dio_helper.dart';
import 'package:nurlan_ustaz_flutter/core/platform/network_helper.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/ustaz_aitinizhi/data/models/chat_model.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/ustaz_aitinizhi/data/models/question_model.dart';

abstract class TellMeUstazRemoteDs {
  Future<List<ChatDTO>> chats({
    required String startTime,
    required String endTime,
  });
  Future<List<QuestionDTO>> questions({
    int? currentPage,
    String? search,
    required int id,
    bool? isFirstCall = false,
  });
}

@Injectable(as: TellMeUstazRemoteDs)
class TellMeUstazRemoteDsImpl implements TellMeUstazRemoteDs {
  TellMeUstazRemoteDsImpl(this.dio);
  final Dio dio;

  @override
  Future<List<ChatDTO>> chats({
    required String startTime,
    required String endTime,
  }) async {
    try {
      final response = await dio.get(
        '${EndPoints.chats}/?start_date=$startTime&end_date=$endTime',
        // Если токен битый, не даём экрану упасть – просто вернём пустой список.
        options: DioHelperMixin.skipAuthOption,
      );
      if (response.statusCode == 200) {
        final data = response.data;
        if (data == null) {
          // Нет чатов за выбранный период – возвращаем пустой список без ошибок.
          return <ChatDTO>[];
        }
        if (data is List) {
          return data
              .map((e) => ChatDTO.fromJson(e as Map<String, dynamic>))
              .toList();
        }
        if (data is Map<String, dynamic> && data['results'] is List) {
          return (data['results'] as List)
              .map((e) => ChatDTO.fromJson(e as Map<String, dynamic>))
              .toList();
        }
        throw ClientServerException(
          message: 'Unexpected tell‑me‑ustaz chats response format',
        );
      }
      throw 'ERROR';
    } on DioException catch (e) {
      throw ClientServerException(
        message: (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<List<QuestionDTO>> questions({
    int? currentPage,
    String? search,
    required int id,
    bool? isFirstCall = false,
  }) async {
    try {
      final response = await dio.get(
        '${EndPoints.chats}$id/questions/',
        queryParameters: {
          if (search != null) 'search': search,
          'page[number]': 1,
          'page[size]': 100,
        },
      );
      if (response.statusCode == 200) {
        final responseBody = response.data as Map<String, dynamic>;
        return (responseBody['results'] as List)
            .map((e) => QuestionDTO.fromJson(e as Map<String, dynamic>))
            .toList();
      }
      throw 'ERROR';
    } on DioException catch (e) {
      throw ClientServerException(
        message: (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }
}
