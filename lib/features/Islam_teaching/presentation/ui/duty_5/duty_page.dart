import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/pillars_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/widgets/islam_teaching_grid_view_card.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_snackbars.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/banner_local_model.dart';

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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16).w,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: (60 / 54).r,
                              crossAxisCount: 2,
                              crossAxisSpacing: 16.0,
                              mainAxisSpacing: 16.0,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              final item = list[index];
                              return IslamTeachingGridViewCard(
                                title: state.pillars[index].title ?? 'ERROR',
                                svgPicturePath: item.url,
                                withShadow: true,
                                backgroundColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                onTap: () {
                                  context.router.push(
                                    DutyDetailRoute(
                                      pillarsDTO: state.pillars[index],
                                    ),
                                  );
                                },
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
