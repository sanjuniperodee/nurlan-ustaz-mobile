import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';


import 'package:nurlan_ustaz_flutter/core/common/shared_keys.dart';
import 'package:nurlan_ustaz_flutter/core/platform/cache_helper/prefs.dart';


import 'package:nurlan_ustaz_flutter/features/app/logic/not_auth_logic.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/token_dto.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/repositories/auth_repository.dart';

import '../../auth/data/datasource/local/auth_local_ds.dart';

part 'app_bloc.freezed.dart';
part 'app_event.dart';
part 'app_state.dart';

const _tag = 'AppBloc';

@singleton
class AppBloc extends Bloc<AppEvent, AppState> {
  final AuthRepository _authRepository;
  final NotAuthLogic _notAuthLogic;
  final AuthLocalDs _authLocalDs;

  AppBloc(
    this._authRepository,
    this._notAuthLogic,
    this._authLocalDs

  ) : super(const AppState.loadingState()) {
    _notAuthLogic.statusSubject.listen(
      (value) async {
        log('_startListenDio message from stream :: $value');

        if (value == 401)  {
          final TokenDTO? token = _authLocalDs.getTokenFromCache();
          await _authRepository
              .refreshToken(refreshToken: token?.refresh ?? '')



              .whenComplete(() {
            add(const AppEvent.checkAuth());
            // }
          });
        }
      },
    );
    on<AppEvent>(
      (AppEvent event, Emitter<AppState> emit) async => event.map(
        exiting: (_Exiting event) async => _exit(event, emit),
        deleting: (_Deleting event) async => _deleteUser(event, emit),
        checkAuth: (_CheckAuth event) async => _checkAuth(event, emit),
        logining: (_Logining event) async => _login(event, emit),
        refreshLocal: (_RefreshLocal event) async => _refreshLocal(event, emit),
        onboardingSave: (_OnboardingSave event) async =>
            _onboarding(event, emit),
      ),
    );
  }

  Future<void> _checkAuth(
    _CheckAuth event,
    Emitter<AppState> emit,
  ) async {
    final failureOrOnboarding = await _authRepository.getOnboardingStatus();
    await failureOrOnboarding.fold((l) {
      log('AppBloc authChecking l: $l');
      emit(const AppState.onBoardingState());
      return;
    }, (r) async {
      if (r) {
        log('AppBloc authChecking: $r');
        // emit(const AppState.notAuthorizedState());
        //await _authChecking();
        await _tokenCheck(emit);
        // emit.isDone;
      } else {
        emit(const AppState.onBoardingState());
        return;
      }
    });
  }

  Future<void> _refreshLocal(
    _RefreshLocal event,
    Emitter<AppState> emit,
  ) async {
    await state.maybeWhen(
      inAppState: () async {
        emit(const AppState.loadingState());
        await Future.delayed(const Duration(milliseconds: 100));
        emit(const AppState.inAppState());
      },
      orElse: () async {
        emit(const AppState.loadingState());
        await Future.delayed(const Duration(milliseconds: 100));
        emit(const AppState.notAuthorizedState());
      },
    );
  }

  Future<void> _tokenCheck(
    Emitter<AppState> emit,
  ) async {
    final result = _authRepository.authCheck();

    result.fold(
      (l) => emit(const AppState.notAuthorizedState()),
      (r) {
        emit(const AppState.inAppState());
      },
    );
  }

  Future<void> _exit(
    _Exiting event,
    Emitter<AppState> emit,
  ) async {
    final result = await _authRepository.logOut();

    result.fold(
      (l) {
        emit(const AppState.inAppState());
      },
      (r) => emit(const AppState.notAuthorizedState()),
    );
  }

  Future<void> _deleteUser(
    _Deleting event,
    Emitter<AppState> emit,
  ) async {
    // final result = await _authRepository.deleteUser();

    // result.fold(
    //   (l) {
    //     log('##### _DELETE USER::: ${mapFailureToMessage(l)}');
    //     emit(const AppState.notAuthorizedState());
    //   },
    //   (r) => emit(const AppState.notAuthorizedState()),
    // );
  }

  Future<void> _login(
    _Logining event,
    Emitter<AppState> emit,
  ) async {
    log('AppBloc Hello', name: _tag);
    // _sendDeviceTokenToBack();
    emit(const AppState.inAppState());
  }

  Future<void> _onboarding(
    _OnboardingSave event,
    Emitter<AppState> emit,
  ) async {
    final failureOrSuccess =
        await _authRepository.saveOnboardingStatus(isOnboarding: true);

    failureOrSuccess.fold(
      (l) {
        log('AuthentificationCubit saveOnboardingStatus: $l');
      },
      (r) {
        log('AuthentificationCubit saveOnboardingStatus: $r');
      },
    );

    emit(const AppState.notAuthorizedState());
  }
}
