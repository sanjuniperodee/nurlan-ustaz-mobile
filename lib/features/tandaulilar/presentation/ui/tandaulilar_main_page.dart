import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/app/bloc/other_list_bloc/language_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_snackbars.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/tandaulilar/presentation/bloc/tandaulilar_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/tandaulilar/presentation/widgets/category_card.dart';
import 'package:nurlan_ustaz_flutter/features/tandaulilar/presentation/widgets/category_title_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TandaulilarMainPage extends StatefulWidget {
  const TandaulilarMainPage({super.key});

  @override
  State<TandaulilarMainPage> createState() => _TandaulilarMainPageState();
}

class _TandaulilarMainPageState extends State<TandaulilarMainPage> {
  RefreshController controller = RefreshController();
  @override
  void initState() {
    BlocProvider.of<TandaulilarCubit>(context)
        .livesT(page: 1, isFirstCall: true, isSaved: true);
    BlocProvider.of<TandaulilarCubit>(context)
        .newsT(page: 1, isFirstCall: true, isSaved: true);
    BlocProvider.of<TandaulilarCubit>(context)
        .seminarT(page: 1, isFirstCall: true, isSaved: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        body: BlocConsumer<TandaulilarCubit, TandaulilarState>(
          listener: (context, state) {
            state.maybeWhen(orElse: () {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.linearBlue),
              );
            }, errorState: (message) {
              buildErrorCustomSnackBar(context, message);
            });
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
              loaded: (lives, news, seminars) {
                return GlobalCustomBody(
                  left: 16,
                  right: 16,
                  child: SizedBox(
                    child: SmartRefresher(
                      enablePullDown: true,
                      controller: controller,
                      header: CustomHeader(
                        builder: (context, mode) {
                          return Container(); // Return an empty container to remove the default text
                        },
                      ),
                      onRefresh: () {
                        BlocProvider.of<TandaulilarCubit>(context)
                            .livesT(page: 1, isFirstCall: true, isSaved: true);
                        BlocProvider.of<TandaulilarCubit>(context)
                            .newsT(page: 1, isFirstCall: true, isSaved: true);
                        BlocProvider.of<TandaulilarCubit>(context).seminarT(
                            page: 1, isFirstCall: true, isSaved: true);
                      },
                      child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 22.h),
                              Text('MyFavourite'.tr(),
                                  style: getTextStyle(CustomTextStyles.s36w700)
                                      .apply(
                                          fontFamily:
                                              FontTypes.Philosopher.name,
                                          color: AppColors.white)),
                              SizedBox(height: 24.h),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CategoryCard(
                                        title: 'news'.tr(),
                                        imageList: news,
                                        onTap: () {
                                          context.router.push(
                                            NewsPageRoute(type: 'isSave'),
                                          );
                                        },
                                      ),
                                      CategoryCard(
                                        title: 'live'.tr(),
                                        imageList: lives,
                                        onTap: () {
                                          context.router.push(
                                            LiveBroadcastsPageRoute(
                                                type: 'isSave'),
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 11,
                                  ),
                                  CategoryCard(
                                    title: 'seminars'.tr(),
                                    imageList: seminars,
                                    titleColor: AppColors.blue,
                                    onTap: () {
                                      context.router.push(
                                        SeminarPageRoute(type: 'isSave'),
                                      );
                                    },
                                  ),
                                  SizedBox(
                                    height: 32.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CategoryTitleCard(
                                          title: 'dream_interpretations'.tr(),
                                          onTap: () {
                                            context.router.push(
                                              TusZhoruPageRoute(type: 'isSave'),
                                            );
                                          }),
                                      CategoryTitleCard(
                                          title: 'names'.tr(),
                                          onTap: () {
                                            context.router.push(
                                              NamePageRoute(type: 'isSave'),
                                            );
                                          }),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 9.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CategoryTitleCard(
                                          title: 'Duas'.tr(),
                                          onTap: () {
                                            context.router.push(
                                              PrayersPageRoute(type: 'isSave'),
                                            );
                                          }),
                                      CategoryTitleCard(
                                          title: 'Zikrs'.tr(),
                                          onTap: () {
                                            context.router.push(
                                              DhikrPageRoute(type: 'isSave'),
                                            );
                                          }),
                                    ],
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
