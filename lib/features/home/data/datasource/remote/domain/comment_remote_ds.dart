import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/exception.dart';
import 'package:nurlan_ustaz_flutter/core/platform/network_helper.dart';

abstract class CommentRemoteDs {
  Future<bool> commentReport({required int id, required String reason});
}

@Injectable(as: CommentRemoteDs)
class CommentRemoteDsImpl implements CommentRemoteDs {
  CommentRemoteDsImpl(this.dio);
  final Dio dio;

  @override
  Future<bool> commentReport({required int id, required String reason}) async {
    try {
      await dio.post(EndPoints.commentReport, data: {
        'comment': id,
        'reason': reason,
      });
      return true;
    } on DioException catch (e) {
      throw ClientServerException(
        message: (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }
}
