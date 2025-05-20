import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/datasource/local/auth_local_ds.dart';

sealed class BottomNavBarItem {
  const BottomNavBarItem._({
    required this.label,
    this.requiresAuth = false,
  });

  const factory BottomNavBarItem.asset({
    required String active,
    required String inactive,
    required String label,
    bool requiresAuth,
  }) = _AssetBottomNavBarItem;

  const factory BottomNavBarItem.widget({
    required Widget widget,
    required String label,
    bool requiresAuth,
  }) = _CustomWidgetBottomNavBarItem;

  final String label;

  final bool requiresAuth;

  bool get isAsset => this is _AssetBottomNavBarItem;
}

class _AssetBottomNavBarItem extends BottomNavBarItem {
  const _AssetBottomNavBarItem({
    required this.active,
    required this.inactive,
    required super.label,
    super.requiresAuth,
  }) : super._();
  final String active;
  final String inactive;
}

class _CustomWidgetBottomNavBarItem extends BottomNavBarItem {
  const _CustomWidgetBottomNavBarItem({
    required this.widget,
    required super.label,
    super.requiresAuth,
  }) : super._();
  final Widget widget;
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    required this.items,
    required this.tabsRouter,
    required this.authLocalDs,
    super.key,
  });

  @protected
  final TabsRouter tabsRouter;

  @protected
  final List<BottomNavBarItem> items;

  @protected
  final AuthLocalDs authLocalDs;

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
                  final isActive = tabsRouter.activeIndex == index;
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
                          onTap: () async {
                            if (item.requiresAuth) {
                              final token = await authLocalDs.getToken();
                              if (!token.isPresent && context.mounted) {
                                final goToAuth = await context.router
                                    .push<bool>(AuthRequiredDialogRoute());
                                if (goToAuth != true || !context.mounted) {
                                  return;
                                }

                                await context.router
                                    .push(const AuthorizationRoute());
                                final token = await authLocalDs.getToken();
                                if (!token.isPresent) return;
                              }
                            }
                            tabsRouter.setActiveIndex(index);
                          },
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
