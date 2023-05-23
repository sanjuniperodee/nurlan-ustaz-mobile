import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';

import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
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
      backgroundColor: AppColors.lightBlue,
      body: GlobalCustomBody(
        child: SizedBox(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const CustomAppBar(
                  title: 'Қайырымдылық',
                ),
                ListView.builder(
                  itemCount: 20,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                'assets/images/charity.png',
                                width: 55.r,
                                height: 55.r,
                              ),
                              Text(
                                'Харекет қайырымдылық қоры',
                                style: getTextStyle(CustomTextStyles.s16w500)
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
        ),
      ),
    );
  }
}
