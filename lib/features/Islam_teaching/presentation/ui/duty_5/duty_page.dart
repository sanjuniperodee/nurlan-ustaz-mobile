import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/pillars_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_snackbars.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/banner_local_model.dart';

import '../../../../../core/common/app_styles.dart';

@RoutePage()
class DutyPage extends StatefulWidget {
  const DutyPage({super.key});

  @override
  State<DutyPage> createState() => _DutyPageState();
}

class _DutyPageState extends State<DutyPage> {
  List<BannerLocalModel> list = [
    BannerLocalModel(
      title: 'Iman'.tr(),
      url: Assets.mosqueSvg,
    ),
    BannerLocalModel(
      title: 'Namaz'.tr(),
      url: Assets.prayer_3Svg,
    ),
    BannerLocalModel(
      title: 'Zakat'.tr(),
      url: Assets.zakatSvg,
    ),
    BannerLocalModel(
      title: 'Oraza'.tr(),
      url: Assets.pray_5Svg,
    ),
    BannerLocalModel(
      title: 'hajj'.tr(),
      url: Assets.kaabaSvg,
    ),
  ];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<PillarsCubit>(context).pillars();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: BlocConsumer<PillarsCubit, PillarsState>(
        listener: (context, state) {
          if (state is PillarsErrorState) {
            buildErrorCustomSnackBar(context, state.message);
          }
        },
        builder: (context, state) {
          // TODO: error widget
          if (state is! PillarsLoadedState) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.linearBlue,
              ),
            );
          }

          // log('namazzzzz-${pillars.map((e) => e.toString()).toList().toString()}');
          return SizedBox(
            height: 1.sh,
            child: Stack(
              children: [
                Image.asset(
                  Assets.gradient,
                  fit: BoxFit.cover,
                ),
                Positioned.fill(
                    // left: 280.r,
                    child: Opacity(
                  opacity: 0.5,
                  child: Lottie.asset('assets/animations/Book_V04.json',
                      fit: BoxFit.cover),
                )),
                SizedBox(
                  child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 46.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: CustomAppBar(
                              title: 'Pillars'.tr(),
                            ),
                          ),
                          SizedBox(
                            height: 36.h,
                          ),
                          GridView.builder(
                            itemCount: state.pillars.length,
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(0),
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: (60 / 54).r,
                              // crossAxisSpacing: 1.0,
                              mainAxisSpacing: 16.0,
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 16.0, right: 16)
                                        .r,
                                child: InkWell(
                                  onTap: () {
                                    context.router.push(DutyDetailRoute(
                                        pillarsDTO: state.pillars[index]));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 34, horizontal: 24),
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(42.0),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                          list[index].url,
                                          height: 50,
                                        ),
                                        SizedBox(
                                          height: 12.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              state.pillars[index].title ??
                                                  'ERROR',
                                              overflow: TextOverflow.ellipsis,
                                              style: getTextStyle(
                                                      CustomTextStyles.s16w500)
                                                  .apply(
                                                      color: AppColors.black),
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              color: AppColors.orange,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        // const Align(
                                        //   alignment: Alignment.centerRight,
                                        //   child: Icon(
                                        //     Icons
                                        //         .arrow_forward_ios_outlined,
                                        //     color: AppColors.orange,
                                        //   ),
                                        // )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
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
