import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:share_plus/share_plus.dart';

class NewsDetailPage extends StatefulWidget {
  const NewsDetailPage({super.key});

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  List images = [
    'assets/images/nur.png',
    'assets/images/nur.png',
    'assets/images/nur.png'
  ];
  int _currentIndex = 0;
  bool favorite = false;
  bool heart = false;
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
                      Text(
                        'Меккеде қазақстандық жұп неке қидырды',
                        style: getTextStyle(CustomTextStyles.s14w400)
                            .apply(color: AppColors.grey2),
                      ),
                      SizedBox(
                        height: 23.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                InkWell(
                                    onTap: () {
                                      setState(() {
                                        heart = !heart;
                                      });
                                    },
                                    child: SvgPicture.asset(heart
                                        ? Assets.heartSvg
                                        : Assets.heart1Svg)),
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
                                InkWell(
                                    onTap: () {
                                      Share.share('Hello',
                                          subject: 'Nurlan_ustaz');
                                    },
                                    child: SvgPicture.asset(Assets.shareSvg)),
                              ],
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  favorite = !favorite;
                                });
                              },
                              child: SvgPicture.asset(favorite
                                  ? Assets.bookMarkSvg
                                  : Assets.bookMark1Svg))
                        ],
                      ),
                      SizedBox(
                        height: 21.h,
                      ),
                      Text(
                        '«Алланың қалауымен некемізді 12-ақпан күні Қасиетті Меккеде қидық. Өзім үнемі шет елде өткізсем деп ойлайтынмын, бірақ дәл Алланың үйінде, Пайғамбарымыз Мұхаммедтің (с.ғ.с) тікелей ұрпақтары біздің некемізді қияды деп ешқашан ойламаппын. Қасиетті Мекке қаласында бәрі Алланың қалауымен болды. Яғни, басымызға жазылған тағдыр. Бұл – біз үшін ең қуанышты күн, естен кетпес тарихи сәт.Ең қызығы, некемізді осы елдің лауазымды шейхтары қиды. Олар үшін де бұл бір жаңалық болды. Бұрын-соңды болмаған жағдай. Алла тағала бұндай бақытты көптің біріне бұйыртпайды, бірақ, Аллаға шүкір, біз өз елімізден бірінші болып, дәл осы Алланың үйінде, пайғамбар ұрпақтарының келісімімен некемізді қидық» деп жазды жігіт.Барлық пікірлерді көру (56)',
                        style: getTextStyle(CustomTextStyles.s16w400)
                            .apply(color: AppColors.black),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.router.push(
                            const CommentPageRoute(),
                          );
                        },
                        child: Text(
                          'Пікірлерді көру (2)',
                          style: getTextStyle(CustomTextStyles.s16w400)
                              .apply(color: AppColors.grey1),
                        ),
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
