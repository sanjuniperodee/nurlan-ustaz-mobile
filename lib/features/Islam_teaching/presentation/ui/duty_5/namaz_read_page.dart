import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/pillars_dto.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';

class NamazReadPage extends StatefulWidget {
  final List<PillarsDTO> pre;
  const NamazReadPage({super.key, required this.pre});

  @override
  State<NamazReadPage> createState() => _NamazReadPageState();
}

int currentIndex = 0;

class _NamazReadPageState extends State<NamazReadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      bottomSheet: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          decoration: const BoxDecoration(color: AppColors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.orange,
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.orange,
                ),
              )
            ],
          )),
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
                        child: CustomAppBar(
                          title: 'Таң намазы',
                        ),
                      ),
                      SizedBox(
                        height: 36.h,
                      ),
                      Container(
                        // height: 0.8.sh,
                        decoration: BoxDecoration(
                            color: AppColors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(24)),
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Намаз оқудың дұрыс үлгісі (таң намазының парызы, 1 рәкәт)',
                              style: getTextStyle(CustomTextStyles.s20w700)
                                  .apply(color: AppColors.black),
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              '«Ниет еттім Алла разылығы үшін бүгінгі таң намазының парызын оқуға, жүзімді қараттым құбылаға».Ниет шын жүректен айтылуы тиіс. Ниеттің тек тілмен ғана айтылып, жүрекпен бекітілмесе намаз қабыл болмайды.',
                              style: getTextStyle(CustomTextStyles.s16w400)
                                  .apply(color: AppColors.black),
                            ),
                            SizedBox(height: 16.h),
                            Align(
                                alignment: Alignment.center,
                                child: Image.asset('assets/images/nam1.png')),
                            Text(
                              'Намаз оқудың дұрыс үлгісі (таң намазының парызы, 1 рәкәт)',
                              style: getTextStyle(CustomTextStyles.s20w700)
                                  .apply(color: AppColors.black),
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              '«Ниет еттім Алла разылығы үшін бүгінгі таң намазының парызын оқуға, жүзімді қараттым құбылаға».Ниет шын жүректен айтылуы тиіс. Ниеттің тек тілмен ғана айтылып, жүрекпен бекітілмесе намаз қабыл болмайды.',
                              style: getTextStyle(CustomTextStyles.s16w400)
                                  .apply(color: AppColors.black),
                            ),
                            SizedBox(height: 16.h),
                            Align(
                                alignment: Alignment.center,
                                child: Image.asset('assets/images/nam1.png')),
                            Text(
                              'Намаз оқудың дұрыс үлгісі (таң намазының парызы, 1 рәкәт)',
                              style: getTextStyle(CustomTextStyles.s20w700)
                                  .apply(color: AppColors.black),
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              '«Ниет еттім Алла разылығы үшін бүгінгі таң намазының парызын оқуға, жүзімді қараттым құбылаға».Ниет шын жүректен айтылуы тиіс. Ниеттің тек тілмен ғана айтылып, жүрекпен бекітілмесе намаз қабыл болмайды.',
                              style: getTextStyle(CustomTextStyles.s16w400)
                                  .apply(color: AppColors.black),
                            ),
                            SizedBox(height: 16.h),
                            Align(
                                alignment: Alignment.center,
                                child: Image.asset('assets/images/nam1.png')),
                            Text(
                              'Намаз оқудың дұрыс үлгісі (таң намазының парызы, 1 рәкәт)',
                              style: getTextStyle(CustomTextStyles.s20w700)
                                  .apply(color: AppColors.black),
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              '«Ниет еттім Алла разылығы үшін бүгінгі таң намазының парызын оқуға, жүзімді қараттым құбылаға».Ниет шын жүректен айтылуы тиіс. Ниеттің тек тілмен ғана айтылып, жүрекпен бекітілмесе намаз қабыл болмайды.',
                              style: getTextStyle(CustomTextStyles.s16w400)
                                  .apply(color: AppColors.black),
                            ),
                            SizedBox(height: 16.h),
                            Align(
                                alignment: Alignment.center,
                                child: Image.asset('assets/images/nam1.png')),
                            SizedBox(
                              height: 136.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
