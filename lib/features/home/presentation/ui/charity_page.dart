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

class CharityPage extends StatefulWidget {
  const CharityPage({Key? key}) : super(key: key);

  @override
  State<CharityPage> createState() => _CharityPageState();
}

class _CharityPageState extends State<CharityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F8FF),
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
                      title: 'Қайырымдылық',
                    ),
                    ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(top: 12.r),
                          child: GestureDetector(
                            onTap: () {
                              context.router.push(
                                const CharityDetailPageRoute(),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(20).r),
                              padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 12)
                                  .r,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    'assets/images/charity.png',
                                    width: 55.r,
                                    height: 55.r,
                                  ),
                                  Text(
                                    'Харекет қайырымдылық қоры',
                                    style: AppStyles.sp16fw500
                                        .apply(color: AppColors.black),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward,
                                    color: AppColors.orange,
                                  )
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
