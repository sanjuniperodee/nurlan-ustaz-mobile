import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';

import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_appbar_widget.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/search_widget.dart';

import '../../../../core/common/assets.dart';

class LiveBroadcastsPage extends StatefulWidget {
  const LiveBroadcastsPage({Key? key}) : super(key: key);

  @override
  State<LiveBroadcastsPage> createState() => _LiveBroadcastsPageState();
}

class _LiveBroadcastsPageState extends State<LiveBroadcastsPage> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  AppColors.lightBlue,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: 1.1.sh,
          child: Stack(
            children: [
              const GlobalAppBar(),
              Positioned(
                top: 80.h,
                left: 16.r,
                right: 16.r,
                child: Column(
                  children: [
                    const CustomAppBar(
                      title: 'Тікелей эфирлер',
                    ),
                    SizedBox(
                      height: 36.h,
                    ),
                     SearchWidget(onChanged: (value){},),
                    ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 20.r),
                          child: GestureDetector(
                            onTap: () {
                              context.router.push(
                                const SeminarDetailPageRoute(),
                              );
                            },
                            child: Container(
                              height: 164.h,
                              width: 1.sw,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.r, horizontal: 8.r),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Image.asset('assets/images/Nureke.png'),
                                      Positioned.fill(
                                          child: Align(
                                              alignment: Alignment.center,
                                              child: SvgPicture.asset(
                                                  Assets.playSvg)))
                                    ],
                                  ),
                                  SizedBox(
                                    width: 12.w,
                                  ),
                                  SizedBox(
                                    width: 240.w,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '10.02.2023',
                                                style: getTextStyle(
                                                        CustomTextStyles
                                                            .s12w400)
                                                    .apply(
                                                        color: AppColors.grey1),
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Text(
                                                'Семинар тақырыбы',
                                                style: getTextStyle(
                                                        CustomTextStyles
                                                            .s16w500)
                                                    .apply(
                                                        color: AppColors.black),
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Text(
                                                'Оразаға кезінде тарауих намазын оқу сауабын білетін боласыз',
                                                textAlign: TextAlign.start,
                                                style: getTextStyle(
                                                        CustomTextStyles
                                                            .s12w400)
                                                    .apply(
                                                        color: AppColors.grey2),
                                              ),
                                            ],
                                          ),
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                selectedIndex = index;
                                              });
                                            },
                                            child: selectedIndex != index
                                                ? SvgPicture.asset(
                                                    Assets.bookMarkSvg)
                                                : SvgPicture.asset(
                                                    Assets.bookMark1Svg)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
