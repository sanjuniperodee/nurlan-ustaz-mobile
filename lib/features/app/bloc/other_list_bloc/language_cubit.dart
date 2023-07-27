import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/repositories/auth_repository.dart';

part 'language_cubit.freezed.dart';

const _tag = 'LanguageCubit';

@singleton
class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit(
    this._authRepository,
  ) : super(const LanguageState.initialState());
  final AuthRepository _authRepository;

  Future<void> changeLanguage({
    String? language,
  }) async {
    log('changeLanguage', name: _tag);

    saveLocaleToCache(locale: language!);
  }

  void changeLocal() {
    emit(const LanguageState.loadingState());
    emit(const LanguageState.loadedState());
  }

  Future<void> saveLocaleToCache({required String locale}) async {
    final result = await _authRepository.saveLocale(locale: locale);

    result.fold(
      (l) {
        log('saveLocaleToCache: ${mapFailureToMessage(l)}', name: _tag);
      },
      (r) {
        log('saveLocaleToCache: $r', name: _tag);
      },
    );
  }

  // @override
  // voi onChange(Change<LanguageState> change) {
  //   print(change);
  //   super.onChange(change);
  // }
}

@freezed
class LanguageState with _$LanguageState {
  const factory LanguageState.initialState() = _InitialState;

  const factory LanguageState.loadedState() = _LoadedState;

  const factory LanguageState.restartState() = _RestartState;

  const factory LanguageState.loadingState() = _LoadingState;

  const factory LanguageState.errorState({
    required String message,
  }) = _ErrorState;
}
