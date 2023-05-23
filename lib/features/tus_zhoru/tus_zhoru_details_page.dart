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
import 'package:share_plus/share_plus.dart';

import '../app/presentation/widgets/custom_app_bar.dart';
import '../app/presentation/widgets/global_custom_widget.dart';

class TusZhoruDetailPage extends StatefulWidget {
  final String title;
  final String text;

  const TusZhoruDetailPage(
      {super.key, required this.text, required this.title});

  @override
  State<TusZhoruDetailPage> createState() => _TusZhoruDetailPage();
}

class _TusZhoruDetailPage extends State<TusZhoruDetailPage> {
  List images = [
    'assets/images/nur.png',
    'assets/images/nur.png',
    'assets/images/nur.png'
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: AppButton(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Container(
                      height: 289,
                      width: 311,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          gradient: LinearGradient(
                              colors: [AppColors.blue, AppColors.white],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 64,
                            width: 64,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: AppColors.white),
                            child: Center(
                              child: SvgPicture.asset(
                                  'assets/icons/money_transfer.svg'),
                            ),
                          ),
                          SizedBox(
                            height: 31.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Text(
                              'Түс жорылуын алу үшін төлем жасауыңызды сұраймыз',
                              style: getTextStyle(CustomTextStyles.s16w400)
                                  .copyWith(fontFamily: FontTypes.SF_Pro.name),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 27),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(27)),
                              height: 44,
                              onPressed: () {},
                              color: AppColors.orange,
                              child: Center(
                                child: Text('10 000 тг төлеу',
                                    style:
                                        getTextStyle(CustomTextStyles.s14w400)
                                            .copyWith(
                                                fontFamily:
                                                    FontTypes.SF_Pro.name,
                                                color: AppColors.white)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
          text: 'Өтініш қалдыру',
          color: AppColors.blue,
        ),
      ),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: 1.1.sh,
          child: Stack(
            children: [
              const GlobalCustomBody(),
              Positioned(
                top: 80.h,
                left: 16.r,
                right: 16.r,
                child: Column(
                  children: [
                    CustomAppBar(
                      title: widget.title,
                    ),
                  ],
                ),
              ),
              Positioned(
                  top: 124,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    height: 700,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            stops: [
                              0.0,
                              1.0
                            ],
                            colors: [
                              AppColors.white.withOpacity(0.5),
                              AppColors.white
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Adam',
                          style: getTextStyle(CustomTextStyles.s20w700)
                              .copyWith(
                                  fontSize: 24,
                                  fontFamily: FontTypes.Philosopher.name),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          child: Text(
                            '${widget.text}...',
                            style: getTextStyle(CustomTextStyles.s16w400)
                                .copyWith(
                                    fontFamily: FontTypes.SF_Pro.name,
                                    height: 1.5),
                            overflow: TextOverflow.fade,
                          ),
                        ),
                        SizedBox(height: 28.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 44.h,
                                width: 166.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Color(0xFF8F8CF7).withOpacity(0.13),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 13),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Таңдаулы',
                                      style:
                                          getTextStyle(CustomTextStyles.s16w500)
                                              .copyWith(
                                                  fontFamily:
                                                      FontTypes.SF_Pro.name),
                                    ),
                                    SvgPicture.asset(
                                      'assets/icons/bookmark.svg',
                                      color: AppColors.orange,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Share.share(widget.text,
                                    subject: 'Nurlan_ustaz');
                              },
                              child: Container(
                                height: 44,
                                width: 166,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Color(0xFF8F8CF7).withOpacity(0.13),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 13),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Бөлісу',
                                      style:
                                          getTextStyle(CustomTextStyles.s16w500)
                                              .copyWith(
                                                  fontFamily:
                                                      FontTypes.SF_Pro.name),
                                    ),
                                    SvgPicture.asset(
                                      'assets/icons/share.svg',
                                      color: AppColors.orange,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
