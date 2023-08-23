import 'dart:developer';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nurlan_ustaz_flutter/core/services/locator_service.dart';
import 'package:nurlan_ustaz_flutter/features/app/on_boarding/data/datasource/on_boarding_ds.dart';
import 'package:nurlan_ustaz_flutter/features/app/on_boarding/data/repositories/on_boarding_repository.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../features/app/on_boarding/bloc/on_boarding_cubit.dart';
import 'app_version_model.dart';

class AppVersionService {

  static final AppVersionService _singleton = AppVersionService._internal();
  static const playStoreLink =
      'https://www.youtube.com/watch?v=wHBGxz5QnIE';
  static const appStoreLink =
      'https://www.youtube.com/watch?v=wHBGxz5QnIE';
  factory AppVersionService() {
    return _singleton;
  }

  bool wasVersionCompatabilityChecked = false;
  final  _onBoardingRepository  = getIt<OnBoardingRepository>;

  AppVersionService._internal( );


  Future<AppVersionsModel> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appVersion = packageInfo.version;
    log('current - $appVersion');
    return AppVersionsModel(version: appVersion,deviceType: Platform.operatingSystem.toString());
  }

  Future checkAppVersion(BuildContext context) async {
    try {
      wasVersionCompatabilityChecked = true;
      AppVersionsModel currentAppVersion = await getAppVersion();
      final result = await BlocProvider.of<OnBoardingCubit>(context).getVersion();
      if (result == null){
        return;
      }
      log('saaaa-${result.toString()}');
      AppVersionsModel serverAppVersion = result ;

      log('current-${currentAppVersion.toString()}');
      log('server-${serverAppVersion.toString()}');

      print('appVersion error $serverAppVersion');
      if (int.parse(currentAppVersion.version![0]) < int.parse(serverAppVersion.version![0]) ||
          int.parse(currentAppVersion.version![2]) < int.parse(serverAppVersion.version![2])) {
        _showHardUpdateDialog(context);
      } else if (int.parse(currentAppVersion.version![4]) < int.parse(serverAppVersion.version![4])) {
        _showSoftUpdateDialog(context);
      }
    } catch (e) {
      log(e.toString());
      wasVersionCompatabilityChecked = false;
    }
  }

  void _onUpdateTapped() {
    final url = Uri.parse(
      Platform.isAndroid ? playStoreLink : appStoreLink,
    );
    launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
  }

  Future _showHardUpdateDialog(BuildContext context) async {
    await showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text('app_version.new_update'.tr()),
        content: Text('app_version.update_app'.tr()),
        actions: [
          CupertinoDialogAction(
            onPressed: _onUpdateTapped,
            child: Text(
              "app_version.update".tr(),
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Future _showSoftUpdateDialog(BuildContext context) async {
    await showCupertinoDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => WillPopScope(
        onWillPop: () async { return false; },
        child: CupertinoAlertDialog(
          title: Text('app_version.new_update'.tr()),
          content: Text('app_version.update_app'.tr()),
          actions: [
            CupertinoDialogAction(
                child: Text(
                  "app_version.not_now".tr(),
                  style: const TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            CupertinoDialogAction(
              onPressed: _onUpdateTapped,
              child: Text(
                "app_version.update".tr(),
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
