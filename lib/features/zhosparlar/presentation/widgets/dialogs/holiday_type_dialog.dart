import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/common/app_styles.dart';
import '../../../../../core/common/colors.dart';
import '../../../../app/presentation/widgets/app_button.dart';
import '../../../data/models/event_dto.dart';

class HolidayDialog extends StatelessWidget {
  const HolidayDialog({Key? key, required this.event, required this.mainContext, required this.gradient}) : super(key: key);
  final EventDto event;
  final BuildContext mainContext;
  final LinearGradient gradient;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Container(
        height: 270,
        width: 311.w,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 135,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.r),
                      topLeft: Radius.circular(20.r),
                    ),
                    gradient:
                    gradient,
                    image: const DecorationImage(
                      opacity: 0.3,
                      image: AssetImage("assets/images/ooo.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15, top: 15),
                        child: Container(
                          width: 32,
                          height: 32,
                          padding: const EdgeInsets.all(4),
                          decoration: ShapeDecoration(
                            color: Colors.black.withOpacity(0.6000000238418579),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60),
                            ),
                          ),
                          child: Center(
                            child: SvgPicture.asset('assets/icons/cancel.svg'),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 14,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/icons/calendar_outline.svg',
                    color: AppColors.blue,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Container(

                    width: 200.w,
                    child: Text(
                      '${DateFormat('dd.MM.yyyy').format(DateTime.parse(event.date ?? ''))}  ${event.title}',
                      style: getTextStyle(CustomTextStyles.s16w400).copyWith(
                          fontFamily: FontTypes.SF_Pro.name,
                          color: AppColors.black),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Container(
                  child: AppButton(
                      textSize: 14.sp,
                      onTap: () async {
                         Navigator.of(context).pop();
                         mainContext.router.push(HolidayDetailPageRoute(event: event));
                      },
                      text: 'next_page'.tr())),
            ),
            SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
    ;
  }
}
