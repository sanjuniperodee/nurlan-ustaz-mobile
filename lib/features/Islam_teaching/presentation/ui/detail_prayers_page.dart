import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/widgets/audioItem_widget.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/search_widget.dart';

import '../widgets/floating_container_widget.dart';

class PrayersDetailPage extends StatefulWidget {
  const PrayersDetailPage({super.key});

  @override
  State<PrayersDetailPage> createState() => _PrayersDetailPageState();
}

class _PrayersDetailPageState extends State<PrayersDetailPage> {
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
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 56.h,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: CustomAppBar(title: 'Қиналғанда оқылатын дұға'),
                      ),
                      SizedBox(
                        height: 26.h,
                      ),
                      Container(
                          height: 0.8.sh,
                          decoration: BoxDecoration(
                              color: AppColors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(24)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'وَاذْكُرْ رَبَّكَ فِي نَفْسِكَ تَضَرُّعًا وَخِيفَةً وَدُونَ الْجَهْرِ مِنَ الْقَوْلِ بِالْغُدُوِّ  وَالْآصَالِ وَلَا تَكُنْ مِنَ الْغَافِلِ',
                                style: getTextStyle(CustomTextStyles.s14w400),
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              Text(
                                'Әлхамдулилләһи әлләзи ахяна баъда мә әмәтәнә уә иләиһин-нушур».\n\n«Өлгеннен кейін қайта тірілткен Аллаһқа мадақ болғай! Өлгеннен кейін қайта тірілуіміз тек Оған ғана тән».',
                                style: getTextStyle(CustomTextStyles.s14w400),
                              ),
                              SizedBox(
                                height: 14.h,
                              ),
                              const AudioItemWidget(),
                              const Spacer(),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    FloatinContainerWidget(
                                      text: 'Таңдаулы',
                                      url: Assets.bookMark1Svg,
                                    ),
                                    FloatinContainerWidget(
                                      text: 'Бөлісу',
                                      url: Assets.shareSvg,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
