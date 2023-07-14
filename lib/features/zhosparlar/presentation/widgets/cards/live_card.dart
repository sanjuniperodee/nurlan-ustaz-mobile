import 'dart:math' as math; // import this

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/data/models/event_dto.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/common/app_styles.dart';
import '../../../../../core/common/colors.dart';
import '../../../../app/presentation/widgets/app_button.dart';


class LiveCard extends StatelessWidget {
  const LiveCard({Key? key, required this.event, required this.nextPage, required this.previousPage, required this.isDialog}) : super(key: key);
  final EventDto event;
  final Function nextPage;
  final Function previousPage;
  final bool isDialog;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: isDialog ? 220 : null,
      padding: const EdgeInsets.symmetric(horizontal: 19),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
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
          const SizedBox(
            height: 18,
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
                    fontFamily: FontTypes.SF_Pro.name,
                    color: AppColors.black),
              ),
            ],
          ),
          const SizedBox(
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
                DateFormat('HH:mm').format(DateFormat('HH:mm:ss').parse(event.time!)),
                style: getTextStyle(CustomTextStyles.s16w400).copyWith(
                    fontFamily: FontTypes.SF_Pro.name,
                    color: AppColors.black),
              ),
            ],
          ),
          const SizedBox(
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
                    fontFamily: FontTypes.SF_Pro.name,
                    color: AppColors.black),
              ),
            ],
          ),
          SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isDialog ? Container() :IconButton(
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
              Container(
                height: 35.w,
                width: 150.w,
                child: AppButton(onTap: () async {
                  final Uri url = Uri.parse('${event.address}');
                  if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                  }
                }, text: 'Бетке өту',textSize: 14.sp,),
              ),
              isDialog ? Container()   : IconButton(
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
