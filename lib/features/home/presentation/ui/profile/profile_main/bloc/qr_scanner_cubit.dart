import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'qr_scanner_cubit.freezed.dart';

@singleton
class QrScannerCubit extends Cubit<QrScannerState> {
  QrScannerCubit(this._homeRepository, this.sharedPreferences)
      : super(const QrScannerState.initial());
  final HomeRepository _homeRepository;
  final SharedPreferences sharedPreferences;

  Future<void> checkTicket({required String url}) async {
    emit(const QrScannerState.loading());
    if (!url.contains('https://dev.nurlanustaz.kz/api/banner/use-ticket')) {
      emit(const QrScannerState.error(
          message: 'Произошла ошибка при сканировании QR-кода'));
      emit(const QrScannerState.initial());
    } else {
      final result = await _homeRepository.checkTicket(url: url);
      return result.fold((l) {
        emit(QrScannerState.error(message: 'QR.qr_success'.tr()));
        emit(const QrScannerState.initial());
      }, (r) {
        emit(QrScannerState.loaded(message: 'QR.qr_failed'.tr()));
        emit(const QrScannerState.initial());
      });
    }
  }
}

@freezed
sealed class QrScannerState with _$QrScannerState {
  const factory QrScannerState.initial() = QrScannerInitialState;
  const factory QrScannerState.loaded({required String message}) =
      QrScannerLoadedState;
  const factory QrScannerState.loading() = QrScannerLoadingState;
  const factory QrScannerState.error({
    required String message,
  }) = QrScannerErrorState;
}
