import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/namaz_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/pillars_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/ablutions_cubit.dart';

import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_snackbars.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_tab_bar.dart';

class NamazPatternPage extends StatefulWidget {
  const NamazPatternPage({super.key});

  @override
  State<NamazPatternPage> createState() => _NamazPatternPageState();
}

int currentIndex = 0;

class _NamazPatternPageState extends State<NamazPatternPage> {
  @override
  void initState() {
    BlocProvider.of<AblutionsCubit>(context).ablutions(gender: 'M');
    BlocProvider.of<AblutionsCubit>(context).prayerTimes(gender: 'M');
    super.initState();
  }

  List<NamazDTO> abl = [];
  List<PillarsDTO> pre = [];
  final List<String> list = [
    Assets.wudhuSvg,
    Assets.nam1Svg,
    Assets.nam2Svg,
    Assets.nam3Svg,
    Assets.nam4Svg,
    Assets.nam5Svg,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: BlocConsumer<AblutionsCubit, AblutionsState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            errorState: (message) {
              buildErrorCustomSnackBar(context, message);
            },
            loaded: (abll, pree) {
              abl = abll;
              pre = pree;
            },
          ); //
          // TODO: implement listener
        },
        builder: (context, state) {
          return SizedBox(
            height: 1.sh,
            child: Stack(
              children: [
                Image.asset(
                  Assets.gradient,
                  fit: BoxFit.cover,
                ),
                Positioned(
                    // left: 280.r,
                    top: 10.r,
                    child: Opacity(
                      opacity: 0.5,
                      child: Image.asset(
                        'assets/images/x.png',
                        // colorBlendMode: ,
                        // opacity: 0.1,
                        width: 1.sw,
                      ),
                    )),
                SizedBox(
                  child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 56.h,
                            ),
                             CustomAppBar(
                              title: 'example_namaz'.tr(),
                            ),
                            SizedBox(
                              height: 36.h,
                            ),
                            CustomTabBar(
                              tabs:  [
                                Tab(
                                  text: 'male'.tr(),
                                ),
                                Tab(
                                  text: 'female'.tr(),
                                ),
                              ],
                              onTap: (int) {
                                if (currentIndex != 0) {
                                  BlocProvider.of<AblutionsCubit>(context)
                                      .ablutions(gender: 'M');
                                  BlocProvider.of<AblutionsCubit>(context)
                                      .prayerTimes(gender: 'M');
                                } else {
                                  BlocProvider.of<AblutionsCubit>(context)
                                      .ablutions(gender: 'F');
                                  BlocProvider.of<AblutionsCubit>(context)
                                      .prayerTimes(gender: 'F');
                                }
                                setState(() {
                                  currentIndex = int;
                                });
                              },
                              length: 2,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: GestureDetector(
                                onTap: () {
                                  log(abl.toString());
                                  context.router
                                      .push(WudhuPageRoute(wudhu: abl));
                                },
                                child: Container(
                                  height: 75.h,
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                    child: ListTile(
                                        iconColor: AppColors.black,
                                        leading: Container(
                                          width: 55.r,
                                          height: 55.r,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 14, horizontal: 14),
                                          decoration: BoxDecoration(
                                              gradient: AppColors
                                                  .gradientPrimaryActiveButton,
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: SvgPicture.asset(
                                            Assets.wudhuSvg,
                                          ),
                                        ),
                                        title: Text(
                                          'cleaning'.tr(),
                                          style: getTextStyle(
                                                  CustomTextStyles.s16w600)
                                              .apply(color: AppColors.black),
                                        ),
                                        trailing: const Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          size: 20,
                                        )),
                                  ),
                                ),
                              ),
                            ),
                            ListView.builder(
                              itemCount: pre.length,
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(0),
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      if (currentIndex != 0) {
                                        context.router.push(
                                          NamazReadPageRoute(
                                              id: pre[index].id,
                                              gender: 'F',
                                              type:
                                                  pre[index].title ?? 'ERROR'),
                                        );
                                      } else {
                                        context.router.push(
                                          NamazReadPageRoute(
                                              id: pre[index].id,
                                              gender: 'M',
                                              type:
                                                  pre[index].title ?? 'ERROR'),
                                        );
                                      }
                                    },
                                    child: Container(
                                      height: 75.h,
                                      decoration: BoxDecoration(
                                          color: AppColors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Center(
                                        child: ListTile(
                                            iconColor: AppColors.black,
                                            leading: Container(
                                              width: 55.r,
                                              height: 55.r,
                                              decoration: BoxDecoration(
                                                  gradient:
                                                      const LinearGradient(
                                                          colors: [
                                                        AppColors.orange,
                                                        AppColors.orange
                                                      ],
                                                          begin: Alignment
                                                              .topCenter,
                                                          end: Alignment
                                                              .bottomCenter),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    pre[index].cover ?? '',
                                                fit: BoxFit.cover,
                                                width: 45.w,
                                                errorWidget: (a, b, c) =>
                                                    SizedBox(
                                                  width: 45.w,
                                                  height: 45.h,
                                                ),
                                              ),
                                            ),
                                            title: Text(
                                              pre[index].title ?? 'ERROR',
                                              style: getTextStyle(
                                                      CustomTextStyles.s16w600)
                                                  .apply(
                                                      color: AppColors.black),
                                            ),
                                            subtitle: Text(
                                              pre[index].rakats ?? 'ERROR',
                                              style: getTextStyle(
                                                      CustomTextStyles.s14w400)
                                                  .apply(
                                                      color: AppColors.black),
                                            ),
                                            trailing: const Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              size: 20,
                                            )),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      )),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
