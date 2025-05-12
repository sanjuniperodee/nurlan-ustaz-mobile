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
  ) : super(const LanguageState.initial());
  final AuthRepository _authRepository;

  Future<void> changeLanguage({
    String? language,
  }) async {
    emit(const LanguageState.loading());
    log('changeLanguage', name: _tag);
    saveLocaleToCache(locale: language!);
    emit(const LanguageState.loaded());
  }

  void changeLocal() {
    emit(const LanguageState.loading());
    emit(const LanguageState.loaded());
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
sealed class LanguageState with _$LanguageState {
  const factory LanguageState.initial() = LanguageInitialState;
  const factory LanguageState.loaded() = LanguageLoadedState;
  const factory LanguageState.restart() = LanguageRestartState;
  const factory LanguageState.loading() = LanguageLoadingState;
  const factory LanguageState.error({required String message}) =
      LanguageErrorState;
}
