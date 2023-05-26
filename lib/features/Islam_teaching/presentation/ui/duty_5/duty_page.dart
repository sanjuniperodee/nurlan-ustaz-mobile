import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/banner_local_model.dart';

import '../../../../../core/common/app_styles.dart';

class DutyPage extends StatefulWidget {
  const DutyPage({super.key});

  @override
  State<DutyPage> createState() => _DutyPageState();
}

class _DutyPageState extends State<DutyPage> {
  List<BannerLocalModel> list = [
    BannerLocalModel(
      title: 'Иман',
      url: Assets.mosqueSvg,
    ),
    BannerLocalModel(
      title: 'Намаз',
      url: Assets.prayer_3Svg,
    ),
    BannerLocalModel(
      title: 'Зекет',
      url: Assets.zakatSvg,
    ),
    BannerLocalModel(
      title: 'Ораза',
      url: Assets.pray_5Svg,
    ),
    BannerLocalModel(
      title: 'Қажылық',
      url: Assets.kaabaSvg,
    ),
  ];

  final myRouteHome = [
    const ImanPageRoute(),
    const NamazDutyPageRoute(),
    const ZakatPageRoute(),
    const OrazaPageRoute(),
    const PligrimagePageRoute(),
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
                        height: 46.h,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: CustomAppBar(
                          title: '5 парыз',
                        ),
                      ),
                      SizedBox(
                        height: 36.h,
                      ),
                      GridView.builder(
                        itemCount: list.length,
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(0),
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: (60 / 53).r,
                          // crossAxisSpacing: 1.0,
                          mainAxisSpacing: 16.0,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          for (int n = 0; n < myRouteHome.length; n++) {}
                          return Padding(
                            padding:
                                const EdgeInsets.only(left: 16.0, right: 16).r,
                            child: InkWell(
                              onTap: () {
                                context.router.push(
                                  myRouteHome[index],
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 24, horizontal: 20),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(list[index].url),
                                    Text(
                                      list[index].title,
                                      style:
                                          getTextStyle(CustomTextStyles.s16w500)
                                              .apply(color: AppColors.black),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Align(
                                      alignment: Alignment.bottomRight,
                                      child: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: AppColors.orange,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
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
