import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';

class Base extends StatefulWidget {
  const Base({super.key});

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  @override
  void initState() {
    super.initState();
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      backgroundColor: const Color(0xFFF2F8FF),
      routes: const [
        MainRouterPage(),
        MainRouterPage(),
        MainRouterPage(),
        MainRouterPage(),
        MainRouterPage(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
              backgroundColor: Colors.white,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: const Color(0xFFF9A502),
              unselectedItemColor: const Color(0xFF252525),
              // unselectedLabelStyle: TextStyle(fontSize: 10),
              onTap: (index) {
                if (tabsRouter.activeIndex == index) {
                  tabsRouter.popTop();
                } else {
                  tabsRouter.setActiveIndex(index);
                }
              },
              currentIndex: tabsRouter.activeIndex,
              items: [
                BottomNavigationBarItem(
                  icon: _currentIndex != 0
                      ? SvgPicture.asset(
                          Assets.homeSvg,
                        )
                      : SvgPicture.asset(Assets.home_1Svg),
                  label: "Басты бет",
                ),
                BottomNavigationBarItem(
                  icon: _currentIndex != 1
                      ? SvgPicture.asset(Assets.bookSvg)
                      : SvgPicture.asset(Assets.book_1Svg),
                  label: "Ислам ілімі",
                ),
                BottomNavigationBarItem(
                    icon: Column(
                      children: [
                        SvgPicture.asset(
                          Assets.moonSvg,
                          height: 55,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Text(
                            'Түс жору',
                            style: TextStyle(
                                color: _currentIndex == 2
                                    ? const Color(0xFFF9A502)
                                    : const Color(0xFF252525)),
                          ),
                        )
                      ],
                    ),
                    label: ''),
                BottomNavigationBarItem(
                  icon: _currentIndex != 3
                      ? SvgPicture.asset(Assets.book2Svg)
                      : SvgPicture.asset(Assets.book_2Svg),
                  label: "Таңдаулылар",
                ),
                BottomNavigationBarItem(
                  icon: _currentIndex != 4
                      ? SvgPicture.asset(Assets.calendarSvg)
                      : SvgPicture.asset(Assets.calendar_1Svg),
                  label: "Жоспарлар",
                ),
              ]),
        );
      },
    );
  }
}
