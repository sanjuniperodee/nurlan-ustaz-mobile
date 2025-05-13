part of 'app_bloc.dart';

@freezed
sealed class AppState with _$AppState {
  const factory AppState.loading() = _LoadingState;
  const factory AppState.notAuthorizedDialog() = _NotAuthorizedDialogState;
  const factory AppState.notAuthorized() = _NotAuthorizedState;
  const factory AppState.notVerifyed() = _NotVerifyed;
  const factory AppState.inApp() = _InAppState;
  const factory AppState.init() = _InitState;
  const factory AppState.error({
    required String message,
  }) = _ErrorState;
}

extension AppStatePatternMatchingExt on AppState {
  R maybeWhen<R>({
    required R Function() orElse,
    R Function()? loading,
    R Function()? notAuthorizedDialog,
    R Function()? notAuthorized,
    R Function()? notVerifyed,
    R Function()? inApp,
    R Function()? init,
    R Function(String message)? error,
  }) {
    return switch (this) {
      _LoadingState() => loading?.call() ?? orElse(),
      _NotAuthorizedDialogState() => notAuthorizedDialog?.call() ?? orElse(),
      _NotAuthorizedState() => notAuthorized?.call() ?? orElse(),
      _NotVerifyed() => notVerifyed?.call() ?? orElse(),
      _InAppState() => inApp?.call() ?? orElse(),
      _InitState() => init?.call() ?? orElse(),
      _ErrorState(:final message) => error?.call(message) ?? orElse(),
    };
  }

  void whenOrNull({
    void Function()? loading,
    void Function()? notAuthorizedDialog,
    void Function()? notAuthorized,
    void Function()? notVerifyed,
    void Function()? inApp,
    void Function()? init,
    void Function(String message)? error,
  }) {
    return switch (this) {
      _LoadingState() => loading?.call(),
      _NotAuthorizedDialogState() => notAuthorizedDialog?.call(),
      _NotAuthorizedState() => notAuthorized?.call(),
      _NotVerifyed() => notVerifyed?.call(),
      _InAppState() => inApp?.call(),
      _InitState() => init?.call(),
      _ErrorState(:final message) => error?.call(message),
    };
  }
}
