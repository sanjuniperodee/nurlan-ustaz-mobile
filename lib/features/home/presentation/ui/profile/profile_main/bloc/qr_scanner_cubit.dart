import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/repositories/auth_repository.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'qr_scanner_cubit.freezed.dart';

@singleton
class QrScannerCubit extends Cubit<QrScannerState> {
  QrScannerCubit(this._homeRepository, this.sharedPreferences, this._authRepo)
      : super(const QrScannerState.initialState());
  final AuthRepository _authRepo;
  final HomeRepository _homeRepository;
  final SharedPreferences sharedPreferences;

  Future<void> checkTicket({required String url}) async {
    emit(_LoadingState());
    if(!url.contains('https://dev.nurlanustaz.kz/api/banner/use-ticket')){
      emit(_ErrorState(message: 'Произошла ошибка при сканировании QR-кода'));
      emit(_InitialState());
    }
    else{
      final result = await _homeRepository.checkTicket(url: url);
      return result.fold((l) {
        emit(_ErrorState(message: 'QR.qr_success'.tr()));
        emit(_InitialState());
      }, (r) {
        emit(_LoadedState(message: 'QR.qr_failed'.tr()));
        emit(_InitialState());

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
