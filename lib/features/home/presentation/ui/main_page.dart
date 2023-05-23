import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/app_button.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_widget.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/main_button.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/banner_local_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<BannerLocalModel> list = [
    BannerLocalModel(
        title: 'Семинар', url: Assets.banner1Svg, route: 'SeminarPageRoute'),
    BannerLocalModel(
        title: 'Қайырымдылық',
        url: Assets.banner2Svg,
        route: 'CharityPageRoute'),
    BannerLocalModel(
        title: 'Қызметтер', url: Assets.banner3Svg, route: 'CharityPageRoute'),
    BannerLocalModel(
        title: 'Тікелей эфир',
        url: Assets.banner4Svg,
        route: 'CharityPageRoute'),
    BannerLocalModel(
        title: 'Дүңгрішек', url: Assets.banner5Svg, route: 'CharityPageRoute'),
  ];

  final myRouteHome = [
    const SeminarPageRoute(),
    const CharityPageRoute(),
    const ServicesPageRoute(),
    const LiveBroadcastsPageRoute(),
    const ShopPageRoute(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: GlobalCustomBody(
        child: SizedBox(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            child: SvgPicture.asset(Assets.notiSvg)),
                        SizedBox(
                          width: 8.r,
                        ),
                        SvgPicture.asset(Assets.userSvg),
                      ],
                    ),
                  ],
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
                      for (int n = 0; n < myRouteHome.length; n++) {}
                      return InkWell(
                        onTap: () {
                          context.router.push(
                            myRouteHome[index],
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 8.r),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.r),
                            height: 56,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(75),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(list[index].url),
                                SizedBox(width: 8.r),
                                Text(list[index].title,
                                    style:
                                        getTextStyle(CustomTextStyles.s14w400)
                                            .apply(
                                                fontFamily: FontTypes
                                                    .Philosopher.name)),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        context.router.push(
                          const NamazPageRoute(),
                        );
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Алматы, 7 наурыз 2023',
                                style: getTextStyle(CustomTextStyles.s14w400)
                                    .apply(fontFamily: FontTypes.SF_Pro.name)),
                            // SizedBox(
                            //   width: 175.w,
                            // ),
                            SvgPicture.asset(Assets.arrowUpOutlineSvg),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(Assets.shalatSvg),
                            SizedBox(
                              width: 10.r,
                            ),
                            Text('Таң намазы уақыты',
                                style: getTextStyle(CustomTextStyles.s16w200)
                                    .apply(fontFamily: FontTypes.SF_Pro.name)
                                    .copyWith(fontWeight: FontWeight.w400)),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '05 : 11',
                              style: getTextStyle(CustomTextStyles.s16w200)
                                  .apply(fontFamily: FontTypes.SF_Pro.name)
                                  .copyWith(fontWeight: FontWeight.w500)
                                  .apply(color: AppColors.blue),
                            ),
                            Text(
                              '– 00 : 53 : 29',
                              style: getTextStyle(CustomTextStyles.s16w200)
                                  .apply(fontFamily: FontTypes.SF_Pro.name)
                                  .copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp)
                                  .apply(color: AppColors.black),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    AppButton(
                      onTap: () {},
                      text: 'Түс жору',
                      color: const Color(0xFF2941F4),
                    ),
                    SizedBox(height: 16.h),
                    const MainButton(
                      text: 'Ұстаз айтыңызшы...',
                    ),
                    SizedBox(height: 16.h),
                    Container(
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
                          borderRadius: BorderRadius.circular(24)),
                      padding: EdgeInsets.only(
                          top: 19.r, bottom: 19.r, left: 92.r, right: 92.r),
                      child: Column(
                        children: [
                          SvgPicture.asset(Assets.boxStorySvg),
                          SizedBox(
                            height: 12.h,
                          ),
                          Text(
                            'Бола ма?\nБолмай ма?',
                            textAlign: TextAlign.center,
                            style: getTextStyle(CustomTextStyles.s16w200)
                                .copyWith(
                                    fontFamily: FontTypes.Philosopher.name,
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w700)
                                .apply(color: AppColors.white),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    const MainButton(
                      text: 'Жаңалықтар',
                    ),
                    SizedBox(height: 16.h),
                    SizedBox(
                      height: 176.h,
                      width: 1.sw,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: 9,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 12.r),
                            child: GestureDetector(
                              onTap: () {
                                context.router.push(
                                  const NewsPageRoute(),
                                );
                              },
                              child: Container(
                                height: 110.h,
                                width: 180.w,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Image.asset(
                                        Assets.Islam,
                                        fit: BoxFit.cover,
                                        height: 110.h,
                                      ),
                                    ),
                                    SizedBox(width: 12.r),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 12.r, top: 4.r, bottom: 4.r),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 2.h),
                                          Text('Жаңалық тақырыбы',
                                              style: getTextStyle(
                                                      CustomTextStyles.s14w400)
                                                  .copyWith(
                                                      fontFamily:
                                                          FontTypes.SF_Pro.name,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black)),
                                          SizedBox(height: 2.h),
                                          Text(
                                            '10.02.2023',
                                            style: getTextStyle(
                                                    CustomTextStyles.s14w400)
                                                .copyWith(
                                                    fontFamily:
                                                        FontTypes.SF_Pro.name,
                                                    fontSize: 12.sp)
                                                .apply(color: AppColors.grey1),
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
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
