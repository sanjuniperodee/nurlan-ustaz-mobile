import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/banner_local_model.dart';
import 'package:nurlan_ustaz_flutter/features/tandaulilar/presentation/widgets/category_card.dart';
import 'package:nurlan_ustaz_flutter/features/tandaulilar/presentation/widgets/category_title_card.dart';

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
    final List<String> news = <String>[
      'assets/images/example_circle.png',
      'assets/images/islam_circle.png',
      'assets/images/hands_circle.png',
      'assets/images/zhanalyk_circle.png'
    ];
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
                        Text('Таңдаулым',
                            style: getTextStyle(CustomTextStyles.s36w700).apply(
                                fontFamily: FontTypes.Philosopher.name,
                                color: AppColors.white)),
                        SizedBox(height: 24.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CategoryCard(
                                    title: 'Жаңалықтар', imageList: news),
                                CategoryCard(
                                    title: 'Тікелей эфирлер', imageList: news)
                              ],
                            ),
                            SizedBox(
                              height: 11,
                            ),
                            CategoryCard(
                              title: 'Семинарлар',
                              imageList: news,
                              titleColor: AppColors.blue,
                            ),
                            SizedBox(
                              height: 32.h,
                            ),
                            Wrap(
                              spacing: 9.w,
                              runSpacing: 9.h,
                              children: [
                                CategoryTitleCard(title: 'Түс жорулар', onTap: (){}),
                                CategoryTitleCard(title: 'Есімдер', onTap: (){}),
                                CategoryTitleCard(title: 'Дұғалар', onTap: (){}),
                                CategoryTitleCard(title: 'Зікірлер', onTap: (){}),

                              ],
                            )
                          ],
                        )
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
