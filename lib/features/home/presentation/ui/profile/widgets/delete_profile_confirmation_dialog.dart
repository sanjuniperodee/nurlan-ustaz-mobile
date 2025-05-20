import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:nurlan_ustaz_flutter/core/widgets/yes_no_dialog.dart';

@RoutePage(name: 'DeleteProfileConfirmationDialogRoute')
class DeleteProfileConfirmationDialog extends YesNoDialog {
  DeleteProfileConfirmationDialog({super.key})
      : super(
          title: 'delete'.tr(),
          content: 'delete_des'.tr(),
          customNegativeCaption: 'cancel'.tr(),
          customPositiveCaption: 'delete'.tr(),
        );
}
