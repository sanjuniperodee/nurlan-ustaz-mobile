import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/seminar_detail_page.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/data/models/event_dto.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/common/app_styles.dart';
import '../../../../../core/common/colors.dart';
import '../../../../app/presentation/ui/nurlan_ustaz_app.dart';
import '../../../../app/presentation/widgets/app_button.dart';
import 'dart:math' as math; // import this

class SeminarCard extends StatelessWidget {
  const SeminarCard(
      {Key? key,
      required this.event,
      required this.nextPage,
      required this.previousPage,
      required this.isDialog,
      required this.mainContext})
      : super(key: key);
  final EventDto event;
  final Function nextPage;
  final Function previousPage;
  final bool isDialog;
  final BuildContext mainContext;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isDialog == true
          ? event.address == null
              ? 225.h
              : 248.h
          : null,
      padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 209.w,
                child: Text(
                  '${event.title}',
                  style: getTextStyle(CustomTextStyles.s20w700)
                      .copyWith(color: AppColors.black),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset(
                    'assets/icons/cancel.svg',
                    color: AppColors.black.withOpacity(0.55),
                  )),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'assets/icons/calendar_outline.svg',
                color: AppColors.blue,
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                DateFormat('dd.MM.yyyy').format(DateTime.parse(event.date!)),
                style: getTextStyle(CustomTextStyles.s16w400).copyWith(
                    fontFamily: FontTypes.SF_Pro.name, color: AppColors.black),
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'assets/icons/clock_outline.svg',
                color: AppColors.blue,
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                DateFormat('HH:mm')
                    .format(DateFormat('HH:mm:ss').parse(event.time!)),
                style: getTextStyle(CustomTextStyles.s16w400).copyWith(
                    fontFamily: FontTypes.SF_Pro.name, color: AppColors.black),
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          if (event.address != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/icons/place_outline.svg',
                  color: AppColors.blue,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  '${event.address}',
                  style: getTextStyle(CustomTextStyles.s16w400).copyWith(
                      fontFamily: FontTypes.SF_Pro.name,
                      color: AppColors.black),
                ),
              ],
            ),
          SizedBox(
            height: 12.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isDialog
                  ? Container()
                  : IconButton(
                      onPressed: () {
                        previousPage();
                      },
                      icon: Transform(
                          transform: Matrix4.rotationY(math.pi),
                          child: SvgPicture.asset(
                            'assets/icons/chevron_right.svg',
                            color: AppColors.blue,
                            height: 24.h,
                            width: 24.w,
                          ))),
              SizedBox(
                height: 45.h,
                width: 150.w,
                child: AppButton(
                  onTap: () async {
                    if (event.address == null) {
                      if (event.link == null) {
                        return;
                      } else {
                        final Uri url = Uri.parse(event.link!);
                        if (!await launchUrl(url,
                            mode: LaunchMode.externalApplication)) {
                          throw Exception('Could not launch');
                        }
                      }
                    } else {
                      mainContext.router
                          .push(SeminarDetailPageRoute(id: event.id!));
                    }
                  },
                  text: 'next_page'.tr(),
                  textSize: 14.sp,
                ),
              ),
              isDialog
                  ? Container()
                  : IconButton(
                      onPressed: () {
                        nextPage();
                      },
                      icon: SvgPicture.asset(
                        'assets/icons/chevron_right.svg',
                        color: AppColors.blue,
                        height: 24.h,
                        width: 24.w,
                      )),
            ],
          )
        ],
      ),
    );
  }
}
