import 'dart:convert';
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

class NamazPage extends StatefulWidget {
  final GeonamesDTO? geonamesDTO;
  const NamazPage({Key? key, this.geonamesDTO}) : super(key: key);

  @override
  State<NamazPage> createState() => _NamazPageState();
}

class _NamazPageState extends State<NamazPage> {
  final now = DateTime.now();

  List<String> namasNames = [
    'Таң намазы',
    'Күн',
    'Бесін',
    'Екінті',
    'Ақшам',
    'Құптан'
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: BlocBuilder<TimingsCubit, TimingsState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.blue),
              );
            },
            loaded: (not, geo) {
              final namaz = not.toJson();
              final times = namaz.values.toList();
              log(times.toString());
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
                          const CustomAppBar(
                            title: 'Намаз уақыттары',
                          ),
                          SizedBox(
                            height: 28.h,
                          ),
                          NamazContainerWidget(
                            name: geo.name ?? 'Алматы',
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

  String beforeFormatter(List time) {
    return time.lastWhere((element) => DateTime.now()
        .copyWith(
            hour: int.parse(element.toString().substring(0, 2)),
            minute: int.parse(element.toString().substring(3, 5)))
        .isBefore(DateTime.now()));
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
