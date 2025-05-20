import 'dart:math' as math; // import this

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/data/models/event_dto.dart';

import '../../../../../core/common/app_styles.dart';
import '../../../../../core/common/colors.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard(
      {super.key,
      required this.event,
      required this.nextPage,
      required this.previousPage,
      required this.isDialog});
  final EventDto event;
  final Function nextPage;
  final Function previousPage;
  final bool isDialog;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: isDialog ? 220 : null,
      padding: EdgeInsets.symmetric(horizontal: 19),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${event.title}',
                style: getTextStyle(CustomTextStyles.s20w700)
                    .copyWith(color: AppColors.black),
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
            height: 13,
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
                '${event.date}',
                style: getTextStyle(CustomTextStyles.s16w400).copyWith(
                    fontFamily: FontTypes.SFPro.name, color: AppColors.black),
              ),
            ],
          ),
          SizedBox(
            height: 8,
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
                '${event.time}',
                style: getTextStyle(CustomTextStyles.s16w400).copyWith(
                    fontFamily: FontTypes.SFPro.name, color: AppColors.black),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
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
                    fontFamily: FontTypes.SFPro.name, color: AppColors.black),
              ),
            ],
          ),
          SizedBox(
            height: 16,
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
                            height: 24,
                            width: 24,
                          ))),
              isDialog
                  ? Container()
                  : IconButton(
                      onPressed: () {
                        nextPage();
                      },
                      icon: SvgPicture.asset(
                        'assets/icons/chevron_right.svg',
                        color: AppColors.blue,
                        height: 24,
                        width: 24,
                      )),
            ],
          )
        ],
      ),
    );
  }
}
