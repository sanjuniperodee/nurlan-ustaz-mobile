import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/ayat_of_day_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/pillars_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/app/bloc/app_bloc.dart';
import 'package:nurlan_ustaz_flutter/features/app/bloc/other_list_bloc/language_cubit.dart';

import '../../../../core/services/locator_service.dart';

class MultiblocWrapper extends StatefulWidget {
  final Widget child;
  const MultiblocWrapper({
    super.key,
    required this.child,
  });

  @override
  State<MultiblocWrapper> createState() => _MultiblocWrapperState();
}

class _MultiblocWrapperState extends State<MultiblocWrapper> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ///
        /// App BloC
        ///
        BlocProvider<AppBloc>(
          create: (context) => getIt<AppBloc>(),
        ),
        BlocProvider<LanguageCubit>(
          create: (context) => getIt<LanguageCubit>(),
        ),
        //AUTH
        //

        //ISlAM TEACHING
        //
        BlocProvider<AyatOfDayCubit>(
          create: (context) => getIt<AyatOfDayCubit>(),
        ),
        BlocProvider<PillarsCubit>(
          create: (context) => getIt<PillarsCubit>(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'First Method',
            // You can use the library anywhere in the app even in theme
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}
