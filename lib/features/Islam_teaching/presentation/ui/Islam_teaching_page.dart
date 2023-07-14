import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/ayat_of_day_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/widgets/ayat_day__card_widget.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/app_button.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_snackbars.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/banner_local_model.dart';
import 'package:url_launcher/url_launcher.dart';

class IslamTeachingPage extends StatefulWidget {
  const IslamTeachingPage({super.key});

  @override
  State<IslamTeachingPage> createState() => _IslamTeachingPageState();
}

class _IslamTeachingPageState extends State<IslamTeachingPage> {
  List<BannerLocalModel> list = [
    BannerLocalModel(
      title: '5 парыз',
      url: Assets.duty5Svg,
    ),
    BannerLocalModel(
      title: 'Алланың  99\nесімі',
      url: Assets.allahSvg,
    ),
    BannerLocalModel(
      title: 'Пәтуә бөлімі',
      url: Assets.scheduleSvg,
    ),
    BannerLocalModel(
      title: 'Сүрелер',
      url: Assets.quranSvg,
    ),
    BannerLocalModel(
      title: 'Дұғалар',
      url: Assets.praySvg,
    ),
    BannerLocalModel(
      title: 'Зікірлер',
      url: Assets.tasbihSvg,
    ),
  ];
  final myRouteHome = [
    const DutyPageRoute(),
    const AllahNamesPageRoute(),
    const AllahNamesPageRoute(),
    const SurahPageRoute(),
    PrayersPageRoute(),
    DhikrPageRoute(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<AyatOfDayCubit>(context).auatOfDay();
    BlocProvider.of<AyatOfDayCubit>(context).fatya();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: BlocConsumer<AyatOfDayCubit, AyatOfDayState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            errorState: (message) {
              buildErrorCustomSnackBar(context, message);
            },
          ); //          // TODO: implement listener
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
            loaded: (ayat, fatyas) {
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
                        child: Image.asset(
                          'assets/images/x.png',
                          // colorBlendMode: ,
                          // opacity: 0.1,
                          width: 1.sw,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16).r,
                      child: SizedBox(
                        child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 82.h),
                                Text('Ислам\nілімі',
                                    style:
                                        getTextStyle(CustomTextStyles.s36w700)
                                            .apply(
                                                fontFamily:
                                                    FontTypes.Philosopher.name,
                                                color: AppColors.white)),
                                SizedBox(height: 24.h),
                                ayat.id == null
                                    ? const SizedBox()
                                    : GestureDetector(
                                        onTap: () {
                                          context.router.push(
                                            AyatDayPageRoute(ayatDTO: ayat),
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
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    for (int n = 0;
                                        n < myRouteHome.length;
                                        n++) {}
                                    return InkWell(
                                      onTap: () {
                                        list[index].title == 'Пәтуә бөлімі'
                                            ? _launchUrl(
                                                fatyas.first.url ?? 'ERROR')
                                            : context.router.push(
                                                myRouteHome[index],
                                              );
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 16,
                                            right: 16,
                                            top: 10,
                                            bottom: 10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12).r,
                                            gradient: LinearGradient(
                                              begin: Alignment.topRight,
                                              end: Alignment.bottomLeft,
                                              colors: [
                                                const Color(0xFF1151C2)
                                                    .withOpacity(0.18),
                                                const Color(0xFF8F8CF7)
                                                    .withOpacity(0.18),
                                              ],
                                            )),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SvgPicture.asset(list[index].url),
                                            SizedBox(
                                              height: 12.h,
                                            ),
                                            Text(
                                              list[index].title,
                                              style: getTextStyle(
                                                      CustomTextStyles.s16w500)
                                                  .apply(
                                                      color: AppColors.black),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: GestureDetector(
                                                  onTap: () {},
                                                  child: const Icon(
                                                    Icons
                                                        .arrow_forward_ios_rounded,
                                                    color: AppColors.orange,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                AppButton(
                                    onTap: () {
                                      context.router.push(NamePageRoute());
                                    },
                                    text: 'Есімдер мағынасы'),
                                SizedBox(
                                  height: 16.h,
                                ),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _launchUrl(String _urll) async {
    final Uri _url = Uri.parse('${_urll}');
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
