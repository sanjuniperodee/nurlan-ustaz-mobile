import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/main_page.dart';

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

  final List<Widget> _children = [
    const MainPage(),
    const MainPage(),
    const MainPage(),
    const MainPage(),
    const MainPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB1AFAF),
      body: _children[_currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        child: SizedBox(
          height: 124,
          child: BottomNavigationBar(
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Color(0xFFF9A502),
              unselectedItemColor: Color(0xFF252525),
              onTap: onTabTapped,
              currentIndex: _currentIndex,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/home.svg',
                  ),
                  label: "Басты бет",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/book.svg',
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
                        SizedBox(
                          height: 7,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Text(
                            'Түс жору',
                            style: TextStyle(
                                color: _currentIndex == 2
                                    ? Color(0xFFF9A502)
                                    : Color(0xFF252525)),
                          ),
                        )
                      ],
                    ),
                    label: ''),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/book2.svg',
                  ),
                  label: "Таңдаулылар",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/calendar.svg',
                  ),
                  label: "Жоспарлар",
                ),
              ]),
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  // @override
  // Widget build(BuildContext context) {
  //   return BlocBuilder<AppBloc, AppState>(
  //     builder: (context, state) {
  //       return AutoTabsScaffold(
  //         // lazyLoad: false,
  //         routes: [
  //           const BaseHomeRouter(),
  //           const BaseSearchPage(),
  //           const BaseFavoritePage(),
  //           const BaseBasketPage(),
  //           state.maybeWhen(
  //             inAppState: () => const BaseProfilePage(),
  //             orElse: () => const NotAuthBaseRoute(),
  //           ),
  //         ],
  //         bottomNavigationBuilder: (_, tabsRouter) {
  //           return BottomAppBar(
  //             shape: CircularNotchedRectangle(),
  //             notchMargin: 10,
  //             child: Container(
  //               height: 60,
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Row(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       MaterialButton(
  //                         minWidth: 40,
  //                         onPressed: () {
  //                           setState(() {});
  //                         },
  //                         child: Column(
  //                           mainAxisAlignment: MainAxisAlignment.center,
  //                           children: [
  //                             Icon(Icons.dashboard),
  //                           ],
  //                         ),
  //                       ),
  //                     ],
  //                   )
  //                 ],
  //               ),
  //             ),
  //           );
  //         },
  //       );
  //     },
  //   );
  // }
}
