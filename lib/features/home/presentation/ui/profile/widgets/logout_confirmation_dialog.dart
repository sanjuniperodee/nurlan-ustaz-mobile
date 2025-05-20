import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:nurlan_ustaz_flutter/core/widgets/yes_no_dialog.dart';

@RoutePage(name: 'LogoutConfirmationDialogRoute')
class LogoutConfirmationDialog extends YesNoDialog {
  LogoutConfirmationDialog({super.key})
      : super(
          title: 'exit'.tr(),
          content: 'exit_des'.tr(),
          customNegativeCaption: 'cancel'.tr(),
          customPositiveCaption: 'exit2'.tr(),
        );
}
