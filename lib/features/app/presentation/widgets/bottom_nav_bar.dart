import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';

sealed class BottomNavBarItem {
  const BottomNavBarItem._({required this.label});

  const factory BottomNavBarItem.asset({
    required String active,
    required String inactive,
    required String label,
  }) = _AssetBottomNavBarItem;

  const factory BottomNavBarItem.widget({
    required Widget widget,
    required String label,
  }) = _CustomWidgetBottomNavBarItem;

  final String label;

  bool get isAsset => this is _AssetBottomNavBarItem;
}

class _AssetBottomNavBarItem extends BottomNavBarItem {
  const _AssetBottomNavBarItem({
    required this.active,
    required this.inactive,
    required super.label,
  }) : super._();
  final String active;
  final String inactive;
}

class _CustomWidgetBottomNavBarItem extends BottomNavBarItem {
  const _CustomWidgetBottomNavBarItem({
    required this.widget,
    required super.label,
  }) : super._();
  final Widget widget;
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    required this.items,
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  @protected
  final List<BottomNavBarItem> items;

  @protected
  final int currentIndex;

  @protected
  final void Function(int index) onTap;

  @protected
  static const kBarBorderRadiusValue = 40.0;

  @protected
  static const kItemBorderRadiusValue = 20.0;

  @protected
  static const kItemBorderRadius =
      BorderRadius.all(Radius.circular(kItemBorderRadiusValue));

  @protected
  static const kBarBorderRadius = BorderRadius.vertical(
    top: Radius.circular(kBarBorderRadiusValue),
  );

  @protected
  static const kEdgeItemRadius = Radius.circular(kBarBorderRadiusValue);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: kBarBorderRadius,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            spreadRadius: 0,
            offset: Offset(0, -5),
            color: Color(0x08000000),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          height: 110,
          child: SizedBox.expand(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(
                items.length,
                (index) {
                  final item = items[index];
                  final isActive = currentIndex == index;
                  return Expanded(
                    child: Material(
                      type: MaterialType.transparency,
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: InkWell(
                          borderRadius: kItemBorderRadius.copyWith(
                            topLeft: index == 0 ? kEdgeItemRadius : null,
                            topRight: index == items.length - 1
                                ? kEdgeItemRadius
                                : null,
                          ),
                          onTap: () => onTap(index),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              switch (item) {
                                _AssetBottomNavBarItem(
                                  :final active,
                                  :final inactive
                                ) =>
                                  SvgPicture.asset(
                                    width: 25,
                                    height: 25,
                                    isActive ? active : inactive,
                                  ),
                                _CustomWidgetBottomNavBarItem(:final widget) =>
                                  widget,
                              },
                              const SizedBox(height: 8),
                              Text(
                                item.label.tr(),
                                maxLines: 1,
                                style: getTextStyle(CustomTextStyles.s14w400)
                                    .copyWith(
                                  fontSize: 10.sp,
                                  color: isActive
                                      ? AppColors.orange
                                      : AppColors.grey1,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 16),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
