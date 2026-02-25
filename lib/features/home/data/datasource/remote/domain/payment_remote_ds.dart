import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/exception.dart';
import 'package:nurlan_ustaz_flutter/core/platform/network_helper.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/card_model.dart';

abstract class PaymentRemoteDs {
  Future<List<CardDTO>> getCards({String? search});
  Future<String> getAddCardUrl();
  Future<void> setDefaultCard({required int cardId});
}

@Injectable(as: PaymentRemoteDs)
class PaymentRemoteDsImpl implements PaymentRemoteDs {
  PaymentRemoteDsImpl(this.dio);
  final Dio dio;

  @override
  Future<List<CardDTO>> getCards({String? search}) async {
    try {
      final response = await dio.get(EndPoints.cards);
      if (response.statusCode == 200) {
        return ((response.data as List)
                .map((e) => CardDTO.fromJson(e as Map<String, dynamic>))
                .toList());
      }
      throw 'ERROR';
    } on DioException catch (e) {
      throw ClientServerException(
        message: (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<String> getAddCardUrl() async {
    try {
      // Backend expects a valid HTTP(S) URL; custom scheme is rejected by URL validator.
      final baseUrl = Uri.parse(EndPoints.apiUrl).origin;
      final response = await dio.post(
        EndPoints.addCard,
        data: {'back_link': '$baseUrl/'},
      );
      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final redirectUrl = data['pg_redirect_url'];
        if (redirectUrl != null && redirectUrl.toString().isNotEmpty) {
          return redirectUrl.toString();
        }
        throw ClientServerException(message: 'No redirect URL in response');
      }
      throw ClientServerException(message: 'Failed to get add card URL');
    } on DioException catch (e) {
      throw ClientServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message']?.toString() ??
                e.message ??
                'Unknown error',
      );
    }
  }

  @override
  Future<void> setDefaultCard({required int cardId}) async {
    try {
      await dio.get('${EndPoints.cards}$cardId/set-default-card/');
    } on DioException catch (e) {
      throw ClientServerException(
        message: (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }
}
