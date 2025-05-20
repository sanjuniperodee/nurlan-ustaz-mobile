import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:nurlan_ustaz_flutter/core/widgets/yes_no_dialog.dart';

@RoutePage(name: 'AuthRequiredDialogRoute')
class AuthRequiredDialog extends YesNoDialog {
  AuthRequiredDialog({super.key})
      : super(
          title: '401.content'.tr(),
          customNegativeCaption: 'cancel'.tr(),
          customPositiveCaption: 'entry'.tr(),
          switchSense: true,
        );
}
