import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class NamazContainerWidget extends StatefulWidget {
  final String name;
  final String time;
  final String namazName;
  final String namazTime;
  const NamazContainerWidget({
    Key? key,
    required this.name,
    required this.time,
    required this.namazName,
    required this.namazTime,
  }) : super(key: key);

  @override
  State<NamazContainerWidget> createState() => _NamazContainerWidgetState();
}

class _NamazContainerWidgetState extends State<NamazContainerWidget> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countDown,
    presetMillisecond: StopWatchTimer.getMilliSecFromMinute(1),
  ); // Create instance.

  @override
  void initState() {
    _stopWatchTimer.setPresetHoursTime(int.parse(widget.time.substring(0, 2)));
    _stopWatchTimer.setPresetMinuteTime(int.parse(widget.time.substring(2, 4)));
    _stopWatchTimer.onStartTimer();
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose(); // Need to call dispose function.
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.h,
      width: 1.sw,
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(30).r),
      child: Stack(
        children: [
          Positioned(
            top: -30.r,
            child: SvgPicture.asset(
              Assets.oyuSvg,
              color: Colors.blue,
            ),
          ),
          Positioned.fill(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 24.h,
              ),
              Text(
                widget.namazName,
                style: getTextStyle(CustomTextStyles.s20w700)
                    .apply(color: AppColors.black),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                widget.namazTime,
                style: getTextStyle(CustomTextStyles.s36w700)
                    .apply(color: AppColors.black),
              ),
              SizedBox(
                height: 4.h,
              ),
              StreamBuilder<int>(
                  stream: _stopWatchTimer.rawTime,
                  initialData: 0,
                  builder: (context, snap) {
                    final value = snap.data;
                    final displayTime = StopWatchTimer.getDisplayTime(value!,
                        milliSecond: false);
                    return Text(
                      '-${displayTime}',
                      style: getTextStyle(CustomTextStyles.s16w400)
                          .apply(color: AppColors.black),
                    );
                  }),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ).r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.router.push(
                            GeonamesPageRoute(),
                          );
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(Assets.locationSvg),
                            SizedBox(
                              width: 4.w,
                            ),
                            Text(
                              widget.name,
                              style: getTextStyle(CustomTextStyles.s16w400)
                                  .apply(color: AppColors.black),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.router.push(
                            const QiblahPageRoute(),
                          );
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(Assets.compassSvg),
                            SizedBox(
                              width: 4.w,
                            ),
                            Text(
                              'Qibla'.tr(),
                              style: getTextStyle(CustomTextStyles.s16w400)
                                  .apply(color: AppColors.black),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
