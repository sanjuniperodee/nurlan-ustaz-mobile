import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';

enum ActionResultType {
  success,
  error,
  custom;

  T when<T>({
    required T Function() success,
    required T Function() error,
    required T Function() custom,
  }) {
    switch (this) {
      case ActionResultType.success:
        return success();
      case ActionResultType.error:
        return error();
      case ActionResultType.custom:
        return custom();
    }
  }
}

class ActionResultPage extends StatelessWidget {
  const ActionResultPage({
    super.key,
    this.bottom,
    this.backgroundColor,
    this.title,
    this.content,
    this.subtitle,
    this.iconColor,
    this.iconSize = kIconSize,
    required this.icon,
    required this.automaticallyImplyPopButton,
    required this.automaticallyImplyCloseButton,
  }) : type = ActionResultType.custom;

  const ActionResultPage.success({
    super.key,
    this.bottom,
    this.backgroundColor,
    this.title,
    this.content,
    this.subtitle,
    this.icon = Icons.check_circle_outline_outlined,
    this.iconColor,
    this.automaticallyImplyPopButton = true,
    this.automaticallyImplyCloseButton = true,
    this.iconSize = kIconSize,
  }) : type = ActionResultType.success;

  const ActionResultPage.error({
    super.key,
    this.bottom,
    this.backgroundColor,
    this.title,
    this.content,
    this.subtitle,
    this.icon = Icons.close_outlined,
    this.iconColor,
    this.automaticallyImplyPopButton = true,
    this.automaticallyImplyCloseButton = true,
    this.iconSize = kIconSize,
  }) : type = ActionResultType.error;

  @protected
  final ActionResultType type;

  @protected
  final String? title;

  @protected
  final String? content;

  @protected
  final String? subtitle;

  @protected
  final bool automaticallyImplyPopButton;

  @protected
  final bool automaticallyImplyCloseButton;

  @protected
  final Widget? bottom;

  @protected
  final Color? backgroundColor;

  @protected
  final IconData icon;

  @protected
  final Color? iconColor;

  @protected
  final double iconSize;

  @protected
  static const kIconSize = 123.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        primary: false,
        slivers: [
          ActionResultWidget(
            type: type,
            icon: icon,
            title: title,
            bottom: bottom,
            content: content,
            subtitle: subtitle,
            iconSize: iconSize,
            iconColor: iconColor,
            backgroundColor: backgroundColor,
            automaticallyImplyPopButton: automaticallyImplyPopButton,
            automaticallyImplyCloseButton: automaticallyImplyCloseButton,
          ),
        ],
      ),
    );
  }
}

class ActionResultWidget extends StatelessWidget {
  const ActionResultWidget({
    super.key,
    required this.type,
    this.title,
    this.content,
    this.subtitle,
    required this.automaticallyImplyPopButton,
    required this.automaticallyImplyCloseButton,
    this.bottom,
    this.backgroundColor,
    required this.icon,
    this.iconColor,
    required this.iconSize,
  });

  const ActionResultWidget.success({
    super.key,
    this.bottom,
    this.backgroundColor,
    this.title,
    this.content,
    this.subtitle,
    this.icon = Icons.check_circle_outline_outlined,
    this.iconColor,
    this.automaticallyImplyPopButton = true,
    this.automaticallyImplyCloseButton = false,
    this.iconSize = ActionResultPage.kIconSize,
  }) : type = ActionResultType.success;

  const ActionResultWidget.error({
    super.key,
    this.bottom,
    this.backgroundColor,
    this.title,
    this.content,
    this.subtitle,
    this.icon = Icons.close_outlined,
    this.iconColor,
    this.automaticallyImplyPopButton = true,
    this.automaticallyImplyCloseButton = false,
    this.iconSize = ActionResultPage.kIconSize,
  }) : type = ActionResultType.error;

  @protected
  static const kTitleTextStyle = TextStyle(
    height: 1.2,
    fontSize: 24,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    fontFamily: FontFamily.sfPro,
  );

  @protected
  static const kContentTextStyle = TextStyle(
    height: 1.5,
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    fontFamily: FontFamily.sfPro,
  );

  @protected
  static const kSubtitleTextStyle = TextStyle(
    height: 1.5,
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    fontFamily: FontFamily.sfPro,
  );

  @protected
  final ActionResultType type;

  @protected
  final String? title;

  @protected
  final String? content;

  @protected
  final String? subtitle;

  @protected
  final bool automaticallyImplyPopButton;

  @protected
  final bool automaticallyImplyCloseButton;

  @protected
  final Widget? bottom;

  @protected
  final Color? backgroundColor;

  @protected
  final IconData icon;

  @protected
  final Color? iconColor;

  @protected
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Column(
        children: [
          if (automaticallyImplyCloseButton)
            Container(
              padding: const EdgeInsets.all(8).copyWith(
                top: MediaQuery.paddingOf(context).top + 8,
              ),
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: context.router.maybePop,
                iconSize: 20,
                icon: const Icon(
                  Icons.close,
                ),
              ),
            ),
          const Spacer(),
          Icon(
            icon,
            size: iconSize,
            color: type.when(
              error: () => theme.colorScheme.error,
              success: () => theme.colorScheme.primary,
              custom: () => iconColor ?? theme.textTheme.bodyMedium?.color,
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (title != null)
                  Text(
                    title ?? '',
                    textAlign: TextAlign.center,
                    style: kTitleTextStyle,
                  ),
                if (content != null) ...[
                  const SizedBox(height: 17),
                  Text(
                    content ?? '',
                    style: kContentTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
                if (subtitle != null) ...[
                  const SizedBox(height: 13),
                  Text(
                    subtitle ?? '',
                    textAlign: TextAlign.center,
                    style: kSubtitleTextStyle,
                  ),
                ],
                const SizedBox(height: 24),
              ],
            ),
          ),
          const Spacer(),
          if (bottom == null && automaticallyImplyPopButton)
            SizedBox(
              width: 156,
              child: OutlinedButton(
                onPressed: context.router.maybePop,
                child: Text('Назад'),
              ),
            )
          else if (bottom != null)
            bottom ?? const SizedBox.shrink(),
          const SizedBox(height: 37),
          SizedBox(height: MediaQuery.paddingOf(context).bottom),
        ],
      ),
    );
  }
}
