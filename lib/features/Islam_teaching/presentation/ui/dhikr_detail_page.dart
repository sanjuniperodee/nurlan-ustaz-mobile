import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/widgets/audioItem_widget.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/bottom_sheet.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/search_widget.dart';

import '../widgets/dhikr_button_widget.dart';

class DhikrDetailPage extends StatefulWidget {
  const DhikrDetailPage({super.key});

  @override
  State<DhikrDetailPage> createState() => _DhikrDetailPageState();
}

class _DhikrDetailPageState extends State<DhikrDetailPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

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
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 56.h,
                        ),
                        const CustomAppBar(
                          title: 'Салауат',
                        ),
                        SizedBox(
                          height: 76.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.white.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                  alignment: Alignment.topRight,
                                  child: SvgPicture.asset(Assets.bookMark1Svg)),
                              SizedBox(
                                height: 60.h,
                              ),
                              Text(
                                'ٱللَّٰهُمَّ صَلِّ عَلىٰ مُحَمَّدٍ وَعَلَىٰ آلِ مُحَمَّدٍ',
                                style: getTextStyle(CustomTextStyles.s16w500),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              Text(
                                'Аллаһумма салли ‘ала Мухаммәдин уә ‘ала әли Мухаммәд.',
                                style: getTextStyle(CustomTextStyles.s16w500),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              Text(
                                'Я, Аллам! Пайғамбарымыз (с.а.у.) Мұхаммедке және Оның отбасы мен ұрпағына, мейіріміңді төгіп, олардың мерейін үстем ет 🤲',
                                style: getTextStyle(CustomTextStyles.s16w500),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 90.h,
                              ),
                              const AudioItemWidget(),
                            ],
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DhikrButtonWidget(
                              svg: Assets.replaySvg,
                              onTap: _resetCounter,
                            ),
                            InkWell(
                              onTap: _incrementCounter,
                              child: Container(
                                decoration: BoxDecoration(
                                    gradient:
                                        AppColors.gradientPrimaryActiveButton,
                                    borderRadius: BorderRadius.circular(20)),
                                padding: const EdgeInsets.symmetric(
                                        vertical: 52, horizontal: 60)
                                    .r,
                                child: Text(
                                  '$_counter',
                                  style: getTextStyle(CustomTextStyles.s20w700)
                                      .apply(color: AppColors.white),
                                ),
                              ),
                            ),
                            DhikrButtonWidget(
                              onTap: () {
                                bottomSheet(
                                  FractionallySizedBox(
                                    heightFactor: 0.7,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: SvgPicture.asset(
                                              Assets.cancelSvg,
                                              color: AppColors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 25.h,
                                          ),
                                          Text(
                                            'Салауат — Мұхаммед пайғамбардың (ғ.с.) есімі аталған кезде арнайы айтылатын дұға атауы. Салауат Құран Кәрімдегі бұйрық бойынша пайғамбарға жарылқау, құрмет, құттықтау, дұға тілеу мағынасында арнайы жасалатын құлшылық түрі. Ислам ғұламалары салауат айтуды шариаттың шарты ретінде бекіткен. Әбу Ханифа мазхабында әр намаз оқылғанда пайғамбарға салауат айтуды сүннет үкіміне жатқызады. Жазба әдебиетте “с.ғ.с.”, “ғ.с.”, “с.а.у.” түрінде салауаттың қысқарған сөз түріндегі қалпын пайдалану дәстүрі бар. Қазақ дәстүрлі қоғамында пайғамбарға құрмет иманның басты негізі ретінде танылғандығын жыраулар мұрасынан анық көреміз. Қашаған жырау, Әбубәкір Кердері, Ақтай Керейұлы, т.б. қазақ шайырларының шығармашылығында да салауаттың, мадақтың мәні көрсетілген.',
                                            style: getTextStyle(
                                                    CustomTextStyles.s16w400)
                                                .apply(color: AppColors.black),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  context,
                                );
                              },
                              svg: Assets.infoCircleSvg,
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
