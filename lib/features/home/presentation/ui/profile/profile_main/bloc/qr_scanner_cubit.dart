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
      : super(const QrScannerState.initialState());
  final HomeRepository _homeRepository;
  final SharedPreferences sharedPreferences;

  Future<void> checkTicket({required String url}) async {
    emit(const _LoadingState());
    if(!url.contains('https://dev.nurlanustaz.kz/api/banner/use-ticket')){
      emit(const _ErrorState(message: 'Произошла ошибка при сканировании QR-кода'));
      emit(const _InitialState());
    }
    else{
      final result = await _homeRepository.checkTicket(url: url);
      return result.fold((l) {
        emit(_ErrorState(message: 'QR.qr_success'.tr()));
        emit(const _InitialState());
      }, (r) {
        emit(_LoadedState(message: 'QR.qr_failed'.tr()));
        emit(const _InitialState());

      });
    }

  }
}

@freezed
class QrScannerState with _$QrScannerState {
  const factory QrScannerState.initialState() = _InitialState;

  const factory QrScannerState.loadedState({ required String message}) = _LoadedState;

  const factory QrScannerState.loadingState() = _LoadingState;

  const factory QrScannerState.errorState({
    required String message,
  }) = _ErrorState;
}
