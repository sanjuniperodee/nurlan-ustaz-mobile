import 'package:auto_route/auto_route.dart';
import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';

import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/geonames_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/timings_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/widgets/NamazContainerWidget.dart';

@RoutePage()
class NamazPage extends StatefulWidget {
  final GeonamesDTO? geonamesDTO;
  const NamazPage({Key? key, this.geonamesDTO}) : super(key: key);

  @override
  State<NamazPage> createState() => _NamazPageState();
}

class _NamazPageState extends State<NamazPage> {
  final now = DateTime.now();

  List<String> namasNames = [
    'Fajr'.tr(),
    'Күн',
    'Zukhr'.tr(),
    'Asr'.tr(),
    'Maghrib'.tr(),
    'Isha'.tr()
  ];
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<TimingsCubit>(context).timings(
      43.25,
      76.91667,
    );

    super.initState();
  }

  List times = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: BlocBuilder<TimingsCubit, TimingsState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.linearBlue),
              );
            },
            // errorState: (message) {
            //   return buildErrorCustomSnackBar(context, message);
            // },
            loaded: (not, geo) {
              final namaz = not.toJson();
              times = namaz.values.toList();

              return SizedBox(
                height: 1.sh,
                child: Stack(
                  children: [
                    Image.asset(
                      Assets.gradient,
                      fit: BoxFit.cover,
                    ),
                    SingleChildScrollView(
                      padding:
                          const EdgeInsets.only(top: 40, left: 16, right: 16).r,
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          CustomAppBar(
                            title: 'Namaz_times'.tr(),
                          ),
                          SizedBox(
                            height: 28.h,
                          ),
                          NamazContainerWidget(
                            name: geo.name ?? 'Алматы',
                            time: timesToSend(),
                            namazName: namasNames[indexOfNextNames(times)],
                            namazTime: namasTimestoSend(),
                          ),
                          SizedBox(
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: times.length,
                              itemBuilder: (context, index) {
                                return NamazContainer(
                                  name: namasNames[index],
                                  isActive:
                                      times[index] == beforeFormatter(times),
                                  time: times[index],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  int indexOfNextNames(List time) {
    late String namazName2;
    late int indexOfNamaz;
    try {
      namazName2 = time.firstWhere((element) => DateTime.now()
          .copyWith(
              hour: int.parse(element.toString().substring(0, 2)),
              minute: int.parse(element.toString().substring(3, 5)))
          .isAfter(DateTime.now()));
      indexOfNamaz = time.indexOf(namazName2);
      log(time.toString());
    } catch (e) {
      log(e.toString());
      return 0;
    }
    return indexOfNamaz;
  }

  String beforeFormatter(List time) {
    late String test;
    late String namazName2;
    try {
      test = time.lastWhere((element) => DateTime.now()
          .copyWith(
              hour: int.parse(element.toString().substring(0, 2)),
              minute: int.parse(element.toString().substring(3, 5)))
          .isBefore(DateTime.now()));
    } catch (e) {
      log(e.toString());
      return time.last;
    }
    return test;
  }

  String namasNamestoSend() {
    String beforeTime = beforeFormatter(namasNames);
    String nextTime = '';
    for (int i = 0; i < namasNames.length; i++) {
      if (times[i] == beforeTime) {
        if (times[i] == times.length - 1) {
          nextTime = times[0];
          break;
        } else {
          nextTime = times[i + 1];
        }
        break;
      }
    }
    return nextTime;
  }

  String namasTimestoSend() {
    String beforeTime = beforeFormatter(times);
    String nextTime = '';
    for (int i = 0; i < times.length; i++) {
      if (times[i] == beforeTime) {
        if (i == times.length - 1) {
          nextTime = times[0];
          break;
        } else {
          nextTime = times[i + 1];
        }
        break;
      }
    }
    return nextTime;
  }

  String timesToSend() {
    String beforeTime = beforeFormatter(times);
    String nextTime = '';
    for (int i = 0; i < times.length; i++) {
      if (times[i] == beforeTime) {
        if (i == times.length - 1) {
          nextTime = times[0];
          break;
        } else {
          nextTime = times[i + 1];
        }
        break;
      }
    }
    DateTime now = DateTime.now();
    String formattedTime = DateFormat.Hm().format(now);

    int nextHour = int.parse(nextTime.substring(0, 2));
    int currentHour = int.parse(formattedTime.substring(0, 2));
    int differenceMinutes = 0;
    int nextMinute = int.parse(nextTime.substring(3, 5));
    int currentMinute = int.parse(formattedTime.substring(3, 5));
    int nextMinutes = nextHour * 60 + nextMinute;
    int currentMinutes = currentHour * 60 + currentMinute;
    if (nextMinutes < currentMinutes) {
      differenceMinutes = 24 * 60 - currentMinutes + nextMinutes;
    } else {
      differenceMinutes = nextMinutes - currentMinutes;
    }
    int diffetenceHours = differenceMinutes ~/ 60;
    String timeH = diffetenceHours.toString();
    String timeM = (differenceMinutes - (diffetenceHours * 60)).toString();

    if (timeM.length < 2) {
      timeM = "0$timeM";
    }
    if (timeH.length < 2) {
      timeH = "0$timeH";
    }
    return "$timeH:$timeM";
  }
}

class NamazContainer extends StatelessWidget {
  final String time;
  final String name;
  final bool isActive;
  const NamazContainer({
    super.key,
    required this.time,
    required this.name,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12).r,
          decoration: BoxDecoration(
              color: isActive
                  ? AppColors.orange
                  : AppColors.orange.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20).r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: getTextStyle(CustomTextStyles.s16w700)
                    .apply(color: isActive ? AppColors.white : AppColors.black),
              ),
              Text(
                time,
                style: getTextStyle(CustomTextStyles.s16w700)
                    .apply(color: isActive ? AppColors.white : AppColors.black),
              ),
            ],
          ),
        ));
  }
}
