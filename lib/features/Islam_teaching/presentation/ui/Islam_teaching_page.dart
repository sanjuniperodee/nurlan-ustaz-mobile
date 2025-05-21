import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/ayat_of_day_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/widgets/ayat_day__card_widget.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/widgets/islam_teaching_grid_view_card.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/app_button.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_snackbars.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/banner_local_model.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage(name: 'IslamTeachingRouterPage')
class IslamTeachingPage extends StatefulWidget {
  const IslamTeachingPage({super.key});

  @override
  State<IslamTeachingPage> createState() => _IslamTeachingPageState();
}

class _IslamTeachingPageState extends State<IslamTeachingPage> {
  final myRouteHome = [
    const DutyRoute(),
    const AllahNamesRoute(),
    const AllahNamesRoute(),
    const SurahRoute(),
    PrayersRoute(),
    DhikrRoute(),
  ];
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AyatOfDayCubit>(context).auatOfDay();
    BlocProvider.of<AyatOfDayCubit>(context).fatya();
  }

  @override
  Widget build(BuildContext context) {
    List<BannerLocalModel> list = [
      BannerLocalModel(
        title: 'Pillars'.tr(),
        url: Assets.duty5Svg,
      ),
      BannerLocalModel(
        title: 'Allah_names'.tr(),
        url: Assets.allahSvg,
      ),
      BannerLocalModel(
        title: 'Fatwa'.tr(),
        url: Assets.scheduleSvg,
      ),
      BannerLocalModel(
        title: 'Surahs'.tr(),
        url: Assets.quranSvg,
      ),
      BannerLocalModel(
        title: 'Duas'.tr(),
        url: Assets.praySvg,
      ),
      BannerLocalModel(
        title: 'Zikrs'.tr(),
        url: Assets.tasbihSvg,
      ),
    ];
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: BlocConsumer<AyatOfDayCubit, AyatOfDayState>(
        listener: (context, state) {
          if (state is AyatOfDayErrorState) {
            buildErrorCustomSnackBar(context, state.message);
          }
        },
        builder: (context, state) {
          // TODO: error widget
          if (state is! AyatOfDayLoadedState) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.linearBlue,
              ),
            );
          }

          final ayat = state.ayat;
          final fatyas = state.pillars;
          return SizedBox(
            height: 1.1.sh,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Lottie.asset('assets/animations/Book_V04.json',
                      fit: BoxFit.cover),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16).r,
                  child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 55.h),
                          Text('Islam_study'.tr(),
                              style: getTextStyle(CustomTextStyles.s36w700)
                                  .apply(
                                      fontFamily: FontTypes.Philosopher.name,
                                      color: AppColors.white)),
                          SizedBox(height: 24.h),
                          ayat.id == null
                              ? const SizedBox()
                              : GestureDetector(
                                  onTap: () {
                                    context.router.push(
                                      AyatDayRoute(ayatDTO: ayat),
                                    );
                                  },
                                  child: AyatDayCardWidget(
                                    ayatDTO: ayat,
                                  )),
                          SizedBox(height: 20.h),
                          GridView.builder(
                            itemCount: list.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.all(0),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: (60 / 50),
                              crossAxisSpacing: 16.0,
                              mainAxisSpacing: 16.0,
                            ),
                            itemBuilder: (context, index) {
                              final item = list[index];
                              return IslamTeachingGridViewCard(
                                title: item.title,
                                svgPicturePath: item.url,
                                onTap: () {
                                  item.title == 'Fatwa'.tr()
                                      ? _launchUrl(fatyas.first.url ?? 'ERROR')
                                      : context.router.push(
                                          myRouteHome[index],
                                        );
                                },
                              );
                            },
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          AppButton(
                              onTap: () {
                                context.router.push(NameRoute());
                              },
                              text: 'name_meaning'.tr()),
                          SizedBox(
                            height: 165.h,
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

  Future<void> _launchUrl(String urll) async {
    final Uri url = Uri.parse(urll);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
