import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
              onTap: onTabTapped,
              currentIndex: _currentIndex,
              items: [
                BottomNavigationBarItem(
                  icon: _currentIndex != 0
                      ? SvgPicture.asset(
                          'assets/icons/home.svg',
                        )
                      : SvgPicture.asset(
                          'assets/icons/home_1.svg',
                        ),
                  label: "Басты бет",
                ),
                BottomNavigationBarItem(
                  icon: _currentIndex != 1
                      ? SvgPicture.asset(
                          'assets/icons/book.svg',
                        )
                      : SvgPicture.asset(
                          'assets/icons/book_1.svg',
                        ),
                  label: "Ислам ілімі",
                ),
                BottomNavigationBarItem(
                    icon: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/moon.svg',
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
                      ? SvgPicture.asset(
                          'assets/icons/book2.svg',
                        )
                      : SvgPicture.asset(
                          'assets/icons/book_2.svg',
                        ),
                  label: "Таңдаулылар",
                ),
                BottomNavigationBarItem(
                  icon: _currentIndex != 4
                      ? SvgPicture.asset(
                          'assets/icons/calendar.svg',
                        )
                      : SvgPicture.asset(
                          'assets/icons/calendar_1.svg',
                        ),
                  label: "Жоспарлар",
                ),
              ]),
        );
      },
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
