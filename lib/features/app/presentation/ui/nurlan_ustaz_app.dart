import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/core/services/locator_service.dart';
import 'package:nurlan_ustaz_flutter/features/app/bloc/other_list_bloc/language_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/ui/multibloc_wrapper.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

class NurlanUstazApp extends StatefulWidget {
  const NurlanUstazApp({super.key});

  @override
  State<NurlanUstazApp> createState() => _NurlanUstazAppState();
  
}

class _NurlanUstazAppState extends State<NurlanUstazApp> {
  late AppRouter _rootRouter;

  @override
  void initState() {
    _rootRouter = getIt<AppRouter>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiblocWrapper(
        child: ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return BlocConsumer<LanguageCubit, LanguageState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              loadedState: () {
                setState(() {
                  log('SETSTATE:::');
                });
              },
            );
          },
          builder: (context, state) {
            return MaterialApp.router(
              key: rootNavigatorKey,
              // title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              locale: EasyLocalization.of(context)?.locale,

              localizationsDelegates:
                  EasyLocalization.of(context)?.delegates.toList(),
              // ...context.localizationDelegates,
              // CountryLocalizat
              // ions.delegate,

              supportedLocales: EasyLocalization.of(context)!.supportedLocales,
              theme: ThemeData(
                fontFamily: 'Poppins',
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              routerDelegate: _rootRouter.delegate(),
              routeInformationParser: _rootRouter.defaultRouteParser(),
            );
          },
        );
      },
    ));
  }
}
