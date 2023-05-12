import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    MainPage(),
    MainPage(),
    MainPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          onTabTapped(1);
        },
        tooltip: "Add Savings",
        elevation: 0,
        backgroundColor: Colors.white,
        child: const Icon(Icons.attach_money, color: Colors.indigo),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.attach_money),
              label: "Save",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: "Profile",
            ),
          ]),
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
