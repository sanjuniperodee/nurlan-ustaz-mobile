import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/ayat_dto.dart';

import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';

@RoutePage()
class AyatDayPage extends StatefulWidget {
  final AyatDTO ayatDTO;
  const AyatDayPage({super.key, required this.ayatDTO});

  @override
  State<AyatDayPage> createState() => _AyatDayPageState();
}

class _AyatDayPageState extends State<AyatDayPage> {
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
                       Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: CustomAppBar(
                          title: 'Ayat_of_the_day'.tr(),
                        ),
                      ),
                      SizedBox(
                        height: 36.h,
                      ),
                      Container(
                        // height: 1.sh,
                        decoration: BoxDecoration(
                            color: AppColors.lightBlue.withOpacity(0.3),
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(30.0),
                                topLeft: Radius.circular(30.0))),
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Ayat_of_the_day'.tr(),
                                  style: getTextStyle(CustomTextStyles.s20w700)
                                      .apply(color: AppColors.black),
                                ),
                                Text(
                                  widget.ayatDTO.name ?? 'ERROR',
                                  style: getTextStyle(CustomTextStyles.s20w700)
                                      .apply(color: AppColors.black),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Text(
                              widget.ayatDTO.arabic ?? 'ERROR',
                              style: getTextStyle(CustomTextStyles.s16w400)
                                  .apply(color: AppColors.black),
                            ),
                            SizedBox(
                              height: 28.h,
                            ),
                            Text(
                              widget.ayatDTO.translation ?? 'ERROR',
                              style: getTextStyle(CustomTextStyles.s16w400)
                                  .apply(color: AppColors.black),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
