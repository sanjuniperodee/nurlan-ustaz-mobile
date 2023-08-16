import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/core/services/locator_service.dart';
import 'package:nurlan_ustaz_flutter/features/app/bloc/other_list_bloc/language_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/app_button.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_snackbars.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/main_button.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/banner_local_model.dart';

import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/news_main_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/timings_cubit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import '../../../auth/data/datasource/local/auth_local_ds.dart';

@RoutePage(name: 'MainRouterPage')
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  RefreshController controller = RefreshController();

  final FirebaseAnalytics _firebaseAnalytics = FirebaseAnalytics.instance;
  final List<PageRouteInfo<dynamic>> myRouteHome = [
    SeminarRoute(),
    const CharityRoute(),
    const ServicesRoute(),
    LiveBroadcastsRoute(),
    const ShopRoute(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    String chosenLang = getIt<AuthLocalDs>().getLocale();
    Intl.defaultLocale = chosenLang.replaceAll('kz', 'kk');
    BlocProvider.of<NewsMainCubit>(context).newsMain(
      currentPage: 1,
      // isFirstCall: true,
    );

    // _logAppOpen();
    BlocProvider.of<TimingsCubit>(context).timings(
      43.25,
      76.91667,
    );
    super.initState();
  }

  // void _logAppOpen() async {
  //   await _firebaseAnalytics.logEvent(
  //     name: 'click',
  //     parameters: {'event_name': 'name'},
  //   );
  //   log('ketti');
  // }

  final now = DateTime.now();
  List times = [];

  @override
  Widget build(BuildContext context) {
    List<String> namasNames = [
      'Fajr'.tr(),
      'Күн',
      'Zukhr'.tr(),
      'Asr'.tr(),
      'Maghrib'.tr(),
      'Isha'.tr()
    ];
    List<BannerLocalModel> list = [
      BannerLocalModel(
        title: 'seminar'.tr(),
        url: Assets.banner1Svg,
      ),
      BannerLocalModel(
        title: 'Charity'.tr(),
        url: Assets.banner2Svg,
      ),
      BannerLocalModel(
        title: 'Services'.tr(),
        url: Assets.banner3Svg,
      ),
      BannerLocalModel(
        title: 'live'.tr(),
        url: Assets.banner4Svg,
      ),
      BannerLocalModel(
        title: 'shop'.tr(),
        url: Assets.banner5Svg,
      ),
    ];
    return BlocListener<LanguageCubit, LanguageState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loadedState: () {
            setState(() {});
          },
        );
        // TODO: implement listener
      },
      child: Scaffold(
        backgroundColor: AppColors.lightBlue,
        body: BlocBuilder<TimingsCubit, TimingsState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.linearBlue),
                );
              },
              loaded: (not, geo) {
                final namaz = not.toJson();
                times = namaz.values.toList();
                return BlocConsumer<NewsMainCubit, NewsMainState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      orElse: () {},
                      errorState: (message) {
                        buildErrorCustomSnackBar(context, message);
                      },
                    ); //
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.linearBlue,
                          ),
                        );
                      },
                      loadingState: () {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.linearBlue,
                          ),
                        );
                      },
                      loaded: (news) {
                        return GlobalCustomBody(
                          left: 0,
                          right: 0,
                          child: SizedBox(
                            child: SmartRefresher(
                              enablePullDown: true,
                              controller: controller,
                              header: CustomHeader(
                                builder: (context, mode) {
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.linearBlue,
                                    ),
                                  ); // Return an empty container to remove the default text
                                },
                              ),
                              onRefresh: () {
                                String chosenLang =
                                    getIt<AuthLocalDs>().getLocale();
                                Intl.defaultLocale =
                                    chosenLang.replaceAll('kz', 'kk');
                                BlocProvider.of<NewsMainCubit>(context)
                                    .newsMain(
                                  currentPage: 1,
                                  // isFirstCall: true,
                                );
                                BlocProvider.of<TimingsCubit>(context).timings(
                                  43.25,
                                  76.91667,
                                );
                              },
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                              right: 16.0, left: 16, top: 16)
                                          .r,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(
                                            Assets.logoNurlan,
                                            width: 145.w,
                                            height: 39.h,
                                          ),
                                          Row(
                                            children: [
                                              GestureDetector(
                                                  onTap: () {
                                                    context.router.push(
                                                      const NotificationRoute(),
                                                    );
                                                  },
                                                  child: SvgPicture.asset(
                                                      Assets.notiSvg)),
                                              SizedBox(
                                                width: 8.r,
                                              ),
                                              GestureDetector(
                                                  onTap: () {
                                                    context.router.push(
                                                      const ProfileMainRoute(),
                                                    );
                                                  },
                                                  child: SvgPicture.asset(
                                                      Assets.userSvg)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 32.h),
                                    SizedBox(
                                      height: 56.h,
                                      width: 1.sw,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        physics: const BouncingScrollPhysics(),
                                        itemCount: list.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          for (int n = 0;
                                              n < myRouteHome.length;
                                              n++) {}
                                          return InkWell(
                                            onTap: () {
                                              context.router.push(
                                                myRouteHome[index],
                                              );
                                            },
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(right: 8.r),
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10.r),
                                                height: 56,
                                                decoration: BoxDecoration(
                                                  color: AppColors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(75),
                                                ),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                        list[index].url),
                                                    SizedBox(width: 8.r),
                                                    Text(list[index].title,
                                                        style: getTextStyle(
                                                                CustomTextStyles
                                                                    .s14w400)
                                                            .apply(
                                                                fontFamily:
                                                                    FontTypes
                                                                        .Philosopher
                                                                        .name)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 20.h),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                              right: 16.0, left: 16)
                                          .r,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              context.router.push(
                                                NamazRoute(),
                                              );
                                            },
                                            child: Column(
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                          '${geo.name ?? 'Алматы'}, ${DateFormat.yMMMd().format(DateTime.now())}',
                                                          style: getTextStyle(
                                                                  CustomTextStyles
                                                                      .s14w400)
                                                              .apply(
                                                                  fontFamily:
                                                                      FontTypes
                                                                          .SF_Pro
                                                                          .name)),
                                                      // SizedBox(
                                                      //   width: 175.w,
                                                      // ),
                                                      SvgPicture.asset(Assets
                                                          .arrowUpOutlineSvg),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 16.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        SvgPicture.asset(
                                                            Assets.shalatSvg),
                                                        SizedBox(
                                                          width: 10.r,
                                                        ),
                                                        Text(
                                                            '${namasNames[indexOfNextNames(times)]} ${'Namaz_time'.tr()}',
                                                            style: getTextStyle(
                                                                    CustomTextStyles
                                                                        .s16w200)
                                                                .apply(
                                                                    fontFamily:
                                                                        FontTypes
                                                                            .SF_Pro
                                                                            .name)
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400)),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Text(
                                                          namasTimestoSend(),
                                                          style: getTextStyle(
                                                                  CustomTextStyles
                                                                      .s16w200)
                                                              .apply(
                                                                  fontFamily:
                                                                      FontTypes
                                                                          .SF_Pro
                                                                          .name)
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)
                                                              .apply(
                                                                  color:
                                                                      AppColors
                                                                          .blue),
                                                        ),
                                                        TimesStateWidget(
                                                          time: timesToSend(),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          AppButton(
                                            onTap: () {
                                              TabsRouterScope.of(context)
                                                  ?.controller
                                                  .setActiveIndex(2);
                                            },
                                            text: 'dream_interpretation'.tr(),
                                          ),
                                          SizedBox(height: 16.h),
                                          MainButton(
                                            onTap: () async {
                                              context.router
                                                  .push(UstazAitinizhiRoute());
                                            },
                                            text: '${'tell_me_ustaz'.tr()}...',
                                          ),
                                          SizedBox(height: 16.h),
                                          InkWell(
                                            onTap: () => context.router
                                                .push(UstazAitinizhiRoute()),
                                            child: Container(
                                              width: 1.sw,
                                              decoration: BoxDecoration(
                                                  gradient:
                                                      const LinearGradient(
                                                    begin: Alignment.topRight,
                                                    end: Alignment.bottomRight,
                                                    colors: [
                                                      Color(0xFFFAE0AB),
                                                      Color(0xFFF9A502),
                                                    ],
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24)),
                                              padding: EdgeInsets.only(
                                                  top: 19.r,
                                                  bottom: 19.r,
                                                  left: 92.r,
                                                  right: 92.r),
                                              child: Column(
                                                children: [
                                                  SvgPicture.asset(
                                                      Assets.boxStorySvg),
                                                  SizedBox(
                                                    height: 12.h,
                                                  ),
                                                  Text(
                                                    'can_question'.tr(),
                                                    textAlign: TextAlign.center,
                                                    style: getTextStyle(
                                                            CustomTextStyles
                                                                .s16w200)
                                                        .copyWith(
                                                            fontFamily:
                                                                FontTypes
                                                                    .Philosopher
                                                                    .name,
                                                            fontSize: 24.sp,
                                                            fontWeight:
                                                                FontWeight.w700)
                                                        .apply(
                                                            color: AppColors
                                                                .white),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 16.h),
                                          InkWell(
                                            onTap: () {
                                              context.router.push(
                                                NewsRoute(),
                                              );
                                            },
                                            child: MainButton(
                                              text: 'news'.tr(),
                                            ),
                                          ),
                                          SizedBox(height: 16.h),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 216.h,
                                      width: 1.sw,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        physics: const BouncingScrollPhysics(),
                                        itemCount: news.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding:
                                                EdgeInsets.only(right: 12.r),
                                            child: GestureDetector(
                                              onTap: () {
                                                context.router.push(
                                                  NewsDetailRoute(
                                                    id: news[index].id!,
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                height: 110.h,
                                                width: 180.w,
                                                decoration: BoxDecoration(
                                                  color: AppColors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(30),
                                                        topRight:
                                                            Radius.circular(30),
                                                      ),
                                                      child: CachedNetworkImage(
                                                        imageUrl:
                                                            news[index].cover ??
                                                                '',
                                                        fit: BoxFit.cover,
                                                        height: 110.h,
                                                        width: double.infinity,
                                                        errorWidget:
                                                            (a, b, c) =>
                                                                SizedBox(
                                                          height: 110.h,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 12.r),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 12.r,
                                                          top: 4.r,
                                                          bottom: 4.r),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(height: 2.h),
                                                          Text(
                                                              news[
                                                                          index]
                                                                      .title ??
                                                                  'ERROR',
                                                              overflow:
                                                                  TextOverflow
                                                                      .fade,
                                                              style: getTextStyle(
                                                                      CustomTextStyles
                                                                          .s14w400)
                                                                  .copyWith(
                                                                      fontFamily: FontTypes
                                                                          .SF_Pro
                                                                          .name,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: Colors
                                                                          .black)),
                                                          SizedBox(height: 2.h),
                                                          Text(
                                                            DateFormat(
                                                                    'dd.MM.yyyy')
                                                                .format(DateTime
                                                                    .parse(news[
                                                                            index]
                                                                        .createdAt
                                                                        .toString())),
                                                            style: getTextStyle(
                                                                    CustomTextStyles
                                                                        .s14w400)
                                                                .copyWith(
                                                                    fontFamily:
                                                                        FontTypes
                                                                            .SF_Pro
                                                                            .name,
                                                                    fontSize:
                                                                        12.sp)
                                                                .apply(
                                                                    color: AppColors
                                                                        .grey1),
                                                          ),
                                                          SizedBox(height: 4.h),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 165.h,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  int indexOfNextNames(List time) {
    late String namazName2;
    late int indexOfNamaz;
    try {
      namazName2 = time.firstWhere((element) => DateTime.now()
          .copyWith(
              hour: int.parse(element.toString().substring(0, 2)),
              minute: int.parse(element.toString().substring(3, 5)))
          .isAfter(DateTime.now()));
      indexOfNamaz = time.indexOf(namazName2);
      if (indexOfNamaz == time.length - 1) {
        return 0;
      }
    } catch (e) {
      log(e.toString());
      return 0;
    }

    return indexOfNamaz;
  }

  String beforeFormatter(List time) {
    late String test;
    try {
      test = time.lastWhere((element) => DateTime.now()
          .copyWith(
              hour: int.parse(element.toString().substring(0, 2)),
              minute: int.parse(element.toString().substring(3, 5)))
          .isBefore(DateTime.now()));
    } catch (e) {
      log(time.toString());
      log(e.toString());
      return time.last;
    }
    log(' TEST:::$test');
    return test;
  }

  String namasTimestoSend() {
    String beforeTime = beforeFormatter(times);
    String nextTime = '';
    for (int i = 0; i < times.length; i++) {
      if (times[i] == beforeTime) {
        log('TTTTT$i}');
        log('TTTTT${times.length}}');
        log('TTTTT${times[i]}fsaf');
        if (i == times.length - 1) {
          nextTime = times[0];
          break;
        } else {
          nextTime = times[i + 1];
        }
        break;
      }
    }
    return nextTime;
  }

  String timesToSend() {
    String beforeTime = beforeFormatter(times);
    String nextTime = '';
    for (int i = 0; i < times.length; i++) {
      if (times[i] == beforeTime) {
        if (i == times.length - 1) {
          nextTime = times[0];
          break;
        } else {
          nextTime = times[i + 1];
        }
        break;
      }
    }
    DateTime now = DateTime.now();
    String formattedTime = DateFormat.Hm().format(now);

    int nextHour = int.parse(nextTime.substring(0, 2));
    int currentHour = int.parse(formattedTime.substring(0, 2));
    int differenceMinutes = 0;
    int nextMinute = int.parse(nextTime.substring(3, 5));
    int currentMinute = int.parse(formattedTime.substring(3, 5));
    int nextMinutes = nextHour * 60 + nextMinute;
    int currentMinutes = currentHour * 60 + currentMinute;
    if (nextMinutes < currentMinutes) {
      differenceMinutes = 24 * 60 - currentMinutes + nextMinutes;
    } else {
      differenceMinutes = nextMinutes - currentMinutes;
    }
    int diffetenceHours = differenceMinutes ~/ 60;
    String timeH = diffetenceHours.toString();
    String timeM = (differenceMinutes - (diffetenceHours * 60)).toString();

    if (timeM.length < 2) {
      timeM = "0$timeM";
    }
    if (timeH.length < 2) {
      timeH = "0$timeH";
    }
    return "$timeH:$timeM";
  }
}

class TimesStateWidget extends StatefulWidget {
  final String time;

  const TimesStateWidget({
    super.key,
    required this.time,
  });

  @override
  State<TimesStateWidget> createState() => _TimesStateWidgetState();
}

class _TimesStateWidgetState extends State<TimesStateWidget> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countDown,
    presetMillisecond: StopWatchTimer.getMilliSecFromMinute(1),
  ); // Create instance.

  @override
  void initState() {
    log(' NEXT${widget.time.toString()}');
    _stopWatchTimer.setPresetHoursTime(int.parse(widget.time.substring(0, 2)));
    _stopWatchTimer.setPresetMinuteTime(int.parse(widget.time.substring(3, 5)));
    _stopWatchTimer.onStartTimer();
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose(); // Need to call dispose function.
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        stream: _stopWatchTimer.rawTime,
        initialData: 0,
        builder: (context, snap) {
          final value = snap.data;
          final displayTime =
              StopWatchTimer.getDisplayTime(value!, milliSecond: false);
          return Text(
            displayTime,
            style: getTextStyle(CustomTextStyles.s16w200)
                .apply(fontFamily: FontTypes.SF_Pro.name)
                .copyWith(fontWeight: FontWeight.w400, fontSize: 14.sp)
                .apply(color: AppColors.black),
          );
        });
  }
}
