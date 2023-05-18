import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/utils/alert_utilrs.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/app_button.dart';

class SeminarDetailPage extends StatefulWidget {
  const SeminarDetailPage({super.key});

  @override
  State<SeminarDetailPage> createState() => _SeminarDetailPageState();
}

class _SeminarDetailPageState extends State<SeminarDetailPage> {
  List images = [
    'assets/images/nur.png',
    'assets/images/nur.png',
    'assets/images/nur.png'
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: 1.1.sh,
          child: Stack(children: [
            CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 1,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                onPageChanged: (index, _) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: images.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Image.asset(
                      i,
                      fit: BoxFit.cover,
                      width: 1.sw,
                    );
                  },
                );
              }).toList(),
            ),
            Positioned.fill(
              top: 210.r,
              child: Align(
                alignment: Alignment.topCenter,
                child: DotsIndicator(
                  dotsCount: images.length,
                  position: _currentIndex,
                  decorator: DotsDecorator(
                    color: AppColors.white, // Color of non-selected indicators
                    activeColor: AppColors.grey1, // Color of selected indicator
                  ),
                ),
              ),
            ),
            Positioned(
                top: 54.r,
                left: 16.r,
                child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(Assets.backStackSvg))),
            Positioned(
                top: 239.r,
                child: Container(
                  height: 1.sh,
                  width: 1.sw,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topRight: const Radius.circular(30).r,
                        topLeft: const Radius.circular(30).r,
                      )),
                  padding:
                      EdgeInsets.symmetric(vertical: 16.r, horizontal: 16.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Мәскеу сапары',
                        style: getTextStyle(CustomTextStyles.s20w700)
                            .apply(color: AppColors.black),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(Assets.seminarCalendarSvg),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                '1 мамыр, 15:00',
                                style: getTextStyle(CustomTextStyles.s14w400)
                                    .apply(color: AppColors.grey2),
                              ),
                              SizedBox(
                                width: 28.w,
                              ),
                              SvgPicture.asset(Assets.mapSvg),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                'Мәскеу қаласы',
                                style: getTextStyle(CustomTextStyles.s14w400)
                                    .apply(color: AppColors.grey2),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 23.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                SvgPicture.asset(Assets.heartSvg),
                                Text(
                                  '12',
                                  style: getTextStyle(CustomTextStyles.s14w400),
                                ),
                                SizedBox(
                                  width: 12.w,
                                ),
                                SvgPicture.asset(Assets.commentSvg),
                                Text(
                                  '12',
                                  style: getTextStyle(CustomTextStyles.s14w400),
                                ),
                                SizedBox(
                                  width: 12.w,
                                ),
                                SvgPicture.asset(Assets.shareSvg),
                              ],
                            ),
                          ),
                          SvgPicture.asset(Assets.bookMarkSvg)
                        ],
                      ),
                      SizedBox(
                        height: 39.h,
                      ),
                      AppButton(
                        onTap: () {
                          Alert.dialogBuilder(
                              context: context,
                              message: 'Төлем сәтті аяқталды',
                              gradientColors: [
                                Color(0xFF1151C2),
                                Color(0xFF2941F4).withOpacity(0.1),
                                Color(0xFF4E5BF3).withOpacity(0.1),
                              ]);
                        },
                        text: 'Сатып алу',
                        color: AppColors.blue,
                      )
                    ],
                  ),
                )),
          ]),
        ),
      ),
    );
  }
}
