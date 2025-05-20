import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nurlan_ustaz_flutter/core/widgets/app_dialog.dart';

class YesNoDialog extends StatelessWidget {
  const YesNoDialog({
    super.key,
    required this.title,
    this.content,
    this.actions,
    this.customNegativeCaption,
    this.customPositiveCaption,
    this.switchSense = false,
  });

  @protected
  final String title;

  @protected
  final String? content;

  @protected
  final String? customPositiveCaption;

  @protected
  final String? customNegativeCaption;

  @protected
  final bool switchSense;

  @protected
  final List<TextAppDialogAction>? actions;

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      content: content,
      title: title,
      actions: actions ??
          [
            TextAppDialogAction(
              sense: switchSense
                  ? AppDialogActionSense.negative
                  : AppDialogActionSense.positive,
              caption: customNegativeCaption ?? 'cancel'.tr(),
              onPressed: (context) {
                context.router.maybePop<bool>(false);
              },
            ),
            TextAppDialogAction(
              sense: switchSense
                  ? AppDialogActionSense.positive
                  : AppDialogActionSense.negative,
              caption: customPositiveCaption ?? 'yes'.tr(),
              onPressed: (context) {
                context.router.maybePop<bool>(true);
              },
            ),
          ],
    );
  }
}
