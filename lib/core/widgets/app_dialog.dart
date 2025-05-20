import 'package:flutter/material.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';

enum AppDialogActionSense {
  positive,
  negative;

  R when<R>({
    required R Function() positive,
    required R Function() negative,
  }) {
    return switch (this) {
      AppDialogActionSense.negative => negative(),
      AppDialogActionSense.positive => positive(),
    };
  }
}

class TextAppDialogAction {
  const TextAppDialogAction({
    required this.sense,
    required this.caption,
    required this.onPressed,
  });

  const TextAppDialogAction.positive({
    required this.caption,
    required this.onPressed,
  }) : sense = AppDialogActionSense.positive;

  const TextAppDialogAction.negative({
    required this.caption,
    required this.onPressed,
  }) : sense = AppDialogActionSense.negative;

  @protected
  final AppDialogActionSense sense;

  @protected
  final String caption;

  @protected
  final void Function(BuildContext context) onPressed;
}

class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    this.title,
    this.content,
    required this.actions,
  });

  @protected
  final String? title;

  @protected
  final String? content;

  @protected
  final List<TextAppDialogAction> actions;

  @protected
  static const kBoxShadow = [
    BoxShadow(blurRadius: 24, color: Color(0x38000000)),
  ];

  @protected
  static const kBorderRadius = BorderRadius.all(Radius.circular(10));

  static const kTitleTextStyle = TextStyle(
    height: 1.25,
    fontSize: 18,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    fontFamily: FontFamily.sfPro,
  );

  @protected
  static const kContentTextStyle = TextStyle(
    height: 1.2,
    fontSize: 15,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    fontFamily: FontFamily.sfPro,
  );

  @protected
  static const kActionCaptionTextStyle = TextStyle(
    height: 1.14,
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    fontFamily: FontFamily.sfPro,
  );

  Iterable<Widget> mapActionsDividedBy({
    required Widget Function(TextAppDialogAction action) mapper,
    required Widget divider,
  }) sync* {
    for (var i = 0; i < actions.length; i++) {
      yield mapper(actions[i]);
      if (i < actions.length - 1) yield divider;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: SizedBox(
          width: 280,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: kBorderRadius,
              boxShadow: kBoxShadow,
              color: theme.scaffoldBackgroundColor,
            ),
            child: ClipRRect(
              borderRadius: kBorderRadius,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 22,
                    ).copyWith(top: 29),
                    child: Column(
                      children: [
                        if (title != null)
                          Text(
                            title ?? '',
                            textAlign: TextAlign.center,
                            style: kTitleTextStyle,
                          ),
                        if (content != null) ...[
                          const SizedBox(height: 6),
                          Text(
                            content ?? '',
                            textAlign: TextAlign.center,
                            style: kContentTextStyle,
                          ),
                        ],
                      ],
                    ),
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: theme.dividerColor,
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(minHeight: 51),
                    child: IntrinsicHeight(
                      child: Row(
                        children: mapActionsDividedBy(
                          mapper: (e) {
                            return Expanded(
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () => e.onPressed(context),
                                  child: Center(
                                    child: DefaultTextStyle(
                                      style: kActionCaptionTextStyle.copyWith(
                                        color: e.sense.when(
                                          positive: () => theme.primaryColor,
                                          negative: () => theme.disabledColor,
                                        ),
                                      ),
                                      child: Text(e.caption),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          divider: VerticalDivider(
                            thickness: .5,
                            width: 1,
                            color: theme.dividerColor,
                          ),
                        ).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
