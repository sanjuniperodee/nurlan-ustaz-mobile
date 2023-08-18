import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/core/services/locator_service.dart';

import 'package:nurlan_ustaz_flutter/features/app/presentation/ui/multibloc_wrapper.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      // AppRouter().routes
      getIt<AppRouter>().pushAll([
        const LauncherAppRoute(
          children: [
            MainRouterPage(),
          ],
        ),
      ]);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiblocWrapper(
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return Scaffold(
            body: SizedBox(
              width: 1.sw,
              height: 1.sh,
              child: Image.asset(
                'assets/images/on_boarding_background.png',
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
