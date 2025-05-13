import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';

import 'package:nurlan_ustaz_flutter/features/auth/data/repositories/auth_repository.dart';

part 'app_bloc.freezed.dart';

part 'app_event.dart';

part 'app_state.dart';

const _tag = 'AppBloc';
final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

@singleton
class AppBloc extends Bloc<AppEvent, AppState> {
  final AuthRepository _authRepository;
  // final NotAuthLogic _notAuthLogic;

  AppBloc(this._authRepository) : super(const AppState.loading()) {
    // _notAuthLogic.statusSubject.listen(
    //   (value) async {
    //     log('_startListenDio message from stream :: $value');

    //     if (value == 401) {
    //       emit(AppState.notAuthorizedDialog());
    //     }
    //   },
    // );

    on<AppEvent>(
      (AppEvent event, Emitter<AppState> emit) async {
        return await switch (event) {
          _Exiting() => _exit(event, emit),
          _Deleting() => _deleteUser(event, emit),
          _CheckAuth() => _checkAuth(event, emit),
          _Logining() => _login(event, emit),
          _RefreshLocal() => _refreshLocal(emit),
          _NonAuthorizedDialog() => _nonAuthorizedDialog(emit),
          _NonAuthorized() => _nonAuthorized(emit),
        };
      },
    );
  }

  Future<void> _nonAuthorized(
    Emitter<AppState> emit,
  ) async {
    emit(AppState.notAuthorizedDialog());
  }

  Future<void> _checkAuth(
    _CheckAuth event,
    Emitter<AppState> emit,
  ) async {
    // emit(const AppState.notAuthorizedState());
    //await _authChecking();
    await _tokenCheck(emit);
    // emit.isDone;
  }

  Future<void> _refreshLocal(
    Emitter<AppState> emit,
  ) async {
    // final TokenDTO token = _authLocalDs.getTokenFromCache();
    // // log(token.refresh.toString());
    // log(2.toString());
    // await _authRepository.refreshToken(refreshToken: token.refresh ?? '');
  }

  Future<void> _tokenCheck(
    Emitter<AppState> emit,
  ) async {
    final result = await _authRepository.authCheck();

    result.fold(
      (l) => emit(const AppState.inApp()),
      (r) {
        emit(const AppState.inApp());
      },
    );
  }

  Future<void> _nonAuthorizedDialog(
    Emitter<AppState> emit,
  ) async {
    emit(const AppState.notAuthorized());
  }

  Future<void> _exit(
    _Exiting event,
    Emitter<AppState> emit,
  ) async {
    final result = _authRepository.logOut();

    result.fold(
      (l) {
        emit(const AppState.inApp());
      },
      (r) => emit(const AppState.notAuthorized()),
    );
  }

  Future<void> _deleteUser(
    _Deleting event,
    Emitter<AppState> emit,
  ) async {
    final result = await _authRepository.deleteUser();

    result.fold(
      (l) {
        log('##### _DELETE USER::: ${mapFailureToMessage(l)}');
        emit(const AppState.loading());
      },
      (r) => emit(const AppState.notAuthorized()),
    );
  }

  Future<void> _login(
    _Logining event,
    Emitter<AppState> emit,
  ) async {
    log('AppBloc Hello', name: _tag);
    // _sendDeviceTokenToBack();
    emit(const AppState.inApp());
  }
}
