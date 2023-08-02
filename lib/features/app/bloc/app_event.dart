part of 'app_bloc.dart';

@freezed
class AppEvent with _$AppEvent {
  const factory AppEvent.checkAuth() = _CheckAuth;

  const factory AppEvent.onboardingSave() = _OnboardingSave;

  const factory AppEvent.logining() = _Logining;
  const factory AppEvent.refreshLocal() = _RefreshLocal;
  // const factory AppEvent.sendDeviceToken() = _SendDeviceToken;
  const factory AppEvent.exiting() = _Exiting;
  const factory AppEvent.deleting() = _Deleting;
  const factory AppEvent.nonAuthorizedDialog() = _NonAuthorizedDialog;

}
