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
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/app_button.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_snackbars.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/main_button.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/banner_local_model.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/news_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/timings_cubit.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import '../../../auth/data/repositories/auth_repository.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<String> namasNames = [
    'Таң намазы',
    'Күн',
    'Бесін',
    'Екінті',
    'Ақшам',
    'Құптан'
  ];
  List<BannerLocalModel> list = [
    BannerLocalModel(
      title: 'Семинар',
      url: Assets.banner1Svg,
    ),
    BannerLocalModel(
      title: 'Қайырымдылық',
      url: Assets.banner2Svg,
    ),
    BannerLocalModel(
      title: 'Қызметтер',
      url: Assets.banner3Svg,
    ),
    BannerLocalModel(
      title: 'Тікелей эфир',
      url: Assets.banner4Svg,
    ),
    BannerLocalModel(
      title: 'Дүңгрішек',
      url: Assets.banner5Svg,
    ),
  ];

  final List<PageRouteInfo<dynamic>> myRouteHome = [
    SeminarPageRoute(),
    const CharityPageRoute(),
    const ServicesPageRoute(),
    LiveBroadcastsPageRoute(),
    const ShopPageRoute(),
  ];

  @override
  void initState() {
    // TODO: implement initState

    BlocProvider.of<NewsCubit>(context).news(page: 1, isFirstCall: true);
    BlocProvider.of<TimingsCubit>(context).timings(
      43.25,
      76.91667,
    );

    super.initState();
  }

  final now = DateTime.now();
  List times = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: BlocBuilder<TimingsCubit, TimingsState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.blue),
              );
            },
            loaded: (not, geo) {
              final namaz = not.toJson();
              times = namaz.values.toList();
              return BlocConsumer<NewsCubit, NewsState>(
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
                          color: AppColors.red,
                        ),
                      );
                    },
                    loadingState: () {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.yellow,
                        ),
                      );
                    },
                    loaded: (news) {
                      return GlobalCustomBody(
                        left: 16,
                        right: 0,
                        child: SizedBox(
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 16.0),
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
                                                  const NotificationPageRoute(),
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
                                                  const ProfileMainPageRoute(),
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
                                          padding: EdgeInsets.only(right: 8.r),
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
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: InkWell(
                                    onTap: () {
                                      context.router.push(
                                        NamazPageRoute(),
                                      );
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  '${geo.name ?? 'Алматы'}, ${DateFormat.yMMMd().format(DateTime.now())}',
                                                  style: getTextStyle(
                                                          CustomTextStyles
                                                              .s14w400)
                                                      .apply(
                                                          fontFamily: FontTypes
                                                              .SF_Pro.name)),
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
                                                // Text(
                                                //     '${namasNames[indexOfNextNames(times)]} намаз уақыты',
                                                //     style: getTextStyle(
                                                //             CustomTextStyles
                                                //                 .s16w200)
                                                //         .apply(
                                                //             fontFamily:
                                                //                 FontTypes.SF_Pro
                                                //                     .name)
                                                //         .copyWith(
                                                //             fontWeight:
                                                //                 FontWeight
                                                //                     .w400)),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                // Text(
                                                //   namasTimestoSend(),
                                                //   style: getTextStyle(
                                                //           CustomTextStyles
                                                //               .s16w200)
                                                //       .apply(
                                                //           fontFamily: FontTypes
                                                //               .SF_Pro.name)
                                                //       .copyWith(
                                                //           fontWeight:
                                                //               FontWeight.w500)
                                                //       .apply(
                                                //           color:
                                                //               AppColors.blue),
                                                // ),
                                                // TimesStateWidget(
                                                //   time: timesToSend(),
                                                // )
                                              ],
                                            )
                                          ],
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
                                          text: 'Түс жору',
                                        ),
                                        SizedBox(height: 16.h),
                                        MainButton(
                                          onTap: () async {
                                            context.router
                                                .push(UstazAitinizhiRoute());
                                          },
                                          text: 'Ұстаз айтыңызшы...',
                                        ),
                                        SizedBox(height: 16.h),
                                        InkWell(

                                          onTap: () => context.router
                                              .push(UstazAitinizhiRoute()),


                                          child: Container(
                                            width: 1.sw,
                                            decoration: BoxDecoration(
                                                gradient: const LinearGradient(
                                                  begin: Alignment.topRight,
                                                  end: Alignment.bottomRight,
                                                  colors: [
                                                    Color(0xFFFAE0AB),
                                                    Color(0xFFF9A502),
                                                  ],
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(24)),
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
                                                  'Бола ма?\nБолмай ма?',
                                                  textAlign: TextAlign.center,
                                                  style: getTextStyle(
                                                          CustomTextStyles
                                                              .s16w200)
                                                      .copyWith(
                                                          fontFamily: FontTypes
                                                              .Philosopher.name,
                                                          fontSize: 24.sp,
                                                          fontWeight:
                                                              FontWeight.w700)
                                                      .apply(
                                                          color:
                                                              AppColors.white),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 16.h),
                                        InkWell(
                                          onTap: () {
                                            context.router.push(
                                              NewsPageRoute(),
                                            );
                                          },
                                          child: const MainButton(
                                            text: 'Жаңалықтар',
                                          ),
                                        ),
                                        SizedBox(height: 16.h),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 176.h,
                                  width: 1.sw,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: news.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.only(right: 12.r),
                                        child: GestureDetector(
                                          onTap: () {
                                            context.router.push(
                                              NewsDetailPageRoute(
                                                  result: news[index],
                                                  isFav: news[index].isSaved!),
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
                                                    topLeft:
                                                        Radius.circular(30),
                                                    topRight:
                                                        Radius.circular(30),
                                                  ),
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                        news[index].cover ?? '',
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(height: 2.h),
                                                      Text(
                                                          news[
                                                                      index]
                                                                  .title ??
                                                              'ERROR',
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: getTextStyle(
                                                                  CustomTextStyles
                                                                      .s14w400)
                                                              .copyWith(
                                                                  fontFamily:
                                                                      FontTypes
                                                                          .SF_Pro
                                                                          .name,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .black)),
                                                      SizedBox(height: 2.h),
                                                      Text(
                                                        DateFormat('dd.MM.yyyy')
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
                                                                fontSize: 12.sp)
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
                                  height: 25.h,
                                )
                              ],
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
    log(' TEST:::${test}');
    return test;
  }

  String namasTimestoSend() {
    String beforeTime = beforeFormatter(times);
    String nextTime = '';
    for (int i = 0; i < times.length; i++) {
      if (times[i] == beforeTime) {
        if (times[i] == times.length - 1) {
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
        if (times[i] == times.length - 1) {
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
    String timeH = ((int.parse(nextTime.substring(0, 2))) -
            (int.parse(formattedTime.substring(0, 2))))
        .toString();
    String timeM = ((int.parse(nextTime.substring(3, 5))) -
            (int.parse(formattedTime.substring(3, 5))))
        .toString();

    if (timeM.length < 2) {
      timeM = "0$timeM";
    }
    if (timeH.length < 2) {
      timeH = "0$timeH";
    }
    return "$timeH$timeM";
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
    _stopWatchTimer.setPresetMinuteTime(int.parse(widget.time.substring(2, 4)));
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
            '-${displayTime}',
            style: getTextStyle(CustomTextStyles.s16w200)
                .apply(fontFamily: FontTypes.SF_Pro.name)
                .copyWith(fontWeight: FontWeight.w400, fontSize: 14.sp)
                .apply(color: AppColors.black),
          );
        });
  }
}
