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
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/charities_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/comment_news_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/comment_news_like_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/comment_news_post_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/comment_sem_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/comment_sem_like_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/comment_sem_post_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/lives_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/lives_fav_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/news_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/news_detail_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/news_fav_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/news_like_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/partners_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/post_service_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/seminar_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/seminar_detail_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/seminar_fav_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/seminar_like_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/services_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/tandaulilar/presentation/bloc/tandaulilar_cubit.dart';

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
        BlocProvider<SeminarCubit>(
          create: (context) => getIt<SeminarCubit>(),
        ),
        BlocProvider<ServicesCubit>(
          create: (context) => getIt<ServicesCubit>(),
        ),
        BlocProvider<CharitiesCubit>(
          create: (context) => getIt<CharitiesCubit>(),
        ),
        BlocProvider<CommentNewsCubit>(
          create: (context) => getIt<CommentNewsCubit>(),
        ),
        BlocProvider<CommentNewsLikeCubit>(
          create: (context) => getIt<CommentNewsLikeCubit>(),
        ),
        BlocProvider<CommentNewsPostCubit>(
          create: (context) => getIt<CommentNewsPostCubit>(),
        ),
        BlocProvider<CommentSemCubit>(
          create: (context) => getIt<CommentSemCubit>(),
        ),
        BlocProvider<CommentSemPostCubit>(
          create: (context) => getIt<CommentSemPostCubit>(),
        ),
        BlocProvider<LivesCubit>(
          create: (context) => getIt<LivesCubit>(),
        ),
        BlocProvider<PartnersCubit>(
          create: (context) => getIt<PartnersCubit>(),
        ),
        BlocProvider<PostServiceCubit>(
          create: (context) => getIt<PostServiceCubit>(),
        ),
        BlocProvider<SeminarFavCubit>(
          create: (context) => getIt<SeminarFavCubit>(),
        ),
        BlocProvider<LivesFavCubit>(
          create: (context) => getIt<LivesFavCubit>(),
        ),
        BlocProvider<SeminarLikeCubit>(
          create: (context) => getIt<SeminarLikeCubit>(),
        ),
        BlocProvider<CommentSemLikeCubit>(
          create: (context) => getIt<CommentSemLikeCubit>(),
        ),
        BlocProvider<NewsFavCubit>(
          create: (context) => getIt<NewsFavCubit>(),
        ),
        BlocProvider<NewsDetailCubit>(
          create: (context) => getIt<NewsDetailCubit>(),
        ),
        BlocProvider<SeminarDetailCubit>(
          create: (context) => getIt<SeminarDetailCubit>(),
        ),
        BlocProvider<NewsLikeCubit>(
          create: (context) => getIt<NewsLikeCubit>(),
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
        //TANDAULILAR
        //
        BlocProvider<TandaulilarCubit>(
          create: (context) => getIt<TandaulilarCubit>(),
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
