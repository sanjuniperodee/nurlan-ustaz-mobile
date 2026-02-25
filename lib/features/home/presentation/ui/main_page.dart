import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/core/widgets/action_result_widget.dart';
import 'package:nurlan_ustaz_flutter/core/widgets/app_progress_indicator.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/app_button.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/main_button.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/banner_local_model.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/news_main_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/timings_cubit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

@RoutePage(name: 'MainRouterPage')
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  RefreshController controller = RefreshController();

  final List<PageRouteInfo<dynamic>> myRouteHome = [
    SeminarRoute(),
    // const CharityRoute(),
    const ServicesRoute(),
    LiveBroadcastsRoute(),
    const ShopRoute(),
  ];

  @override
  void initState() {
    context.read<NewsMainCubit>().newsMain(
          currentPage: 1,
          // isFirstCall: true,
        );

    // _logAppOpen();
    // TODO: полчему координаты захардкожены
    context.read<TimingsCubit>().timings(
          43.25,
          76.91667,
        );
    super.initState();
  }

  final now = DateTime.now();
  List times = [];
  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: BlocBuilder<TimingsCubit, TimingsState>(
        builder: (context, state) {
          // ignore: avoid_print
          print('MainPage: TimingsCubit state = ${state.runtimeType}');
          return switch (state) {
            TimingsErrorState(:final message) => ActionResultPage.error(
                automaticallyImplyCloseButton: false,
                automaticallyImplyPopButton: false,
                content: message,
                bottom: AppButton(
                  onTap: () {
                    context.read<TimingsCubit>().timings(43.25, 76.91667);
                  },
                  text: context.tr('retry'),
                ),
              ),
            TimingsLoadedState() => _buildMainContent(context, state),
            _ => const Center(
                child: CircularProgressIndicator(color: AppColors.linearBlue),
              ),
          };
        },
      ),
    );
  }

  Widget _buildMainContent(BuildContext context, TimingsLoadedState timingState) {
    final not = timingState.not;
    final geo = timingState.geo;
    final namaz = not.toJson();
    times = namaz.values.toList();
    final namasNames = [
      'Fajr'.tr(),
      'Күн',
      'Zukhr'.tr(),
      'Asr'.tr(),
      'Maghrib'.tr(),
      'Isha'.tr()
    ];
    final list = [
      BannerLocalModel(title: 'seminar'.tr(), url: Assets.banner1Svg),
      BannerLocalModel(title: 'Services'.tr(), url: Assets.banner3Svg),
      BannerLocalModel(title: 'live'.tr(), url: Assets.banner4Svg),
      BannerLocalModel(title: 'shop'.tr(), url: Assets.banner5Svg),
    ];
    return BlocBuilder<NewsMainCubit, NewsMainState>(
            builder: (context, state) {
              return switch (state) {
                NewsMainErrorState() => ActionResultPage.error(
                    automaticallyImplyCloseButton: false,
                    automaticallyImplyPopButton: false,
                    content:
                        context.tr('error.information_passed_to_developers'),
                    bottom: AppButton(
                      onTap: () {
                        context.read<NewsMainCubit>().newsMain(
                              currentPage: 1,
                            );
                      },
                      text: context.tr('retry'),
                    ),
                  ),
                NewsMainLoadedState(:final res) => GlobalCustomBody(
                    padding: EdgeInsets.zero,
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
                          context.read<NewsMainCubit>().newsMain(
                                currentPage: 1,
                                // isFirstCall: true,
                              );
                          // TODO: почему координаты захардкожены
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
                              SizedBox(
                                height: 45.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 16.h,
                                  right: 16.w,
                                  left: 16.w,
                                ).r,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      'assets/images/new_l.png',
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
                                            Assets.userSvg,
                                          ),
                                        ),
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
                                    return InkWell(
                                      onTap: () {
                                        context.router.push(
                                          myRouteHome[index],
                                        );
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            right: 10.r,
                                            left: index == 0 ? 17 : 0),
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
                                              SvgPicture.asset(list[index].url),
                                              SizedBox(width: 8.r),
                                              Text(list[index].title,
                                                  style: getTextStyle(
                                                          CustomTextStyles
                                                              .s16w400)
                                                      .apply(
                                                          fontFamily: FontTypes
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
                                padding:
                                    const EdgeInsets.only(right: 16.0, left: 16)
                                        .r,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                            alignment: Alignment.centerLeft,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    '${geo.name ?? 'Алматы'}, ${DateFormat('dd.MM.yyyy', context.locale.languageCode).format(DateTime.now()).toLocale()}',
                                                    style: getTextStyle(
                                                            CustomTextStyles
                                                                .s16w400)
                                                        .apply(
                                                            fontFamily:
                                                                FontTypes
                                                                    .Philosopher
                                                                    .name)),
                                                // SizedBox(
                                                //   width: 175.w,
                                                // ),
                                                SvgPicture.asset(
                                                    Assets.arrowUpOutlineSvg),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 16.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
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
                                                                  .s16w400)
                                                          .apply(
                                                              fontFamily:
                                                                  FontTypes
                                                                      .Philosopher
                                                                      .name)),
                                                ],
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    namasTimestoSend(),
                                                    style: getTextStyle(
                                                            CustomTextStyles
                                                                .s16w400)
                                                        .apply(
                                                            fontFamily:
                                                                FontTypes
                                                                    .Philosopher
                                                                    .name)
                                                        .apply(
                                                            color:
                                                                AppColors.blue),
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
                                    // SizedBox(
                                    //   height: 100.h,
                                    //   child: MaterialButton(
                                    //     onPressed: () {
                                    //       TabsRouterScope.of(context)
                                    //           ?.controller
                                    //           .setActiveIndex(2);
                                    //     },
                                    //     child: OverflowBox(
                                    //         minWidth: 345.w,
                                    //         maxWidth: 345.w,
                                    //         minHeight: 75.h,
                                    //         maxHeight: 75.h,
                                    //         child: Lottie.asset(
                                    //             'assets/animations/tus_zhoru_button_${EasyLocalization.of(
                                    //                 context)!
                                    //                 .locale
                                    //                 .toString() ==
                                    //                 'kk' ? 'kz' : 'ru'}.json')),
                                    //   ),
                                    // ),
                                    MainButton(
                                      onTap: () async {
                                        context.router
                                            .push(UstazAitinizhiRoute());
                                      },
                                      text: '${'tell_me_ustaz'.tr()}...',
                                    ),
                                    SizedBox(height: 16.h),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 180.h,
                                      child: InkWell(
                                        onTap: () => context.router
                                            .push(const UstazAitinizhiRoute()),
                                        child: Hero(
                                          tag: 'UA',
                                          child: Image.asset(
                                            'assets/images/ustaz_aitinizh.png',
                                            fit: BoxFit.fill,
                                          ),
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
                                  itemCount: res.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          right: 12.r,
                                          left: index == 0 ? 16 : 0),
                                      child: GestureDetector(
                                        onTap: () {
                                          context.router.push(
                                            NewsDetailRoute(
                                              id: res[index].id!,
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
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(30),
                                                  topRight: Radius.circular(30),
                                                ),
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      res[index].cover ?? '',
                                                  fit: BoxFit.cover,
                                                  height: 110.h,
                                                  width: double.infinity,
                                                  errorWidget: (a, b, c) =>
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
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(height: 2.h),
                                                    Text(
                                                        res[index].title ??
                                                            'ERROR',
                                                        overflow:
                                                            TextOverflow.fade,
                                                        style: getTextStyle(
                                                                CustomTextStyles
                                                                    .s16w400)
                                                            .apply(
                                                                fontFamily:
                                                                    FontTypes
                                                                        .Philosopher
                                                                        .name)),
                                                    SizedBox(height: 2.h),
                                                    Text(
                                                      DateFormat('dd.MM.yyyy')
                                                          .format(DateTime
                                                              .parse(res[index]
                                                                  .createdAt
                                                                  .toString())),
                                                      style: getTextStyle(
                                                              CustomTextStyles
                                                                  .s16w400)
                                                          .apply(
                                                              fontFamily:
                                                                  FontTypes
                                                                      .Philosopher
                                                                      .name)
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
                                height: 145.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                _ => const AppProgressIndicator(),
              };
            },
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

          if (!_stopWatchTimer.isRunning) {
            _stopWatchTimer.onStopTimer();
            // TODO: WTH
            BlocProvider.of<TimingsCubit>(context)
                .timings(
              43.25,
              76.91667,
            )
                .then((value) {
              _stopWatchTimer
                  .setPresetHoursTime(int.parse(widget.time.substring(0, 2)));
              _stopWatchTimer
                  .setPresetMinuteTime(int.parse(widget.time.substring(3, 5)));
              _stopWatchTimer.onStartTimer();
            });
          }
          return Text(
            displayTime,
            style: getTextStyle(CustomTextStyles.s16w400)
                .apply(fontFamily: FontTypes.Philosopher.name)
                .apply(color: AppColors.black),
          );
        });
  }
}
