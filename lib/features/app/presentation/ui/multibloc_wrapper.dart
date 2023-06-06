import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/ayat_of_day_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/dhikrs_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/dhikrs_favorite_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/duas_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/duas_favorite_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/islam_names_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/islam_names_favorite_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/names_of_Allah_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/pillars_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/surah_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/surah_favorite_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/app/bloc/app_bloc.dart';
import 'package:nurlan_ustaz_flutter/features/app/bloc/other_list_bloc/language_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/news_cubit.dart';

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
        //HOME
        //
        BlocProvider<NewsCubit>(
          create: (context) => getIt<NewsCubit>(),
        ),

        //ISlAM TEACHING
        //
        BlocProvider<DhikrsCubit>(
          create: (context) => getIt<DhikrsCubit>(),
        ),
        BlocProvider<DhikrsFavoriteCubit>(
          create: (context) => getIt<DhikrsFavoriteCubit>(),
        ),
        BlocProvider<AyatOfDayCubit>(
          create: (context) => getIt<AyatOfDayCubit>(),
        ),
        BlocProvider<PillarsCubit>(
          create: (context) => getIt<PillarsCubit>(),
        ),
        BlocProvider<SurahCubit>(
          create: (context) => getIt<SurahCubit>(),
        ),
        BlocProvider<DuasCubit>(
          create: (context) => getIt<DuasCubit>(),
        ),
        BlocProvider<IslamNamesCubit>(
          create: (context) => getIt<IslamNamesCubit>(),
        ),
        BlocProvider<IslamNamesFavoriteCubit>(
          create: (context) => getIt<IslamNamesFavoriteCubit>(),
        ),
        BlocProvider<SurahFavoriteCubit>(
          create: (context) => getIt<SurahFavoriteCubit>(),
        ),
        BlocProvider<NamesOfAllahCubit>(
          create: (context) => getIt<NamesOfAllahCubit>(),
        ),
        BlocProvider<DuasFavoriteCubit>(
          create: (context) => getIt<DuasFavoriteCubit>(),
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
