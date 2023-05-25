import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/banner_local_model.dart';

class TandaulilarMainPage extends StatefulWidget {
  const TandaulilarMainPage({super.key});

  @override
  State<TandaulilarMainPage> createState() => _TandaulilarMainPageState();
}

class _TandaulilarMainPageState extends State<TandaulilarMainPage> {
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
    const FatuaPageRoute(),
    const SurahPageRoute(),
    const PrayersPageRoute(),
    const DhikrPageRoute(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: SizedBox(
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
                        Text('Таңдауым',
                            style: getTextStyle(CustomTextStyles.s36w700).apply(
                                fontFamily: FontTypes.Philosopher.name,
                                color: AppColors.white)),
                        SizedBox(height: 24.h),

                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
