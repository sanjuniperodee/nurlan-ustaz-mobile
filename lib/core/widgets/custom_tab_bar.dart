import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';

class CustomTabBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomTabBar({
    required this.labels,
    this.tabController,
    this.tabsRouter,
    super.key,
  }) : assert(
          tabController != null || tabsRouter != null,
          'Either "tabController" or "tabsRouter" must be provider',
        );

  @protected
  final List<String> labels;

  @protected
  final TabController? tabController;

  @protected
  final TabsRouter? tabsRouter;

  @protected
  static const kSelectedLabelTextStyle = TextStyle(
    height: 1.4285714285714286,
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    fontFamily: FontFamily.sfPro,
  );

  @protected
  static const kUnselectedLabelTextStyle = TextStyle(
    height: 1.4285714285714286,
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    fontFamily: FontFamily.sfPro,
  );

  @protected
  static const kBorderRadius = BorderRadius.all(Radius.circular(24));

  @override
  Size get preferredSize => Size.fromHeight(40);

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();
    final controller = widget.tabController;
    if (controller != null) {
      animation = controller.animation!;
    } else {
      final tabsRouter = widget.tabsRouter!;
      animation = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
        lowerBound: 0,
        upperBound: tabsRouter.pageCount.toDouble(),
        value: tabsRouter.activeIndex.toDouble(),
      );
      tabsRouter.addListener(onTabsRouterTrigger);
    }
  }

  void onTabsRouterTrigger() {
    (animation as AnimationController).animateTo(
      widget.tabsRouter!.activeIndex.toDouble(),
    );
  }

  void changeTab(int newIndex) {
    final controller = widget.tabController;
    if (controller != null) {
      controller.animateTo(newIndex);
    } else {
      widget.tabsRouter!.setActiveIndex(newIndex);
    }
  }

  @override
  void dispose() {
    if (animation is AnimationController) {
      (animation as AnimationController).dispose();
    }
    widget.tabsRouter?.removeListener(onTabsRouterTrigger);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox.fromSize(
        size: widget.preferredSize,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final fraction = constraints.maxWidth / widget.labels.length;
            return DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: CustomTabBar.kBorderRadius,
                color: Theme.of(context).scaffoldBackgroundColor.withAlpha(127),
              ),
              child: ValueListenableBuilder<double>(
                valueListenable: animation,
                builder: (context, value, child) {
                  return Stack(
                    fit: StackFit.loose,
                    children: [
                      // Indicator
                      Positioned(
                        left: fraction * value,
                        child: SizedBox(
                          width: constraints.maxWidth / widget.labels.length,
                          height: constraints.maxHeight,
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(
                                  color: const Color(0x0A000000),
                                  width: .5,
                                ),
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Row(
                          children: [
                            for (var i = 0; i < widget.labels.length; i++)
                              Expanded(
                                child: SizedBox(
                                  height: constraints.maxHeight,
                                  child: InkWell(
                                    onTap: () => changeTab(i),
                                    borderRadius: CustomTabBar.kBorderRadius,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Center(
                                        child: Text(
                                          widget.labels[i],
                                          style: TextStyle.lerp(
                                            CustomTabBar
                                                .kSelectedLabelTextStyle,
                                            CustomTabBar
                                                .kUnselectedLabelTextStyle,
                                            (value - i).abs().clamp(0.0, 1.0),
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
